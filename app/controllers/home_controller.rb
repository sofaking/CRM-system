class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    if current_user
      @projects = current_user.account.projects
    else
      @projects = Project.first
    end
  end
end
