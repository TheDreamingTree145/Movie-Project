class MoviesController < ApplicationController
  before_action :logged_in_check
  before_action :find_movie, only: [:show, :edit, :update]

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
    3.times do
      character = @movie.characters.build
      character.build_actor
    end
  end

  def create
    binding.pry
    @movie = current_user.movies.create(movie_params)
    if @movie.save
      redirect_to @movie
    else
      render :new
    end
  end

  def show

  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :critic_rating, :awards, characters_attributes:[:name, actor_attributes:[:name]])
  end

end
