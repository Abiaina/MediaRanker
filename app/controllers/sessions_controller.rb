class SessionsController < ApplicationController
  def create
    # checking if the user with this username
    @user = User.find_by username: params[:user][:username]

    if @user
      flash[:success] = "Welcome back #{@user.username}"

      # login this stores the user id into session
      session[:user_id] = @user.id
    else
      @user = User.create username: params[:user][:username]
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}"
    end
    redirect_to root_path
  end

  def new
    @user = User.new
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You logged out!"
    redirect_to root_path
  end

end
