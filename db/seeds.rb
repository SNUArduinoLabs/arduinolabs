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

SourceCode.all.each(&:destroy)
SourceCode.all.each(&:destroy)

Assignment.all.each(&:destroy)
Assignment.all.each(&:destroy)

Contribution.all.each(&:destroy)
Contribution.all.each(&:destroy)

Project.all.each(&:destroy)
Project.all.each(&:destroy)

Activity.all.each(&:destroy)
Activity.all.each(&:destroy)

Comment.all.each(&:destroy)
Comment.all.each(&:destroy)

Attachment.all.each(&:destroy)
Attachment.all.each(&:destroy)

SourceCode.all.each(&:destory)
SourceCode.all.each(&:destory)

Profile.all.each(&:destroy)
Profile.all.each(&:destroy)

User.all.each(&:destroy)
User.all.each(&:destroy)





