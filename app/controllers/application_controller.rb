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

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || current_user
  end
end
