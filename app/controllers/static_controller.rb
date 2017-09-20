class StaticController < ApplicationController
  before_action :logged_in_check

  def top_rated_movies
    @movies = Movie.top_rated
  end

  def top_rated_actors
    @actors = Actor.top_actor_awards
  end
end
