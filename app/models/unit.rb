class Unit < ActiveRecord::Base
  validates :name, uniqueness: { case_sensitive: false }
  has_many :test_types
end
