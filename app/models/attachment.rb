class Attachment < ActiveRecord::Base
  attr_accessible :filename, :filename_cache

  belongs_to :attachable, polymorphic: true
  mount_uploader :filename, AttachmentUploader  

end
