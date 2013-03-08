class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.string :title
      t.string :tagline
      t.text :content
      t.boolean :completed
      t.datetime :completed_at
      t.datetime :due_date
      t.integer :points

      t.timestamps
    end
  end
end
