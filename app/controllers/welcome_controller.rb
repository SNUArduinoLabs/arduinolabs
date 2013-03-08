class WelcomeController < ApplicationController
  def index
    if current_user
      redirect_to home_path
    else
      render layout: false
    end
  end
end
