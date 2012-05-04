class ApplicationController < ActionController::Base
  protect_from_forgery
	
	before_filter :instance_research

	def instance_research
		@q = Travel.search(params[:q])
	end
	
  private

  def authorize
  	unless current_user
  		flash[:error] = "You must be logged in"
  		redirect_to :controller => 'home'
  	end
  end


  private

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || current_user
  end

end
