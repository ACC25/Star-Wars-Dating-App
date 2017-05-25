class SearchesController < ApplicationController

  def new
    binding.pry
  end

  def index
  end

  def create
    binding.pry
    @species = Race.find(params["search"]["name"].to_i).name
  end
end
