class SearchesController < ApplicationController

  def new
    @user = current_user
  end

  def index
  end

  def create
    @user = current_user
    @gender = params.keys[0]
    @smartness = params.keys[1]
    @species = params.keys[2]
    @climate = params.keys[3]
    binding.pry
    @species = Race.find(params["search"]["name"].to_i).name
  end
end
