class SessionsController < ApplicationController
  
  # GET /login
  def new
    render layout: false
  end

  # POST /login
  def create
    user = User.find_by(email: params[:email])
    if user and user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user.account
    else
      redirect_to home_url, notice: "Invalid user/password combination"
    end
  end

  # DELETE /logout
  def destroy
    session[:user_id] = nil
    redirect_to home_url, notice: "Logged out"
  end
end
