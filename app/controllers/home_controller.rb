class HomeController < ApplicationController

	def search
   		@travels = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 6)
	end
	
end
