class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "Welcome! Welcome to city 17. You have chosen or been chosen.."
      redirect_to user_path(user)
    else
      flash.now[:danger] = "That would be a no-no"
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "Say gbye, say gbye to Hollywood.."
    redirect_to root_path
  end

end
