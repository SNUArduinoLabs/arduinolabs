class AddFieldsToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :source_codable_id, :integer
    add_column :source_codes, :source_codable_type, :string
    remove_column :source_codes, :submission_id
  end
end
