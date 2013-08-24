class HomeController < ApplicationController
  skip_before_action :authorize
  
  def index
    @todos = Todo.all
    @todo_lists = TodoList.all
  end
end
