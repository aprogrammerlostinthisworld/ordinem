class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_locale
  
  rescue_from CanCan::AccessDenied do |exception|
   # if user_signed_in?
   #   redirect_to root_path, alert: 'Sorry, not allowed'
   # else
   #   redirect_to new_user_session_path, alert: 'You need to sign in or sign up before continuing'
   # end
    flash[:notice] = exception.message
    redirect_to root_path
  end
  
  private
  
    def set_locale
      if user_signed_in?
        I18n.locale = current_user.locale
      else
        I18n.locale = params[:locale] || I18n.default_locale
      end
    end
end
