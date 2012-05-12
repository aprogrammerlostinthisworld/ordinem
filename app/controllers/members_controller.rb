class MembersController < ApplicationController
  before_filter :get_project
  
 # def new
 #   @member = @project.members.build
 # end

  def create
    
    user = User.find_or_initialize_by_email(params[:email].strip)
    render :text => user
  #  user = User.find_or_initialize_by_email(params[:member][:email].strip)
  #  
  #  redirect_to project_members_path(@project),
  #     :notice => "#{user.username} is already invited" and return if @project.collaborators.include? user

    # user.generate_pwd! and user.save if user.new_record?
    
  #  @project.peoples << user
  #  Mailer.delay.invite(user, @project.name, user.password)

  #  redirect_to project_members_path(@project), :notice => "#{user.display_name} is invited to the project"
  end

  def index
    @member = @project.members.build
    @members = @project.members
  end

  def destroy
    @project.members.where(user_id: params[:id]).first.destroy
    redirect_to project_collaborations_path(@project), :notice => "User removed from the project"
  end

  protected
  def get_project
    # @project = Project.find_by_id(params[:project_id])
    @project = view_context.current_project
  end
end
