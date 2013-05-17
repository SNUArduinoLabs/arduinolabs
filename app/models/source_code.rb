class SourceCode < ActiveRecord::Base
  attr_accessible :content

  belongs_to :source_codeable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable

  validates_presence_of :user
  validates_presence_of :name
#  validates_inclusion_of :status, in: %w(pending requires_modification completed)

  scope :latest, order("created_at desc")
  scope :pending, where(:status => :pending)
  scope :rejected, where(:status => :requires_modification)
  scope :completed, where(:status => :completed)
  mount_uploader :content, SourceCodeUploader

  def reject!
    self.status = :requires_modification
    self.save
  end

  def approve!
    self.status = :completed
    self.save
    self.source_codeable.complete!
  end
end
