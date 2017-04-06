class LabReportReader < PDF::Reader
  def parse_lab_report_from_pdf
    full_text = self.pages.map(&:text).reduce(&:+)
    lines = full_text.strip.split("\n")
    results_start_index = lines.find_index { |e| e.match(/NAME\s*VALUE\s*REFERENCE RANGE/) }
    raw_results = lines.from(results_start_index + 1)
    rough_parse_results = raw_results.map { |e| e.strip.split(/\s{3,}/) }.reject { |e| e.empty? or e.length != 4 }
    test_results = rough_parse_results.map do |row|
      name = row[1]
      value = row[2]
      reference_range_low, reference_range_high = row[3].scan(/\d+/).flat_map(&:to_f)
      units_name = row[3].scan(/\(([^\)]+)\)/).try(:last).try(:first)
      unit = Unit.find_or_create_by(name: units_name) if units_name
      test_type = TestType.find_or_create_by(name: name, unit: unit,
                                             reference_range_low: reference_range_low,
                                             reference_range_high: reference_range_high
                                            )
      test = Test.new(test_type: test_type, value: value)
    end
  end
end
