class AddModifiedFieldsToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :source_codeable_id, :integer
    add_column :source_codes, :source_codeable_type, :string
    remove_column :source_codes, :source_codable_id
    remove_column :source_codes, :source_codable_type
  end
end
