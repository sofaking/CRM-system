class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
<<<<<<< HEAD
    redirect_to current_user.account if current_user
=======
    if current_user
      redirect_to current_user.account
    else
      @user = User.new
      render layout: false
    end
>>>>>>> master
  end
end
