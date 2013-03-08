class ApplicationController < ActionController::Base
  protect_from_forgery


  private
  def current_user
    @current_user ||= User.find_by_auth_token(cookies.signed[:auth_token]) if cookies.signed[:auth_token]
  end
  helper_method :current_user

  def authenticate_user 
    if current_user.nil?
      redirect_to new_session_path
    end
  end

  def authenticate_admin
    current_admin_user != nil
  end


end
