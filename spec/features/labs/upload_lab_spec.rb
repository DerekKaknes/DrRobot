require 'rails_helper'

RSpec.feature "Upload Lab", type: :feature do
  scenario "User uploads a pdf of lab results" do
    visit new_lab_path

    # fill_in "#lab_pdf", with: "#{Rails.root}/public/2017LabResults.pdf"
    find("#lab_pdf").set("#{Rails.root}/public/2017LabResults.pdf")
    click_button "Upload PDF"
  end

end

