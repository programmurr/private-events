class UsersController < ApplicationController
  def index
    @users = User.all
    @current_user = current_user
  end

  def new
    @user = User.new
    @current_user = current_user
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'User was successfully created'
    else
      render :new
    end
  end

  def show
    # May have to change this to: @user = User.find(user_params[:id])
    @user = User.find(params[:id])
    @current_user = current_user
  end

  def destroy
    # Removes user from session, not actually destroying the user
    # Not linked to yet in index
    session.delete(:current_user_id)
    @_current_user = nil
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username)
  end

  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
end
