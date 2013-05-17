class Category < ActiveRecord::Base
  attr_accessible :assignment_id, :name
  has_many :assignment

end
