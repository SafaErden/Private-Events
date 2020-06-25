class SessionsController < ApplicationController
  def index
    #@user=User.where(id: params[session[:id]])
  end

  def create
    @user = User.where(id:1)
    session[:id] = @user.id 
    redirect_to index
  end
end