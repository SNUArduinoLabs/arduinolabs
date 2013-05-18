ActiveAdmin.register Project do
  controller do

    def new
      @project = Project.new
    end

    def create
      @project = Project.new(params[:project])
      if @project.save
        @project.create_activity key: "project.newly_added"
        redirect_to admin_projects_path
      else
        render :new
      end
    end

    def edit
      @project = Project.find(params[:id])
      @category = @project.category
    end

  end
  
  form :partial => "form"
  
  filter :category
  filter :title
  filter :status
  filter :difficulty
  filter :level


  index do 
    column :title do |project|
      link_to project.title, admin_project_path(project)
    end
    column :tagline
    column :points
    column :category

    default_actions
  end



  show do |project|
    attributes_table do
      row :id
      row :title
      row :tagline
      row :points
      row :level
      row :difficulty
      row :category do |project|
        project.category
      end
    end
    attributes_table do
      row :content do
        pre style: "background-color: #F5F5F5; padding: 1em; border: 1px solid" do
          project.content.html_safe
        end
      end
    end
    if project.attachments.any?
      render "attachments/list", current_model: project, active_admin: true
    end

    active_admin_comments
  end
end
