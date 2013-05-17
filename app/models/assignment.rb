class Assignment < ActiveRecord::Base
  include PublicActivity::Common  

  # Not accessable is :completed, :completed_at
  attr_accessible :content, :due_date, :points, :tagline, :title, :level, :difficulty, :category_attributes, :category_id

  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :submissions
  belongs_to :category

  #accepts_nested_attributes_for :category

  # Validations
  validates_inclusion_of :difficulty, :level, in: 1..3, message: "Should be an integer from 1 ~ 3"
  validates_presence_of :content, :tagline, :title, :points, :level, :difficulty, :category

end
