class SearchesController < ApplicationController

  def new
    @user = current_user
  end

  def index
  end

  def create
    @user = current_user
    Favourite.love_connection(params.keys[0], params.keys[1], params.keys[2], params.keys[3])
    redirect_to user_dashboards_path(@user)
  end

end
