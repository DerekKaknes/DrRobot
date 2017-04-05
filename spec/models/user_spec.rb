require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
      @user = User.create(email: "derek@aol.com", password: "test123")
  end
  after(:all) do
    @user.destroy!
  end
  describe "can create user with secure password" do
    it "can authenticate password" do
      expect(@user.valid_password?("test123")).to be(true)
    end
  end

  describe "delegates attributes to profile" do
    before(:all) do
      @profile = Profile.create!(firstname: "Derek", lastname: "Kaknes", gender: "m")
      @profile.user = @user
      @profile.save
    end

    after(:all) do
      @profile.destroy!
    end

    it "accesses profile attributes" do
      expect(@user.firstname).to eq("Derek")
      expect(@user.lastname).to eq("Kaknes")
      expect(@user.gender).to eq("m")
    end
  end
end
