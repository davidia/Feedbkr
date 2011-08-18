class HomeController < ApplicationController

def index
  if authenticate_user! then
    redirect_to current_user
  end
end

end
