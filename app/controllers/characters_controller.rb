class CharactersController < ApplicationController
  before_action :logged_in_check

  def index
    @characters = Character.where("movie_id = #{params[:movie_id]}")
    render json: @characters
  end

  def new
    @movie = Movie.find_by(id: params[:movie_id])
    @character = Character.new
    @character.build_actor # little unsure here
  end

  def show
    @character = Character.find(params[:id])
  end

  def create # Can't get this to work with validation while being able to keep the movie_id for association
    @movie = Movie.find_by(id: params[:character][:movie_id])
    @character = Character.new(character_params)
    if @character.save
      redirect_to movie_character_path(@movie, @character)
    else
      redirect_to new_movie_character_path(@movie)
    end
  end

  private

  def character_params
    params.require(:character).permit(:name, :quote, :movie_id, :actor_id, actor_attributes:[:name, :gender, :age])
  end

end
