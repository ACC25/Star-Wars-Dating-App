class SearchesController < ApplicationController

  def new
    @user = current_user
  end

  def index
  end

  def create
    binding.pry
    @user = current_user
    @species = Race.find(params["search"]["name"].to_i).name
  end
end
