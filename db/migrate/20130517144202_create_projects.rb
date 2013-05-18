class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :tagline
      t.string :content
      t.integer :points
      t.integer :difficulty
      t.integer :level
      t.integer :category_id
      t.string :status, :default => "STARTED"

      t.timestamps
    end
  end
end
