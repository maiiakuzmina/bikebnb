class BikesController < ApplicationController
  def index
  end

  def show
    @bike = Bike.find(params[:id])
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :price, :description)
  end

end
