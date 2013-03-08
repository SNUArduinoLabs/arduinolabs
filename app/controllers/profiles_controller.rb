class ProfilesController < ApplicationController
  
  before_filter :authenticate_user

  def show
    @profile = current_user.profile
  end

  def edit
    @profile = current_user.profile
  end

  def update
    @profile = current_user.profile
    respond_to do |format|
      if @profile.update_attributes(params[:profile])
        format.html { redirect_to profile_path(@profile), notice: "Successfully Edited" }
        format.js 
      else
        format.html { render :edit, alert: "An error occurred" }
        format.js
      end
    end
  end




end
