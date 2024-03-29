require 'rails_helper'
RSpec.describe Auth0Controller, type: :controller do
  describe "GET #callback" do
    it "returns http success" do
      get :callback
      expect(response).to have_http_status(:redirect)
    end
  end

  describe "GET #failure" do
    it "returns http success" do
      get :failure
      expect(response).to have_http_status(:redirect)
    end
  end
end
