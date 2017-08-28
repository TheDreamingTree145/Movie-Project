class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def logged_in_check
    redirect_to root_path, alert: "You must be signed in to perform this action" unless user_signed_in?
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end
  
end
