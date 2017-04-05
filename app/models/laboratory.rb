class Laboratory < ActiveRecord::Base
  validates :name, uniqueness: true
  has_many :labs
end
