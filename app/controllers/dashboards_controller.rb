class DashboardsController < ApplicationController

  def index
    @user = current_user
    @favourites = Favourite.where(user_id: @user.id)
  end

  def new
  end



  private


end
