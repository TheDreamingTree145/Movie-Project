class UsersController < ApplicationController
  before_action :logged_in_check, only: [:index, :show]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id]) # So a logged in user can view a different user's page
  end
end
