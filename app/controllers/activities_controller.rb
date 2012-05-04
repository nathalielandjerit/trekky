class ActivitiesController < ApplicationController

  before_filter :get_travel
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]
  
  # GET /activities
  # GET /activities.json
  def index
    @activities = @travel.activities

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @activities }
    end
  end

  # GET /activities/1
  # GET /activities/1.json
  def show
    @picture = Picture.new
    @activity = @travel.activities.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/new
  # GET /activities/new.json
  def new
    @activity = @travel.activities.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @activity }
    end
  end

  # GET /activities/1/edit
  def edit
    @activity = @travel.activities.find(params[:id])
  end

  # POST /activities
  # POST /activities.json
  def create
    @images = params[:activity][:picture]
    params[:activity].delete(:picture)
    @activity = @travel.activities.new(params[:activity])

    respond_to do |format|
      if @activity.save
        @images.each do |image|
          @photos = Picture.new(:picture => image)
          @photos.activity_id = @activity.id
          @photos.save
        end
        if params[:commit] == "Envoie et continuer"
          format.html { redirect_to new_travel_activity_path(@travel.id) }
        else
          format.html { redirect_to travel_activities_path(@activity.travel_id), notice: 'Activity was successfully created.' }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @activity = @travel.activities.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to travel_activities_path(@activity.travel_id), notice: 'Activity was successfully updated.' }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @activity = @travel.activities.find(params[:id])
    @id_travel = @activity.travel_id
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to travel_activities_path(@id_travel) }
      format.json { head :no_content }
    end
  end

  private

  def get_travel
    unless params[:travel_id].blank?
      @travel = Travel.find(params[:travel_id])
    else
      redirect_to root_url, :error => "What travel???"
    end
  end

end
