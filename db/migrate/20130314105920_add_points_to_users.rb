class AddPointsToUsers < ActiveRecord::Migration
  def up
    add_column :users, :points, :integer, :default => 0

    User.all.each do |user|
      user.points = 0
    end


  end
  def down
    remove_column :users, :points
  end
end
