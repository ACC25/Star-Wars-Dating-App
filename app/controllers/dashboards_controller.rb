class DashboardsController < ApplicationController

  def index
    @user = current_user
    @favourites = Favourite.where(user_id: @user.id)
    @most_recent = Favourite.find_most_recent(@user)
    @image = Favourite.find_image(@most_recent)
  end

  def new
  end



  private


end
