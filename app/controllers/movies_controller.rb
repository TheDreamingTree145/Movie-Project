class MoviesController < ApplicationController
  before_action :logged_in_check

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

end
