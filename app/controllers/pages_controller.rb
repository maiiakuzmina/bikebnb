class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  before_action :authenticate_user!, only: [:profile]

  def home
  end

  def profile
    @user = current_user
    @bikes = @user.bikes
  end

  private

  def user_params
    params.require(:user).permit(:email, :photo)

  end

end
