ActiveAdmin.register User do
  
  # For the 'New User' Form
  form :partial => "form"

  controller do

    def create
      @user = User.create(params[:user])
      @user.create_profile
      if @user.new_record?
        render :new, alert: "An Error Occurred"
      else
        redirect_to admin_users_path, notice: "Successfully Created"
      end
    end


  end
  


  # For the Index Page
  index do 
    column :name do |user|
      link_to user.full_name, admin_user_path(user)
    end
    column :department
    column :class_id do |user|
      user.class_id.ordinalize
    end

    default_actions
  end

  # For the Show Page
  show do |user|
    attributes_table do
      row :first_name
      row :last_name
      row :email
      row :university
      row :department
      row :class_id do |usr|
        usr.class_id.ordinalize
      end
    end
    active_admin_comments
  end

  # Filters
  filter :first_name_or_last_name, :as => :string
  filter :email
  filter :university
  filter :class_id

end
