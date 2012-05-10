class PagesController < ApplicationController

  def show
    redirect_to :action => 'home' if params[:id] == 'home'
    
    @page = Page.find_by_name(params[:id], :conditions => ['locale =?', I18n.locale])
    redirect_to root_path if @page.blank?
  end
  
  def home
  end

  def errors
    if %w(no_js).include?(params[:id])
      render :layout => 'notification' 
    else
      redirect_to root_path
    end
  end
end
