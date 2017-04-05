require 'rails_helper'

RSpec.describe Profile, type: :model do
  before(:all) do
    profile_attributes = {
      firstname: "Derek",
      lastname: "Kaknes",
      gender: "m",
      date_of_birth: "19860910",
      ethnicity: "white",
      user_id: nil
    }
    @p = Profile.create!(profile_attributes)
  end

  after(:all) do
    @p.destroy!
  end

  describe "has valid attributes" do

    it "has a firstname" do
      expect(@p.firstname).to eq("Derek")
    end

    it "has a lastname" do
      expect(@p.lastname).to eq("Kaknes")
    end

    it "has a date_of_birth" do
      dob = Date.new(1986, 9, 10)
      expect(@p.date_of_birth).to eq(dob)
    end
  end

  describe "accepts date_of_birth from string" do
    it "accepts YYYYMMDD format" do
      dob = Date.new(2001, 9, 11)
      Profile.create!(date_of_birth: "20010911")
      profile = Profile.last
      expect(profile.date_of_birth).to eq(dob)
    end
  end

  describe "belongs_to a User" do
    before(:all) do
      @user = User.create!(email: "derek@aol.com", password: "test123")
      @p.user = @user
      @p.save
    end

    after(:all) do
      @user.destroy!
    end

    it "saves a user association" do
      expect(@p.user).to eq(@user)
    end
  end
end
