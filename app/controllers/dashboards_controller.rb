class DashboardsController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @favourites = Favourite.new
  end



  private


end
