class DashboardsController < ApplicationController

  def index
    @user = current_user
    @favourites = Favourite.where(user_id: @user.id)
    @most_recent = Favourite.find_most_recent(@user)
    @planet = Planet.relate_to_match(@most_recent)
    @starship = Starship.relate_to_match(@most_recent)
    @vehicle = Vehicle.relate_to_match(@most_recent)
    @image = Favourite.find_image(@most_recent)
  end

  def new
  end



  private


end
