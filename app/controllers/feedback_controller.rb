class FeedbackController < ApplicationController
  #before_filter :authenticate_user!

  def index    
    @feedback = venue.feedback.all
  end


  def new  
    venue      
    @feedback = Feedback.new
  end

  def create
    @feedback = Feedback.new(params[:feedback])        
    if @feedback.valid? then 
      venue.feedback << @feedback      
      render :action => "thanks"
    else     
      render :action => "new"
    end
  end

  private
  def venue
    @venue ||= Venue.find(params[:venue_id])
  end

end
