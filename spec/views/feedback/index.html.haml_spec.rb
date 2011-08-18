require 'spec_helper'

describe "feedback/index.html.haml" do

  let(:venue) { mock_model(Venue).as_null_object}    
  let(:feedback) { mock_model(Feedback).as_null_object }    
  let(:feedback_2) { mock_model(Feedback).as_null_object }
  let(:feedback_3) { mock_model(Feedback).as_null_object }
  let(:fbk) { [feedback,feedback_2,feedback_3] }
 
  before do 
      Venue.stub!(:find).and_return(venue)
      venue.stub!(:feedback).and_return([])

      feedback.stub!(:source).and_return('user@example.com')
      feedback.stub!(:text).and_return('Yeah!')

      feedback_2.stub!(:source).and_return('+447966232749')
      feedback_2.stub!(:text).and_return('Boo!')

      feedback_3.stub!(:source).and_return('@bigmouth')
      feedback_3.stub!(:text).and_return('Hmm!')
  end

  it "lists the feedback for the venue" do
    assign(:feedback,fbk)
    assign(:venue,venue)
    render
    fbk.each {|f| rendered.should =~ /#{f.text}/ }
  end
end
