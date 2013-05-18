class Project < ActiveRecord::Base
  include PublicActivity::Common  
  attr_accessible :category_id, :content, :difficulty, :level, :points, :tagline, :title

  belongs_to :category
  has_and_belongs_to_many :users

  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :contributions, dependent: :destroy
  has_many :comments, as: :commentable

  def complete!
    self.status = "COMPLETED"
    self.save
  end

#  def status
#    status
#  end
end
