require 'factory_girl'

FactoryGirl.define do
	
  factory :user do
	  email 'user@test.com'
	  password 'please'
	end

  factory :venue do
    name 'Daily Grind'
    association :user
  end

  factory :feedback do
    text 'This is a piece of useful feedback'
    source 'dave@halogensunlight.co.uk'
    timestamp DateTime.now
    association :venue
  end
end