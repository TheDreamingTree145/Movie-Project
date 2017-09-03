class CharactersController < ApplicationController
  before_action :logged_in_check

  def new
    @movie = Movie.find_by(id: param[:movie_id])
    @character = Character.new
    @character.actor.build
  end
  
  def show
    @character = Character.find(params[:id])
  end

  def create
