class PicturesController < ApplicationController

  before_filter :get_activity
  before_filter :authenticate_user!, :except => [:index, :show]
  load_and_authorize_resource :only => [:edit, :update, :destroy]
 
  def index
    @pictures = @activity.pictures
  end

 
  def show
    @picture = @activity.pictures.find(params[:id])
  end
 
  def edit
    @picture = @activity.pictures.find(params[:id])
  end

  def create
    @picture = @activity.pictures.new(params[:picture])
    authorize! :create, @picture
    if !@picture[:picture_file_name].nil?
      if @picture.save
        redirect_to [@activity.travel, @activity], notice: 'Picture was successfully created.'
      else
        redirect_to [@activity.travel, @activity], notice: 'Picture was not successfully created.'
      end
    else
      redirect_to [@activity.travel, @activity], notice: 'Picture was not successfully created.'
    end

  end

  def update
    @picture = @activity.pictures.find(params[:id])

    if @picture.update_attributes(params[:picture])
      redirect_to @picture, notice: 'Picture was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @picture = @activity.pictures.find(params[:id])
    @picture.destroy
    redirect_to [@activity.travel, @activity]
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
