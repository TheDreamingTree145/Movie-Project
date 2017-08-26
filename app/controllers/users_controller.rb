class UsersController < ApplicationController
  before_action :current_user, only: [:show]

  def show
    redirect_to root_path, alert: "You must be logged in to view your page" unless current_user
  end
end
