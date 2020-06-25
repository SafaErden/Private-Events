class SessionsController < ApplicationController
  def index

  end

  def create
    @user = User.where(name: params[:name])
    session[:id] = @user.id 
  end
end