# TODO test not complete
require 'rails_helper'

# testing the database controller
RSpec.describe WelcomeController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #record" do
    it "returns http success" do
      post :record
      expect(response).to have_http_status(:success)
    end
  end

  it "records user registration" do
    expect(User.first).to be_nil
    post :record, user_name: 'cara'
    expect(User.first).to be_a(User)
    expect(User.first.user_name).to eq('cara')
  end
end
