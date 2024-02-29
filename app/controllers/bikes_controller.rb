class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @bike = Bike.new
    @markers = @bikes.geocoded.map do |bike|
      {
        lat: bike.latitude,
        lng: bike.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: {bike: bike})

      }
    end
  end

  def show
    @bike = Bike.find(params[:id])
  end

  def new
    @bike = Bike.new
  end

  def create
    @bike = Bike.new(bike_params)
    @bike.user = current_user
    if @bike.save
      redirect_to bikes_path
    else
      render :new
    end
  end

  def delete
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to bikes_path

  end

  def edit
    @bike = Bike.find
  end

  private

  def bike_params
    params.require(:bike).permit(:name, :price, :description, :photo)
  end

end
