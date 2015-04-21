class FlatsController < ApplicationController

  before_action :find_flat, only: [:show]

  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
     if @flat.save
       redirect_to flat_path(@flat)
     else
       render :new
     end
  end

  def show
  end

  def edit
    @flat = Flat.find(params[:id])
  end

  def update
    @flat = Flat.find(params[:id])
    @flat.update(flat_params)
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(flat_params)
    @flat.destroy
  end


  private

  def find_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:property_type, :room_type, :capacity, :city, :zip_code, :street, :price)
  end

end


