class Test < ActiveRecord::Base
  belongs_to :lab
  belongs_to :test_type
  has_one :user, through: :lab

  delegate :name, to: :test_type, allow_nil: true
  delegate :reference_range, to: :test_type, allow_nil: true
  delegate :reference_type, to: :test_type, allow_nil: true
  delegate :reference_range_low, to: :test_type, allow_nil: true
  delegate :reference_range_high, to: :test_type, allow_nil: true
  delegate :unit_name, to: :test_type, allow_nil: true

end
