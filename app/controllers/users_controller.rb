class UsersController < ApplicationController
  before_filter :authenticate_user!

  def show
    @user = User.find(params[:id])
    @feedback = []
    @venues = @user.venues.all
    @user.venues.each { |v| v.feedback.all.each {|f| @feedback.push(f)} }
  end

end
