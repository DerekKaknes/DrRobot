class Lab < ActiveRecord::Base
  has_and_belongs_to_many :panels
  belongs_to :user
  belongs_to :laboratory
  has_many :tests
  has_many :test_types, through: :tests
end
