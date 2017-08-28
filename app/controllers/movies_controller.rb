class MoviesController < ApplicationController
  before_action :logged_in_check

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end

  def create
    if @movie = Movie.create(movie_params)
      redirect_to @movie
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date)
  end

end
