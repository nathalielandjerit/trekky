class PicturesController < ApplicationController

  before_filter :get_activity
  before_filter :authorize, :only => [:new, :create, :edit, :update, :destroy]
  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = @activity.pictures

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pictures }
    end
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @picture = @activity.pictures.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/new
  # GET /pictures/new.json
  def new
    @picture = @activity.pictures.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @picture }
    end
  end

  # GET /pictures/1/edit
  def edit
    @picture = @activity.pictures.find(params[:id])
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = @activity.pictures.new(params[:picture])
    if @picture.save
      redirect_to [@activity.travel, @activity], notice: 'Picture was successfully created.'
    else
      render action: "activities/show"
    end
  end

  # PUT /pictures/1
  # PUT /pictures/1.json
  def update
    @picture = @activity.pictures.find(params[:id])

    respond_to do |format|
      if @picture.update_attributes(params[:picture])
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture = @activity.pictures.find(params[:id])
    @picture.destroy

    respond_to do |format|
      format.html { redirect_to [@activity.travel, @activity] }
      format.json { head :no_content }
    end
  end

  private

  def get_activity
    unless params[:activity_id].blank?
      @activity = Activity.find(params[:activity_id])
    else
      redirect_to root_url, :error => "What activity???"
    end
  end
end
