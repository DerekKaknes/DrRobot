require 'rails_helper'

RSpec.describe Laboratory, type: :model do
  describe "associations" do
    it "has_many labs" do
      laboratory = Laboratory.create!(name: "Dexter's Laboratory")
      laboratory.labs.create!(order_date: Date.today)
      laboratory.labs.create!(order_date: Date.new(2001, 9, 11))
      laboratory.save
      expect(laboratory.labs.count).to eq(2)
    end
  end
end
