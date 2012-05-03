class HomeController < ApplicationController

	def recherche
   		@travels = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 6)
	end
	
end
