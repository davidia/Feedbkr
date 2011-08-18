require 'spec_helper'

describe VenuesController do  
  let(:venue) { mock_model(Venue).as_null_object}    
  
  before do       
      venue.stub!(:name).and_return('The Venue')
      venue.stub!(:id).and_return(1)
  end

  describe "GET 'show'" do
    it "loads the venue" do
      Venue.should_receive(:find).and_return(venue)
      get :show, id: 1      
    end

    it "prepares the QR code" do      
      
      GoogleQR.should_receive(:new).with("data" => venue_feedback_index_url(venue),"size" => "100x100")
      get :show, id: 1 
      #chart = GoogleQR.new(:data => "SomeDataToQRify", :size => "100x100")          
    end
  end  
end
