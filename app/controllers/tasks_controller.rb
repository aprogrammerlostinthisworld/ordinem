class TasksController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  before_filter :get_task, :only => [:show, :edit, :update, :destroy]
  
  def new
    @task = Task.new(params[:task])
    @task.user = current_user
  end
  
  def show
  end
  
  def edit
  end
  
  
  def set_complete
    @task = Task.find_by_id(params[:id])
    if @task.update_attributes(:status => 1)
      redirect_to root_path
    else
      redirect_to root_path
    end
  end
  
  def create
    @task = Task.new(params[:task])
   # @task.owner = current_user
    if @task.save
      # redirect_to(@task.project, :notice => 'Comment was successfully created.')
      redirect_to(project_path(params[:project_id]), :notice => 'Task was successfully created.')
    else
      redirect_to(project_path(params[:project_id]), :notice => 'Error! Comment was\'nt created.')
    end
  end
  
  def update
    if @task.update_attributes(params[:task])
     # redirect_to(project_path(params[:project_id]), :notice => 'Task was successfully updated.')
      redirect_to(root_path, :notice => 'Task was successfully updated.')
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @task.destroy
    respond_to do |format|  
      format.html { redirect_to(project_path(params[:project_id])) }  
      format.js   { render :nothing => true }  
    end  
  end
  
  private
  
    def get_task
      @task = Task.find_by_id(params[:id])
    end
end
