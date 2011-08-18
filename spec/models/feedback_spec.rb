require 'spec_helper'
require 'factory_girl'

describe Feedback do
  let (:venue)    { FactoryGirl.create(:venue)    }
  let (:feedback) { FactoryGirl.create(:feedback) }
  
  it 'should create valid instance' do
      
  end

  it 'should have a timestamp' do
    feedback.timestamp.should be_instance_of DateTime
  end
  
  it 'should have a venue' do
    should belong_to(:venue)
  end
    
end

