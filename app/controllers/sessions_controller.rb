class SessionsController < ApplicationController
  def index
    #@user=User.where(id: params[session[:id]])
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user
      flash[:notice] = 'You signed in successfully!'
      session[:id] = @user.id
      session[:name] = @user.name
    else
      flash[:alert] = 'No User found. Please sign up'
      redirect_to new_user_path
    end
  end


end
