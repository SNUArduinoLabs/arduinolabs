class ChangeDueDateFieldOnAssignments < ActiveRecord::Migration
  def up
    change_column :assignments, :due_date, :time
  end

  def down
    change_column :assignments, :due_date, :datetime
  end
end
