class AddAuthTokenForAllUsers < ActiveRecord::Migration
  def up
    User.all.each do |user|
      unless user.auth_token
        user.generate_token(:auth_token)
        user.save
      end
    end

  end

  def down
    User.all.each do |user|
      user.auth_token = nil
      user.save
    end
  end
end
