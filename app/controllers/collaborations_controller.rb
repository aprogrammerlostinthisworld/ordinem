class CollaborationsController < ApplicationController
  before_filter :get_project
  
 # def new
 #   @member = @project.members.build
 # end

  def create
    
    user = User.find_or_initialize_by_email(params[:email].strip)

    redirect_to project_collaborations_path(@project),
       :notice => "#{user.email} is already invited" and return if @project.collaborators.include? user

    User.invite!(:email => params[:email]) if user.new_record?
    
    @project.users << user
  #  Mailer.delay.invite(user, @project.name, user.password)

    redirect_to project_collaborations_path(@project), :notice => "#{user.email} is invited to the project"
  end

  def index
    @collaboration = @project.collaborations.build
    @users = @project.members
  end

  def destroy
  ##  @project.collaborations.where(user_id: params[:id]).first.destroy
  #  redirect_to project_collaborations_path(@project), :notice => "User removed from the project"
  end

  protected
  def get_project
    # @project = Project.find_by_id(params[:project_id])
    @project = view_context.current_project
  end
end
