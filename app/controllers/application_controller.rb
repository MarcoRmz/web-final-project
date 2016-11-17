class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
 
  def master_server
    'http://127.0.0.1:3001'
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
