class RemoveAssignmentIdFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :assignment_id
  end

  def down
    add_column :categories, :assignment_id, :integer
  end
end
