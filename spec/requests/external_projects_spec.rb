require 'rails_helper'

RSpec.describe "ExternalProjects", type: :request do
  describe "GET /external_projects" do
    it "works! (now write some real specs)" do
      get external_projects_path
      expect(response).to have_http_status(200)
    end
  end
end
