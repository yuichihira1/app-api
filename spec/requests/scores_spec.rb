require 'rails_helper'
require 'spec_helper'



RSpec.describe "Scores", type: :request do
  describe "GET /scoreget" do
    it "works! (now write some real specs)" do
      get user_scoreget_path
      expect(response).to have_http_status(200)
    end
  end

  describe "POST /scorepost" do
    it "works! (now write some real specs)" do
      get user_scorepost_path
      expect(response).to have_http_status(200)
    end
  end
end
