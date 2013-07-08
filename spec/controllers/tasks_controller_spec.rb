require 'spec_helper'

describe TasksController do

  before do
    @user = FactoryGirl.create(:user)
    sign_in @user
  end
  
  let(:task) { FactoryGirl.create(:task, user_id: @user.id) }
  
  describe "GET #index" do
    
    it "assign two tasks to @tasks" do
      task1, task2 = FactoryGirl.create(:task, user_id: @user.id), FactoryGirl.create(:task, user_id: @user.id)
      get :index
      expect(assigns(:tasks)).to match_array([task1, task2])
    end
    
    it "render :index view" do
      get :index
      expect(response).to render_template :index
    end
  end
  
  describe "GET show" do
    
    it "assign a task to @task" do
      get :show, id: task.id
      expect(assigns(:task)).to eql(task)
    end
    
    it "render :show view" do
      get :show, id: task.id
      expect(response).to render_template :show
    end
  end
  
  describe "GET new" do
    
    it "render :new view" do
      get :new
      expect(response).to render_template :new
    end
  end
  
  describe "POST create" do
    
    it "should be redirect back to the tasks" do
      post :create, task: { name: "Test name", description: "Lorem ipsun..."}
      expect(response).to redirect_to "http://test.host/tasks"
    end
  end
  
  describe "GET edit" do
    
    it "render :edit view" do
      get :edit, id: task.id
      expect(response).to render_template :edit
    end
  end
  
  describe "PUT update" do
    
    it "should be redirect to tasks" do
      put :update, id: task.id, task: { name: "Changed name" }
      expect(response).to redirect_to "http://test.host/tasks"
    end
  end
  
  describe "DELETE destroy" do
    
    it "should be redirect to tasks" do
      delete :destroy, id: task.id
      expect(response).to redirect_to "http://test.host/tasks"
    end
  end
  
  describe "GET done" do
    
    it "should response a json" do
      get :done, task_id: task.id, done: true
      expect(response.body).to eql({ status: true }.to_json)
    end
  end
end
