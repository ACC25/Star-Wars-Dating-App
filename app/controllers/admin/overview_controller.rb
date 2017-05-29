class Admin::OverviewController < ApplicationController
  before_action :require_admin

  def require_admin
    render file: "/public/404" unless current_admin?
  end

  def index
    @total_searches = Favourite.all.count
    @favourite = find_most_common.name
    @gender = find_most_common.gender.capitalize!
    @most_active = most_active
  end


  private

  def most_active
    top = Favourite.group(:peoples_id).having("count(*) > 1").count
    if top == {}
      "Need more information"
    else
      User.find(top.max_by{|k,v| v}[0])
    end
  end

  def find_most_common
    selection = Favourite.group(:peoples_id).having("count(*) > 1").count
    if selection == {}
      Peoples.find(34)
    else
      Peoples.find(selection.max_by{|k,v| v}[0])
    end
  end

end
