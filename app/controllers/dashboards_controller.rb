class DashboardsController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @species = Race.order(:name)
    @genders = Peoples.list_of_genders
    @climates = Planet.list_of_climates
  end



  private


end
