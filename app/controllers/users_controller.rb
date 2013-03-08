class UsersController < ApplicationController
  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to home_path, notice: "User's data successfully update."
    else
      flash[:alert] = "Please fix the following errors"
      render action: :edit
    end
  end

  def destroy
  end
end
