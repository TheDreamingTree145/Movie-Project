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

  def user_check?
    true if current_user == @user
  end
  
end
