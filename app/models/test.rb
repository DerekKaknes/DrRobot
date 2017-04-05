class Test < ActiveRecord::Base
  belongs_to :lab
  belongs_to :test_type
  has_one :user, through: :lab
end
