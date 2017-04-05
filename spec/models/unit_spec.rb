require 'rails_helper'

RSpec.describe Unit, type: :model do
  describe "attributes" do
    it "has a name" do
      unit = Unit.create(name: "mg/L")
      expect(unit.name).to eq("mg/L")
    end

    it "has uniqueness constraint on name" do
      Unit.create(name: "ratio")
      u = Unit.new(name: "ratio")
      expect(u.valid?).to be(false)
    end
  end

  describe "associations" do
    it "has_many tests" do
      unit = Unit.find_or_create_by(name: "mg/L")

      t1 = unit.test_types.create(name: "Glucose")
      t2 = unit.test_types.create(name: "Urea Nitrogen")
      unit.save
      expect(unit.test_types.count).to eq(2)
      expect(unit.test_types.pluck(:name)).to include(t1.name)
      expect(unit.test_types.pluck(:name)).to include(t2.name)

    end
  end
end
