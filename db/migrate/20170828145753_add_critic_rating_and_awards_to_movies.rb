class AddCriticRatingAndAwardsToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :critic_rating, :integer
    add_column :movies, :awards, :integer
  end
end
