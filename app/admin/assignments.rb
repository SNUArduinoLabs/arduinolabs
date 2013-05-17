ActiveAdmin.register Assignment do

  controller do 

    def new
      @assignment = Assignment.new
      #@assingment.build_category
      #      @attachment = @assignment.attachments.build
    end

    def create
      @assignment = Assignment.new(params[:assignment])
      if @assignment.save
        redirect_to admin_assignments_path
      else
        render :new
      end
    end

    def edit
      @assignment = Assignment.find(params[:id])
      @category = @assignment.category
    end


  end

  form :partial => "form"


  #  index :as => :grid do |assignment|
  #    if assignment.attachments.exists?
  #      link_to(image_tag(assignment.attachments.first.filename.url(:thumb)), admin_assignment_path(assignment))
  #    end
  #  end


  #  form do |f|
  #    f.inputs do 
  #      f.input :title
  #      f.input :content, :input_html => { :class => "ckeditor" }
  #    end
  #    f.buttons
  #  end

  ##################


  # For the Index Page
  index do 
    column :title do |assignment|
      link_to assignment.title, admin_assignment_path(assignment)
    end
    column :tagline
    column :points

    default_actions
  end


  show do |assignment|
    attributes_table do
      row :id
      row :title
      row :tagline
      row :points
      row :level
      row :difficulty
      row :category do |assignment|
        assignment.category
      end
    end
    attributes_table do
      row :content do
        pre style: "background-color: #F5F5F5; padding: 1em; border: 1px solid" do
          assignment.content.html_safe
        end
      end
    end
    if assignment.attachments.any?
      render "attachments/list", current_model: assignment, active_admin: true
    end

    active_admin_comments
  end

  # For the Show Page
  #  show do |user|
  #    attributes_table do
  #      row :first_name
  #      row :last_name
  #      row :email
  #      row :university
  #      row :department
  #      row :class_id do |usr|
  #        usr.class_id.ordinalize
  #      end
  #    end
  #    active_admin_comments
  #  end

  # Filters
  filter :title
end
