class Comment < ActiveRecord::Base
  attr_accessible :commentable_id, :commentable_type, :content

  belongs_to :user
  belongs_to :commentable, polymorphic: true

  validates_presence_of :user
  validates_presence_of :content

end
