class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.text :bio
      t.text :interests
      t.string :tagline
      t.string :avatar

      t.timestamps
    end
  end
end
