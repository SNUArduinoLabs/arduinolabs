class SessionsController < ApplicationController
  def new
    if current_user
      redirect_to home_path
    end
  end

  def create
    user = User.find_by_email(params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      if params[:session][:remember_me]
        cookies.permanent.signed[:auth_token] =  user.auth_token
      else
        cookies.signed[:auth_token] = user.auth_token
      end
      redirect_to home_path, notice: "Logged in!"
    else
      flash.now.alert = "User information didn't match"
      render "new"
    end
  end

  def destroy
    cookies.delete(:auth_token)
    redirect_to home_path, :notice => "Logged Out!"
  end
end
