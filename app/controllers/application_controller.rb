class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authorize
  	unless current_user
  		flash[:error] = "You must be logged in"
  		redirect_to :controller => 'home'
  	end
  end
end
