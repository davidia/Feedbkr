require 'spec_helper'

describe FeedbackController do  
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

  describe "GET index" do
    it "fetches the feedback for a venue" do
      venue.feedback.should_receive(:all).and_return(fbk)      
      get :index,venue_id:0      
    end
  end

  describe "POST create" do

    

    it "creates feedback" do               
      Feedback.should_receive(:new).with("text" => "I love you guys","source" => "alice@names.com").and_return(feedback)                    
      post :create, venue_id: 0,feedback: {text: "I love you guys",source: "alice@names.com"}
    end

    it "renders the new template when the feedback is invalid" do
      post :create, venue_id: 0
      response.should render_template("feedback/new")     
    end

    describe "when the feedback is valid" do
      before do 
        feedback.stub(:valid?).and_return(true)
        Feedback.stub!(:new).and_return(feedback)
      end
      
      it "saves the feedback to the venue" do
        venue.feedback.should_receive(:<<).with(feedback)              
        post :create, venue_id: 0        
      end  
    
      it "it says thanks" do      
        post :create, venue_id: 0
        response.should render_template("feedback/thanks")     
      end
    end
  end
end
