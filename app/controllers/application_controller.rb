class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :instance_research

	def instance_research
		@q = Travel.search(params[:q])
	end

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
	
  private

  def authorize
  	unless current_user
  		flash[:error] = "You must be logged in"
  		redirect_to :controller => 'home'
  	end
  end

end
