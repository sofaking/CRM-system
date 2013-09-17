class ApplicationController < ActionController::Base
  include ApplicationHelper
  before_action :authorize
  
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  protected
    
    def authorize
      if current_user
        if current_user.client?
          redirect_to home_url, notice: 'You no have permissions to do this.' unless client_workplace
        elsif current_user.visiter?
          redirect_to home_url, notice: 'You no have permissions to do this.' unless visiter_workplace
        elsif current_user.admin?
          redirect_to home_url unless admin_workplace
        else
          redirect_to home_url
        end
      else
        redirect_to login_url, notice: "Please log in" unless logout_workplace
      end
    end
    
    def logout_workplace
      request_to controller: [:home] or
      request_to controller: [:sessions, :users], action: [:new, :create]
    end
    
    def client_workplace
      request_to controller: [:sessions, :home, :calendar, :todo_lists, :todos, :events] or
      request_to controller: [:accounts], action: [:show] or
      request_to controller: [:projects], action: [:new, :create, :destroy, :show, :edit, :update]
    end
      
    def visiter_workplace
      request_to controller: [:sessions, :home, :calendar, :todo_lists, :todos, :events] or
      request_to controller: [:accounts], action: [:show] or
      request_to controller: [:projects], action: [:show, :edit, :update]
    end
    
    def admin_workplace
      true # all places
    end
    
    def request_to args={}
      if args[:controller].to_s.include? params[:controller]
        if args[:action]
          args[:action].to_s.include? params[:action]
        else
          true
        end
      else
        false
      end
    end
end
