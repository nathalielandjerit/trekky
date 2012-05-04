class UsersController < ApplicationController

  def create

  end

def show
  @user = User.find(params[:id])

  if (Travel.all.count > 0 )
  	@travels = Travel.all(:conditions => ['user_id = ?', params[:id]]) 
  else 
  	'Je n\'ai pas de voyages'
  end

end


end
