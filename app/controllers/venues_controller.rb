require 'google-qr'

class VenuesController < ApplicationController
  before_filter :authenticate_user!

  def show    
    @venue = Venue.find(params[:id])
    @chart = GoogleQR.new(:data => venue_feedback_index_url(@venue), :size => "100x100").render
  end

  def index
    @venues = Venue.all
  end

  def new
    @venue = Venue.new
  end

  def create
    @venue = Venue.new(params[:venue])
    if @venue.valid?
      current_user.venues << @venue
      redirect_to current_user
    else     
      render :action => "new"
    end
  end
end
