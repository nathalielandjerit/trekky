class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    Notifier.user_received(@user).deliver
  end


end
