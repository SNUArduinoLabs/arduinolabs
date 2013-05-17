class AddCategoryIdToAllAssignments < ActiveRecord::Migration
  def up
    Assignments.all.each do |asg|
      asg.category_id = 0
      asg.save
    end
  end

  def down

  end
end
