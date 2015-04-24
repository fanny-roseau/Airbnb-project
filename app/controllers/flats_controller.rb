class FlatsController < ApplicationController

  before_action :authenticate_user!
  skip_before_action :authenticate_user!, :only => [:search, :show]
  before_action :find_flat, only: [:edit, :update, :destroy, :show]

  def index
    @flats = Flat.all
  end

  def show
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = current_user.flats.new(flat_params)
     if @flat.save
       redirect_to user_flats_path(@flat)
     else
       render :new
     end
  end

  def edit
    current_user = User.find(params[:user_id])
    @flat = current_user.flats.find(params[:id])
  end

  def update
    @flat = current_user.flats.find(params[:id])
    @flat.update(flat_params)
    redirect_to user_flats_path(@flat)
  end

  def destroy
    @flat.destroy
    redirect_to user_flats_path(@flat)
  end

  def search
    @flats = Flat.where(city: params[:destination])
    @markers = Gmaps4rails.build_markers(@flats) do |flat, marker|
      marker.lat flat.latitude
      marker.lng flat.longitude
    end
  end

  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:property_type, :presentation, :room_type, :capacity, :city, :zip_code, :street, :price, :picture)
  end

end


