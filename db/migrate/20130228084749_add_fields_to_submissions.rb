class AddFieldsToSubmissions < ActiveRecord::Migration
  def change
    add_column :submissions, :completed, :boolean
    add_column :submissions, :completed_at, :datetime
  end
end
