class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    @todos = Todo.all
  end
end
