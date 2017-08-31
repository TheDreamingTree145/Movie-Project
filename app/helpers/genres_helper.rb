module GenresHelper

  def unique_genres
    genre_count = []
    current_user.movies.each do |movie|
      if !genre_count.include?(movie.genre.title)
        genre_count << movie.genre.title
      end
    end
    genre_count.join(", ")
  end

end
