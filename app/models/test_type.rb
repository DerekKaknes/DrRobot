class TestType < ActiveRecord::Base
  has_and_belongs_to_many :panels
  belongs_to :unit
  accepts_nested_attributes_for :unit

  def reference_range
    if reference_type == "minimum"
      rr = "> #{reference_range_low}"
    elsif reference_type == "maximum"
      rr = "< #{reference_range_high}"
    elsif reference_type == "range"
      rr = "#{reference_range_low} - #{reference_range_high}"
    else
      rr = "#{reference_range_low} - #{reference_range_high}"
    end
    rr + (unit_name ? " (#{unit_name})" : "")
  end

  def unit_name
    unit.try(:name)
  end

end
