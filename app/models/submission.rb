class Submission < ActiveRecord::Base
  attr_accessible :assignment_id, :feedback, :user_id, :completed, :completed_at

  belongs_to :user
  belongs_to :assignment

  has_many :comments, as: :commentable
  has_many :source_codes, as: :source_codeable
  has_many :attachments, as: :attachable, dependent: :destroy


  # Validations
  validates_presence_of :user, :assignment

  def complete!
    self.completed = true
    self.completed_at = Time.now
    self.user.points += self.assignment.points
    self.user.save
    self.save
  end



end
