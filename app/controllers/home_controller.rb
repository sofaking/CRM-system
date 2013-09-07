class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    if current_user
      redirect_to current_user.account
    else
      @user = User.new
      render layout: false
    end
  end
end
