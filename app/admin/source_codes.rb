ActiveAdmin.register SourceCode do

  scope :pending, default: true do |codes|
    SourceCode.pending
  end

  scope :latest
  scope :rejected
  scope :completed

  index do
    column :name do |code|
      link_to code.name, admin_source_code_path(code)
    end
    column :status do |code|
      strong do
        code.status
      end
    end
    column :uploaded_at, :sortable => :created_at do |code|
      code.created_at
    end
    column "View" do |code|
      link_to "View", admin_source_code_path(code)
    end
  end

  filter :created_at
  filter :name

  show do |code|
    attributes_table do
      row :name
      row :status
      row "User" do |src|
        src.user
      end
      row "Related to Assignment" do |src|
        src.source_codeable.assignment.title
      end
      row :created_at
    end
    attributes_table do
      row "Source Code" do  
        render 'source_codes/code', source_code: code, file: File.open(Rails.public_path + code.content.url, "r").read
      end
    end
    attributes_table do
      row "Comments" do
        render "code_comments", source_code: code
      end
    end
  end

  # Member actions in the Show Page


  action_item :only => :show do
    link_to "Approve", approve_path(source_code) if source_code.status == :pending
  end

  action_item :only => :show do
    link_to "Reject", reject_path(source_code) if source_code.status == :pending

  end



end


