class ProjectsController < ApplicationController
  def participate
    @project = Project.find(params[:project_id])
    @contribution = Contribution.new
    @project.users << current_user unless @project.users.include? current_user
    redirect_to project_path(@project), notice: "Joined the project"
  end

  def index
    @projects = Project.all
  end

  def my_projects
    @projects = current_user.projects
  end

  def show
    @project = Project.find(params[:id])
  end

  def contributions
    @project = Project.find(params[:project_id])
    @contributions = @project.contributions.where("user_id = ?", current_user.id)
    @user = current_user
  end

  def add_contribution
    @project = Project.find(params[:project_id])
    @contribution = Contribution.new
    @contribution.user = current_user
    @contribution.project = @project
    if @contribution.save
      @contribution.create_activity key: "contribution.newly_added"
    end
    @project.contributions << @contribution
    redirect_to edit_contribution_path(@contribution), notice: "New contribution Added. Please add the required source-codes and attachmetns alongs with its description for feedback"
  end

end
