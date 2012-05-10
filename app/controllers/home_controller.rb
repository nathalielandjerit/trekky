class HomeController < ApplicationController

	def index
		@last_activity = Activity.last
	end


	def search
   		@travels = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 5)
	end



	private

	  def resource_name
	    :user
	  end
	 
	  def resource
	    @resource ||= User.new
	  end
	 
	  def devise_mapping
	    @devise_mapping ||= Devise.mappings[:user]
	  end
		
end
