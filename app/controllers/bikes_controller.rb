class BikesController < ApplicationController
  def index
    @bikes = Bike.all
    @bike = Bike.new

      # this is for search created by Bahar
      if params[:query].present?
        sql_subquery = <<~SQL
          (bikes.name ILIKE :query OR bikes.description ILIKE :query OR bikes.address ILIKE :query)
          OR
          (bikes.name @@ :query2 OR bikes.description @@ :query2 OR bikes.address @@ :query2)
        SQL
        @bikes = @bikes.joins(:user).where(sql_subquery, query: "%#{params[:query]}%", query2: params[:query])
      else
        @bikes = Bike.all
      end

      if @bikes.empty?
        flash.now[:alert] = "No bikes matching the search criteria were found."
        @latest_bikes = Bike.order(created_at: :desc).limit(6)
      end
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
    @booking = Booking.new

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
