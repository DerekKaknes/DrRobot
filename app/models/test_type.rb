class TestType < ActiveRecord::Base
  has_and_belongs_to_many :panels
  belongs_to :unit
end
