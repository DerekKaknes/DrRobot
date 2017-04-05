# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

["derek@aol.com", "test@gmail.com", "new_user@aol.com"].each do |email|
  User.create(email: email, password: "password")
end

["mg/dL", "ratio", "%", "mmol/L", "g/dL", "IU/L"].each do |unit|
  Unit.create(name: unit)
end

["Quest", "Spectra East, Inc"].each do |name|
  Laboratory.create(name: name)
end

mgdL = Unit.find_by(name: "mg/dL")
pc = Unit.find_by(name: "%")

TestType.create(name: "Glucose", description: "Measures the current blood sugar (glucose) level", unit: mgdL, reference_range_low: 65.0, reference_range_high: 99.0)
TestType.create(name: "GlycoHgb (A1c)", description: "Glycohemoglobin tests the amount of sugar (glucose) bound to hemoglobin molecules in the red blood cells.  GlycoHgb can serve as a measure of medium term (30 day) blood sugar levels.", unit: pc, reference_range_low: 4.0, reference_range_high: 5.6)

lab = Lab.create(user: User.first, order_date: Date.today, collection_date: Date.today, report_date: Date.today, requesting_physician: "Dr. John Doe", laboratory: Laboratory.first)

Test.create(lab: lab, test_type: TestType.first, value: 70)
Test.create(lab: lab, test_type: TestType.last, value: 6.0)
