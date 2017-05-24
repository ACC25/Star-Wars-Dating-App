class DashboardsController < ApplicationController

  def index
    @user = current_user
    call_api
  end

  def new
  end


  private

  def call_api
    response = HTTParty.get("http://swapi.co/api/planets/1/")
    response.parsed_response["name"]
    response.parsed_response["films"]
    response.parsed_response["count"]
    binding.pry
  end
end
