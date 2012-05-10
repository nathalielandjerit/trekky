class ApplicationController < ActionController::Base
  protect_from_forgery
	
  before_filter :instance_research
	before_filter :last_travel

	def instance_research
		@q = Travel.search(params[:q])
	end

  def last_travel
    @last_travel_footer = Travel.limit(7).order('created_at desc')
  end


  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
	

  def after_sign_in_path_for(resource)
    stored_location_for(resource) || current_user
  end

end
