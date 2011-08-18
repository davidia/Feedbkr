# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)

puts 'creating user'
user =
 User.create! :name => 'First User', :email => 'user@test.com', :password => 'please', :password_confirmation => 'please'

puts 'Creating venues'
daily_grind = Venue.create! name: 'Daily Grind'
ribshack	  = Venue.create! name: "Fat Bill's Rib Shack"
salon	  = Venue.create! name: "Big 'Dos Salon"

user.venues << daily_grind
user.venues << ribshack
user.venues << salon

puts "Creating feedback"
daily_grind.feedback.create(text: 'My latte is cold :(', source: 'jim@example.com')
daily_grind.feedback.create(text: 'I love the new muffins!', source: 'sally@boooo.com')

 
ribshack.feedback << Feedback.new(text: 'There is a fly in my soup',source: 'lisa@joke.com')
ribshack.feedback << Feedback.new(text: 'The hot sauce needs more chilli',source: 'jim@example.com')

salon.feedback << Feedback.new(text: 'I love my hair do',source: 'peter@example.com')

