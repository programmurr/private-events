class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by_username(params[:username])

    if user
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      redirect_to '/login', notice: 'Please enter a valid username'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to users_path, notice: 'Successfully logged out'
  end
end
