class GenresController < ApplicationController
  before_action :logged_in_check

  def index
    @genres = Genre.all
  end

  def show
    @genre = Genre.find(params[:id])
  end
end
