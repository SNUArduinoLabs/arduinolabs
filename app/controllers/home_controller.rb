class HomeController < ApplicationController
  
  before_filter :authenticate_user
  
  def index
    @activities = PublicActivity::Activity.order("created_at DESC").where("owner_id = ?", current_user.id || nil)
  end
end
