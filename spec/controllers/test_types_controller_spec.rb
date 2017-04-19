require 'rails_helper'

RSpec.describe TestTypesController, type: :controller do

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #create" do
    it "returns http success" do
      p = {test_type: {
        name: "Test Test"
        }
      }

      get :create, p
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: TestType.first
      expect(response).to have_http_status(:success)
    end
  end

end
