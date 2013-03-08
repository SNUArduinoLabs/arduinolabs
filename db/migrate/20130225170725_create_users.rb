class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.string :university
      t.string :department
      t.integer :class_id

      t.timestamps
    end
  end
end
