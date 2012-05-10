# encoding: UTF-8
class TravelsController < ApplicationController

  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :only => [:new, :create, :edit, :update, :destroy]

  def index
    @travels = Travel.all
  end

  def show
    @travel = Travel.find(params[:id])
  end

  def new
    @user = User.find(current_user)
    @travel = Travel.new
  end

  def edit
    @travel = Travel.find(params[:id])
  end

  def create
    @user = User.find(current_user)
    @travel = @user.travels.new(params[:travel])

    if @travel.save
      redirect_to new_travel_activity_path(@travel.id), notice: 'Votre trek a bien été créé ! Ajoutez maintenant vos activités !'
    else
      render action: "new"
    end

  end

  def update
    @travel = Travel.find(params[:id])

    if @travel.update_attributes(params[:travel])
      redirect_to current_user, notice: 'Votre trek a bien été modifié !'
    else
      render action: "edit"
    end

  end

  def destroy
    @travel = Travel.find(params[:id])
    @travel.destroy
    redirect_to travels_url
  end
  
end
