class HomeController < ApplicationController

	def index
		@q = Travel.search(params[:q])
   		@travels = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 6)
	end

	def recherche
		@q = Travel.search(params[:q])
   		@travels = @q.result(:distinct => true).paginate(:page => params[:page], :per_page => 6)
	end
	
end
