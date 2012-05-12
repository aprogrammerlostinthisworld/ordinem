class ProjectsController < ApplicationController
  before_filter :authenticate_user!
  load_and_authorize_resource
  
  before_filter :get_project, :only => [:show, :edit, :update, :destroy]

  def index
    @projects = current_user.projects
    redirect_to :action => 'new' if @projects.empty?
  end

  def new
    @project = Project.new
  end
  
  def create
    @project = current_user.projects.new(params[:project])
    if @project.save
      redirect_to @project, notice => "Success"
    else
      render action: 'new'
    end
  end
  
  def show
    user_session[:current_project_id] = params[:id]
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      redirect_to @project, notice: "succes"
    else
      render action: 'new'
    end
  end

  def destroy
    @project.destroy
    redirect_to current_user.projects.first || new_project_path
  end
  
  private
  
    def get_project
      @project = Project.find_by_id(params[:id])
    end


end
