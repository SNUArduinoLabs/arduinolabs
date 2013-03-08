class AddUserIdToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :user_id, :integer
  end
end
