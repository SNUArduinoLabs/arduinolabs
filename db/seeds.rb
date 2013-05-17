# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#


#AdminUser.create!(:email => 'admin@atsnu.com', :password => 'password', :password_confirmation => 'password')

Category.all.each(&:destroy)
Category.all.each(&:destroy)

CATEGORIES = ["Art", "Electronics", "Arduino"]

CATEGORIES.each do |cat|
  Category.create(name: cat)
end

Submission.all.each(&:destroy)
Submission.all.each(&:destroy)



