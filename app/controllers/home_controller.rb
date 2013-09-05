class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
      @projects = Project.first
  end
end
