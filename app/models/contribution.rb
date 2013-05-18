class Contribution < ActiveRecord::Base
  include PublicActivity::Common  

  attr_accessible :description, :project_id, :user_id, :status

  belongs_to :user
  belongs_to :project

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :source_codes, as: :source_codeable, dependent: :destroy
  has_many :attachments, as: :attachable, dependent: :destroy
  
  validates_presence_of :user, :project


end
