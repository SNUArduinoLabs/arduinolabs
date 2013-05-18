class CreateUsersProjects < ActiveRecord::Migration
  def change
    create_table :projects_users, :id => false do |t|
      t.integer :user_id
      t.integer :project_id
    end
  end
end
