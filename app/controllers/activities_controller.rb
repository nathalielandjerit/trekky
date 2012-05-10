# encoding: UTF-8
class ActivitiesController < ApplicationController

  before_filter :get_travel
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :only => [:edit, :update, :destroy]
  

  def index
    @activities = @travel.activities
  end


  def show
    @picture = Picture.new
    @activity = @travel.activities.find(params[:id])
  end

  def new
    @activity = @travel.activities.new
    authorize! :new, @activity
  end


  def edit
    @activity = @travel.activities.find(params[:id])
  end

  def create
    @images = params[:activity][:picture]
    params[:activity].delete(:picture)
    @activity = @travel.activities.new(params[:activity])
    authorize! :create, @activity
    
      if @activity.save
        if !@images.nil?
          @images.each do |image|
            @photos = Picture.new(:picture => image)
            @photos.activity_id = @activity.id
            @photos.save
          end
        end
        if params[:commit] == "Envoie et continuer"
          redirect_to new_travel_activity_path(@travel.id), notice: 'Votre activité a bien été créée ! Vous pouvez en ajouter une nouvelle dès à présent.'
        else
          redirect_to travel_activities_path(@activity.travel_id), notice: 'Votre activité a bien été créée !'
        end
      else
        render action: "new"
      end
  end

  def update
    @activity = @travel.activities.find(params[:id])
   
      if @activity.update_attributes(params[:activity])
        redirect_to travel_activities_path(@activity.travel_id), notice: 'Votre activité a bien été modifiée !'
      else
        render action: "edit"
      end
  end

  def destroy
    @activity = @travel.activities.find(params[:id])
    @id_travel = @activity.travel_id
    @activity.destroy

    redirect_to travel_activities_path(@id_travel)
  end

  private

  def get_travel
    unless params[:travel_id].blank?
      @travel = Travel.find(params[:travel_id])
    else
      redirect_to root_url, :error => "De quel trek parlez-vous ?"
    end
  end

end
