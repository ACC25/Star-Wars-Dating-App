class SearchesController < ApplicationController

  def new
    @user = current_user
  end

  def index
  end

  def create
    @user = current_user
    pairing = Favourite.love_connection(params.keys[0],
                                        params.keys[1],
                                        params.keys[2],
                                        params.keys[3])
    @favourite = Favourite.new(user_id: @user.id,
                        peoples_id: pairing)
    @favourite.save
    if @favourite.save
      flash[:success] = "You found a match!"
      redirect_to user_dashboards_path(@user)
    else
      flash[:success] = "No match found. Please try again."
      redirect_to search_path
    end
  end

end
