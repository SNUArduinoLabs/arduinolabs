class AddFurtherAuthenticationFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :log_in_counts, :integer, :default => 0
    add_column :users, :last_signed_in, :datetime
    add_column :users, :auth_token, :string
    add_column :users, :password_reset_token, :string
    add_column :users, :password_reset_token_sent_at, :datetime
  end
end
