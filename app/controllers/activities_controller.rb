class ActivitiesController < ApplicationController

  before_filter :get_travel

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
    @activity = @travel.activities.new(params[:activity])

    respond_to do |format|
      if @activity.save
        if params[:commit] == "Envoie et continuer"
          format.html { redirect_to new_travel_activity_path(@travel.id) }
        else
          format.html { redirect_to @travel, notice: 'Activity was successfully created.' }
          format.json { render json: @travel, status: :created, location: @travel }
        end
      else
        format.html { render action: "new" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /activities/1
  # PUT /activities/1.json
  def update
    @activity = @travel.activities.find(params[:id])

    respond_to do |format|
      if @activity.update_attributes(params[:activity])
        format.html { redirect_to @activity, notice: 'Activity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @activity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /activities/1
  # DELETE /activities/1.json
  def destroy
    @activity = @travel.activities.find(params[:id])
    @activity.destroy

    respond_to do |format|
      format.html { redirect_to activities_url }
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
