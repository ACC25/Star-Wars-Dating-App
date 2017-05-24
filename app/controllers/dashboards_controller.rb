class DashboardsController < ApplicationController

  def index
    @user = current_user
  end

  def new
    @user = current_user
    @dashboard = Dashboard.new
  end



  private


end
