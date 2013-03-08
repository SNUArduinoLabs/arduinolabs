class Profile < ActiveRecord::Base
  attr_accessible :bio, :interests, :tagline, :avatar

  belongs_to :user
  
  mount_uploader :avatar, AvatarUploader

end
