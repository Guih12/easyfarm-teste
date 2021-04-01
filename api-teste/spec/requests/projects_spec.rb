require 'rails_helper'

RSpec.describe "Projects", type: :request do
  let!(:projects) {create_list(:project, 3)}
  let(:projects_id) {projects.first.id}
  
  describe "GET /projects" do
    before(:each) {get "/projects"}

    it 'returns status code 200' do
      expect(response).to have_http_status(200)   
    end
  end

  describe "GET /projects/:id" do
    before(:each) {get "/projects/#{projects_id}"}
    
    context "when project exists" do
      it 'return staus code 200' do
        expect(response).to have_http_status(200)
      end
    end
    context "when project not exists" do
      let(:projects_id) {100}
      
      it 'returns status code 404' do
        expect(response).to have_http_status(404) 
      end
      
      it 'retuns a not found message' do
        expect(response.body).to match("{\"message\":\"Project not found\"}") 
      end
    end
    
  end

  describe "POST/projects" do
    let(:project) {create(:project)}
    let(:project_attributes) {attributes_for(:project)}

    context "when the request project is valid" do
      before(:each) {post '/projects', params: project_attributes}

      it 'retuns status code 201' do
        expect(response).to have_http_status(201) 
      end
    end
    
    context "when the request project is invalid" do
      before(:each) {post '/projects', params: {name: nil}}

      it 'retuns status code 422' do
        expect(response).to have_http_status(422) 
      end

      it 'retuns message error' do
        expect(response.body).to match("{\"message\":\"Error in create project\"}")  
      end
    end
  end


  describe "PUT/projects" do
    context "when the project exists" do
      let(:project) {create(:project)}
      let(:project_attributes) {attributes_for(:project)}

      before(:each) {put "/projects/#{project.id}", params: project_attributes}

      it 'retuns status code 200' do
        expect(response).to have_http_status(200)  
      end

      it 'update the project ' do
        expect(project.reload).to have_attributes(project_attributes) 
      end
    end
    
    context "when the project not exits" do
      before(:each) {put "/projects/0", params: attributes_for(:project)}

      it 'return status code 404' do
        expect(response).to have_http_status(404) 
      end

      it 'return message error' do
        expect(response.body).to match("{\"message\":\"Project not found\"}")
      end
    end
  end
end
