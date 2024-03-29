class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home 
  before_action :authenticate_user!, only: [:profile]


  def home
  end

  def profile
    @user = current_user
    @bikes = @user.bikes
  end

  def destroy
    @bike = Bike.find(params[:id])
    @bike.destroy
    redirect_to profile_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo)
  end

  def bike_params
    params.require(:bike).permit(:name, :price, :description, :photo)
  end

end
