class Lab < ActiveRecord::Base
  has_and_belongs_to_many :panels
  belongs_to :user
  belongs_to :laboratory
  has_many :tests
  has_many :test_types, through: :tests

  def self.new_from_pdf(pdf)
    lab = self.new
    reader = PDF::Reader.new(pdf)
    full_text = reader.pages.map(&:text).reduce(&:+)
    lines = full_text.strip.split("\n")
    results_start_index = lines.find_index { |e| e.match(/NAME\s*VALUE\s*REFERENCE RANGE/) }
    raw_results = lines.from(results_start_index + 1)
    rough_parse_results = raw_results.map { |e| e.strip.split(/\s{3,}/) }.reject { |e| e.empty? or e.length != 4 }
    rough_parse_results.map do |row|
      name, value, reference_type, reference_range_low, reference_range_high, units_name = lab.parse_results_row(row)

      unit = Unit.find_or_initialize_by(name: units_name) if units_name
      test_type = TestType.find_or_initialize_by(name: name)
      test_type.reference_type ||= reference_type
      test_type.reference_range_low ||= reference_range_low
      test_type.reference_range_high ||= reference_range_high
      test_type.unit ||= unit
      lab.tests.build(test_type: test_type, value: value)
    end

    return lab
  end

  # private

  def parse_results_row(row)
    name = row[1]
    value = row[2]
    ref_range = row[3].split(/\s*\(/).first
    logger.debug("RefRange: #{ref_range}")
    reference_type, reference_range_low, reference_range_high = parse_reference_range(ref_range)
    units_name = row[3].scan(/\(([^\)]+)\)/).try(:last).try(:first)
    return name, value, reference_type, reference_range_low, reference_range_high, units_name
  end

  def parse_reference_range(ref_range)
    ref_range.strip!
    if ref_range.match(/>/)
      reference_type = "minimum"
      reference_range_low = ref_range.scan(/\d*[,]?\d*[.]?\d*/).first.to_f
      reference_range_high = nil
      logger.debug("Determined #{ref_range} to be a minimum")
    elsif ref_range.match(/</)
      reference_type = "maximum"
      reference_range_low = nil
      reference_range_high = ref_range.scan(/\d*[,]?\d*[.]?\d*/).first.to_f
      logger.debug("Determined #{ref_range} to be a maximum")
    elsif ref_range.match(/-/)
      reference_type = "range"
      reference_range_low, reference_range_high = ref_range.split(/-/).flat_map(&:to_f)
      logger.debug("Determined #{ref_range} to be a range")
    end
    return reference_type, reference_range_low, reference_range_high
  end

end
