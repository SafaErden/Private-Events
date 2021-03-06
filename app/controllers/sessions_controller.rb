class SessionsController < ApplicationController
  def index
    # @user=User.where(id: params[session[:id]])
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      flash[:notice] = 'You signed in successfully!'
      session[:id] = @user.id
      session[:name] = @user.name
      redirect_to user_path(@user)
    else
      flash[:alert] = 'No User found. Please sign up'
      redirect_to new_user_path
    end
  end

  def destroy
    reset_session
    redirect_to sessions_path
  end

  def user_logged_in?
    !session[:id].nil?
  end

  def logged_in_user
    return if logged_in?

    flash[:danger] = 'Please log in.'
    redirect_to sessions_path
  end
end
