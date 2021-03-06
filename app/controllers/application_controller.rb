class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user # sets current user for session
 	@current_user ||= User.find(session[:user_id]["$oid"]) if session[:user_id]
 end
 helper_method :current_user

 def authorize # authorizes current user
 	redirect_to new_user_path unless current_user

 end
 
end
