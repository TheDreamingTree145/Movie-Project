class UsersController < ApplicationController
  before_action :logged_in_check, only: [:index, :show]

  def show
    
  end
end
