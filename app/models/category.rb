class Category < ActiveRecord::Base
  attr_accessible :assignment_id, :name
  belongs_to :assignment
end
