class UsersController < ApplicationController

  def create

  end

  def update
  	logger.info "AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA"
  end

  def show
  	user_id = params[:id] || current_user.id
    @user = User.find(user_id)
    @travels = Travel.all(:conditions => ['user_id = ?', user_id]) 
  end

end
