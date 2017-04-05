class Lab < ActiveRecord::Base
  belongs_to :user
  belongs_to :laboratory
  has_many :panels
  has_many :tests
  has_many :test_types, through: :tests
end
