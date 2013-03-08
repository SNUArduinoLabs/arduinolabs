class RemoveFieldsFromAssignments < ActiveRecord::Migration
  def up
    remove_column :assignments, :due_date
    remove_column :assignments, :completed
    remove_column :assignments, :completed_at
  end

  def down
    add_column :assignments, :due_date, :date
    add_column :assignments, :completed, :boolean
    add_column :assignments, :completed_at, :datetime
  end
end
