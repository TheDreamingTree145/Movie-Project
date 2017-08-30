module UsersHelper

  def unique_actors
    actor_count = []
    current_user.movies.each do |movie|
      movie.characters.each do |character|
        if !actor_count.include?(character.actor)
          actor_count << character.actor
        end
      end
    end
    actor_count.count
  end

  def unique_genres
    genre_count = []
    current_user.movies.collect do |movie|
      if !genre_count.include?(movie.genre)
        genre_count << movie.genre.title
      end
    end.join(", ")
  end
end
