class CollaborationsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :get_project
  
 # def new
 #   @member = @project.members.build
 # end

  def create
    
    user = User.find_or_initialize_by_email(params[:collaboration][:email])

    redirect_to collaborations_path,
       :notice => t('collaboration.already_invited', :email => user.email) and return if @project.collaborators.include?( user )

    # if user not registered in system then send invite him
    User.invite!(:email => params[:email]) if user.new_record?
    
    
   # @project = current_user.projects.new(params[:project])
    @project.collaborations.create!(:member_id => user.id, :role_id => params[:collaboration][:role_id])
   # @project.save
   # Collaboration.create!(:project_id => params[:collaboration][:project_id],
   #                       :member_id => user.id,
   #                       :role_id => params[:collaboration][:role_id]
   #                      )
    
    #  redirect_to @project, :notice => "Success"
    
    
   # @project.members << user #original
  #  Mailer.delay.invite(user, @project.name, user.password)

    redirect_to collaborations_path, :notice => t('collaboration.invited', :email => user.email)
  end

  def index
   # if @project.nil?
   #   redirect_to :controller => 'projects', :action => 'index'
   # end
    @collaboration = @project.collaborations.build
    @collaborations = @project.collaborations
    #@members = @project.members
  end

  def destroy
   # render :text => "fdfd"
    @project.collaborations.where(:member_id => params[:id]).first.destroy
    
    respond_to do |format|  
      format.html { redirect_to collaborations_path, :notice => t('collaboration.user_removed') }  
      format.js   { render :nothing => true }  
    end  
    
  end

  def show
  end

  protected
  
    def get_project
      # @project = Project.find_by_id(params[:project_id])
      @project = view_context.current_project
    end
  
end
