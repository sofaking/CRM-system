class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
      @user = User.new
      render layout: false
  end
end
