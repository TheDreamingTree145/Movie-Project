class StaticController < ApplicationController
  before_action :logged_in_check

  def top_rated
    @movies = Movie.top_rated
  end
end
