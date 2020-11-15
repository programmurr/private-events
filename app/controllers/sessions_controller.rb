class SessionsController < ApplicationController
  def new; end

  def create
    # may need to change the params key
    user = User.find_by_username(params[:username])

    if user
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      redirect_to '/login'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to users_path, notice: 'Successfully logged out'
  end
end
