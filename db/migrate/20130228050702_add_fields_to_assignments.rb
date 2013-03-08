class AddFieldsToAssignments < ActiveRecord::Migration
  def change
    add_column :assignments, :level, :string
    add_column :assignments, :difficulty, :integer
  end
end
