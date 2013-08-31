class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    @todo_lists = TodoList.all
  end
end
