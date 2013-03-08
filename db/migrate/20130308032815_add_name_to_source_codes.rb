class AddNameToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :name, :string
  end
end
