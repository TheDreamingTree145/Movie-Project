class MoviesController < ApplicationController
  before_action :logged_in_check
  before_action :find_movie, only: [:show, :edit, :update, :add]

  def index
    @movies = Movie.all
    respond_to do |format|
      format.html
      format.json { render :json => @movies }
    end
  end

  def new
    @movie = Movie.new
    3.times do
      character = @movie.characters.build
      actor = character.build_actor
    end
  end

  def create
    @movie = current_user.movies.build(movie_params) # Why the hell won't this associate the movie with user on sav
    if @movie.save
      current_user.movies << @movie
      redirect_to @movie
    else
      render :new # problem
    end
  end

  def show
    respond_to do |format|
      format.html
      format.json { render :json => @movie }
    end
  end

  def edit

  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie
    else
      render :new
    end
  end

  def add
    if current_user.add_movie(@movie)
      redirect_to current_user
    else
      redirect_to @movie, alert: "You already have this movie in your collection!"
    end
  end

  def remove
    @movie = Movie.find_by(id: params[:movie_id])
    current_user.remove_movie(@movie)
    redirect_to current_user, alert: "Successfully removed movie!"
  end

  def random
    @movies = Movie.all
    @movie = Movie.all.sample
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :release_date, :critic_rating, :awards, :genre_id, :created_by, characters_attributes:[:name, :actor_id, :quote, actor_attributes:[:name, :gender, :age]])
  end

end
