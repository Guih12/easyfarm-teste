require 'rails_helper'

RSpec.describe "Tasks", type: :request do
  let!(:tasks) {create_list(:task, 3)}
  let(:tasks_id) {tasks.first.id}

  describe "GET /tasks" do
    before(:each) {get '/tasks'}

    it 'return status code 200' do
      expect(response).to have_http_status(200) 
    end
  end

  describe "GET /tasks:/id" do
    before(:each) {get "/tasks/#{tasks_id}"}
    
    context "when the task exists" do
      it 'return status code 200' do
        expect(response).to have_http_status(200) 
      end
    end

    context "when the task not exists" do
      let(:tasks_id) {100}

      it 'return status code 404' do
        expect(response).to have_http_status(404) 
      end

      it 'return message error' do
        expect(response.body).to match("{\"message\":\"Task not found\"}")  
      end
    end
    
  end
  

  describe "POST /tasks" do
    let!(:project) {create(:project)}
    let(:task_attributes) do
       {date: '2020-04-01', description: 'lorem', status: 'ok', project_id: project.id}
    end

    context "when the request tasks is valid" do
      before(:each) {post '/tasks', params: task_attributes}

      it 'return status code 201' do
        expect(response).to have_http_status(201) 
      end
    end
    
    context "when the request tasks is invalid" do
      before(:each) {post '/tasks', params: {}}

      it 'return status code 422' do
        expect(response).to have_http_status(422) 
      end

      it 'return message error' do
        expect(response.body).to match("{\"message\":\"Error in create task\"}") 
      end
    end
    
  end
  
  describe "PUT/tasks/:id" do
    context "when the task exists" do
      let(:task) {create(:task)}
      let(:task_attributes) do
        { description: 'lorem'}
      end
      before(:each) {put "/tasks/#{task.id}", params: task_attributes}

      it 'return status code 200' do 
        expect(response).to have_http_status(200) 
      end

      it 'update the task' do
        expect(task.reload).to have_attributes(task_attributes) 
      end
    end

    context "when the task not exists" do
      before(:each) {put "/tasks/0", params: attributes_for(:task)}

      it 'return status code 404' do
        expect(response).to have_http_status(404) 
      end

      it 'return message error' do
        expect(response.body).to match("{\"message\":\"Task not found\"}") 
      end
    end
    
  end
  

end
