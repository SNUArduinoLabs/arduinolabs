class ChangeLevelInAssignments < ActiveRecord::Migration
  def up
    change_column :assignments, :level, :integer
  end

  def down
    change_column :assignments, :level, :string
  end
end
