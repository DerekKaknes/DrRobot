require 'rails_helper'

RSpec.feature "Create TestType", type: :feature do
  scenario "Admin user creates a new TestType" do
    visit new_test_type_path

    fill_in "Name", with: "Glucose"
    fill_in "Description", with: "Blood sugar level"
    find(:select, "test_type_reference_type").find(:option, "Range").select_option
    fill_in "Reference range low", with: 65
    fill_in "Reference range high", with: 99
    fill_in "test_type_unit_attributes_name", with: "mg/dL"
    click_button "Create Test type"

    tt = TestType.last
    expect(Unit.last.name).to eq("mg/dL")
    expect(tt.name).to eq("Glucose")
    expect(tt.unit).to eq(Unit.last)
    expect(tt.description).to eq("Blood sugar level")

  end

end

