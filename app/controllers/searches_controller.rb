class SearchesController < ApplicationController

  def new
    @user = current_user
  end

  def index
  end

  def create
    @user = current_user
    pairing = Favourite.love_connection(params.keys[0], params.keys[1], params.keys[2], params.keys[3])
    Favourite.create!(user_id: @user.id,
                      peoples_id: pairing.id
                      )
    redirect_to user_dashboards_path(@user)
  end

end
