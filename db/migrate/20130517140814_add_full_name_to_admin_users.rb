class AddFullNameToAdminUsers < ActiveRecord::Migration
  def up
    add_column :admin_users, :full_name, :string
    AdminUser.first.update_attributes(:full_name => "Admin")
  end
  def down
    remove_column :admin_users, :full_name
  end
end
