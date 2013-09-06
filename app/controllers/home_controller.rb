class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    redirect_to current_user.account if current_user
  end
end
