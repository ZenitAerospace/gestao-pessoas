require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe ExternalProjectsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # ExternalProject. As you add validations to ExternalProject, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ExternalProjectsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all external_projects as @external_projects" do
      external_project = ExternalProject.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:external_projects)).to eq([external_project])
    end
  end

  describe "GET #show" do
    it "assigns the requested external_project as @external_project" do
      external_project = ExternalProject.create! valid_attributes
      get :show, params: {id: external_project.to_param}, session: valid_session
      expect(assigns(:external_project)).to eq(external_project)
    end
  end

  describe "GET #new" do
    it "assigns a new external_project as @external_project" do
      get :new, params: {}, session: valid_session
      expect(assigns(:external_project)).to be_a_new(ExternalProject)
    end
  end

  describe "GET #edit" do
    it "assigns the requested external_project as @external_project" do
      external_project = ExternalProject.create! valid_attributes
      get :edit, params: {id: external_project.to_param}, session: valid_session
      expect(assigns(:external_project)).to eq(external_project)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new ExternalProject" do
        expect {
          post :create, params: {external_project: valid_attributes}, session: valid_session
        }.to change(ExternalProject, :count).by(1)
      end

      it "assigns a newly created external_project as @external_project" do
        post :create, params: {external_project: valid_attributes}, session: valid_session
        expect(assigns(:external_project)).to be_a(ExternalProject)
        expect(assigns(:external_project)).to be_persisted
      end

      it "redirects to the created external_project" do
        post :create, params: {external_project: valid_attributes}, session: valid_session
        expect(response).to redirect_to(ExternalProject.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved external_project as @external_project" do
        post :create, params: {external_project: invalid_attributes}, session: valid_session
        expect(assigns(:external_project)).to be_a_new(ExternalProject)
      end

      it "re-renders the 'new' template" do
        post :create, params: {external_project: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested external_project" do
        external_project = ExternalProject.create! valid_attributes
        put :update, params: {id: external_project.to_param, external_project: new_attributes}, session: valid_session
        external_project.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested external_project as @external_project" do
        external_project = ExternalProject.create! valid_attributes
        put :update, params: {id: external_project.to_param, external_project: valid_attributes}, session: valid_session
        expect(assigns(:external_project)).to eq(external_project)
      end

      it "redirects to the external_project" do
        external_project = ExternalProject.create! valid_attributes
        put :update, params: {id: external_project.to_param, external_project: valid_attributes}, session: valid_session
        expect(response).to redirect_to(external_project)
      end
    end

    context "with invalid params" do
      it "assigns the external_project as @external_project" do
        external_project = ExternalProject.create! valid_attributes
        put :update, params: {id: external_project.to_param, external_project: invalid_attributes}, session: valid_session
        expect(assigns(:external_project)).to eq(external_project)
      end

      it "re-renders the 'edit' template" do
        external_project = ExternalProject.create! valid_attributes
        put :update, params: {id: external_project.to_param, external_project: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested external_project" do
      external_project = ExternalProject.create! valid_attributes
      expect {
        delete :destroy, params: {id: external_project.to_param}, session: valid_session
      }.to change(ExternalProject, :count).by(-1)
    end

    it "redirects to the external_projects list" do
      external_project = ExternalProject.create! valid_attributes
      delete :destroy, params: {id: external_project.to_param}, session: valid_session
      expect(response).to redirect_to(external_projects_url)
    end
  end

end