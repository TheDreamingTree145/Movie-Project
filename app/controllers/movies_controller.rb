class MoviesController < ApplicationController
  before_action :logged_in_check

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    3.times {@movie.characters.build}
  end

  def create
    binding.pry
    @movie = current_user.movies.build(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :critic_rating, :awards, :characters)
  end

end
