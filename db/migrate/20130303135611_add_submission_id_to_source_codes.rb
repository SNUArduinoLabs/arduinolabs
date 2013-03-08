class AddSubmissionIdToSourceCodes < ActiveRecord::Migration
  def change
    add_column :source_codes, :submission_id, :integer
  end
end
