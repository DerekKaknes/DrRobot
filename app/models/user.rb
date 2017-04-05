class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile

  delegate :firstname, to: :profile, allow_nil: true
  delegate :lastname, to: :profile, allow_nil: true
  delegate :gender, to: :profile, allow_nil: true
  delegate :date_of_birth, to: :profile, allow_nil: true
  delegate :zipcode, to: :profile, allow_nil: true
end
