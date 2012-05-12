class DashboardController < ApplicationController
  before_filter :authenticate_user!
  #load_and_authorize_resource
  
  helper :application
  
  def index
    if view_context.current_project.blank?
      redirect_to :controller => 'projects', :action => 'index'
    end
  end
end
