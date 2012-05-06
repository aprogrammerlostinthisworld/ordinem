class PagesController < ApplicationController
  def home
  end

  def about
  end
  
  def errors
    if %w(no_js).include?(params[:id])
      render :layout => 'notification' 
    else
      redirect_to root_path
    end
  end
end
