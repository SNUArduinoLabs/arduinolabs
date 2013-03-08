class CreateSourceCodes < ActiveRecord::Migration
  def change
    create_table :source_codes do |t|
      t.text :content

      t.timestamps
    end
  end
end
