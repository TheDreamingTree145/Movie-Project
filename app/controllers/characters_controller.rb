class CharactersController < ApplicationController
  before_action :logged_in_check

  def show
    @character = Character.find(params[:id])
  end

end
