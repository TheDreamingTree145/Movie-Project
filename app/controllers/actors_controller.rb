class ActorsController < ApplicationController
  before_action :logged_in_check


  def index
    if find_movie
      @actors = @movie.actors
    else
      @actors = Actor.all
    end
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.create(actor_params)
    if @actor.save
      render json: @actor, status: 201
    else
      render :new
    end
  end

  def show
    @actor = Actor.find(params[:id])
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :gender, :age)
  end

end
