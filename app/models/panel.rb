class Panel < ActiveRecord::Base
  has_and_belongs_to_many :labs
  has_and_belongs_to_many :test_types
end
