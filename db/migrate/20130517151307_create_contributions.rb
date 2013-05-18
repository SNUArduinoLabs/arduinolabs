class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.integer :project_id
      t.integer :user_id
      t.string :description

      t.timestamps
    end
  end
end
