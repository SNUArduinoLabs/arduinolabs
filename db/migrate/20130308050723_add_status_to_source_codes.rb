class AddStatusToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :status, :string, :default => "pending"
  end
end
