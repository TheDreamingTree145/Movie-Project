class ActorsController < ApplicationController
  before_action :logged_in_check

  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

end
