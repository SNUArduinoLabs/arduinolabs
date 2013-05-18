# encoding: UTF-8

class ContributionsController < ApplicationController

  before_filter :authenticate_user

  def show
    @contribution = Contribution.find(params[:id])
  end


  def edit
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])
    if @contribution.update_attributes(params[:contribution])
      redirect_to contribution_path(@contribution), notice: "Successfully Edited"
    else
      render :edit
    end
  end



end
