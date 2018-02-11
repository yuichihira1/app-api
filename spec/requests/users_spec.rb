require 'rails_helper'
require 'spec_helper'


RSpec.describe "Users", type: :request do
  include Rack::Test::Methods

  #GET /users
  describe "GET /users" do
    before(:each) do
      @user = FactoryBot.create(:user)
      get user_path(@user)
      @json = JSON.parse(response.body)
      application_json
      login_user
      authenticate
    end

    #トークン認証
    it 'トークン認証する' do
       GET '/user/1', {}, @env
    end
　　
    #１件のユーザーを取得
    it "200が返ってくる" do
      get user_path
      expect(response).to have_http_status(200)
    end
  end

  #POST/users
  describe "POST /users" do

    before(:each) do
      application_json
      @params = FactoryGirl.attributes_for(:user)
    end

    it '200が返ってくる' do
      post users_path, @params
      expect(response).to be_success
      expect(response.status).to eq 200
    end

    it 'Userレコードが1増える' do
      expect { post users_path, @params }.to change(User, :count).by(1)
    end
  end


end
