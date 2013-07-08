class TasksController < ApplicationController
  respond_to :html
  
  before_action :authenticate_user!
  
  def index
    @tasks = Task.where(user_id: current_user.id)
    respond_with(@tasks)
  end
  
  def show
    @task = Task.find_by(id: params[:id])
    respond_with(@task)
  end
  
  def new
    @task = Task.new
  end
  
  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.success')
    end
  end
  
  def edit
    @task = Task.find_by(id: params[:id])
    respond_with(@task)
  end
  
  def update
    @task = Task.find_by(id: params[:id])
    @task.assign_attributes(task_params)
    if @task.save
      redirect_to tasks_path, notice: t('.success')
    end
  end
  
  def destroy
    @task = Task.find_by(id: params[:id])
    if @task.delete
      redirect_to tasks_path, notice: t('.success')
    end
  end
  
  def done
    done = params.fetch(:done, false)
    @task = Task.find_by(id: params[:task_id])
    @task.assign_attributes(done: done)
    if @task.save
      render :json => { status: params[:done] }
    end
  end
  
  private
  
  def task_params
    params.require(:task).permit(:user_id, :name, :description, :done)
  end  
end
