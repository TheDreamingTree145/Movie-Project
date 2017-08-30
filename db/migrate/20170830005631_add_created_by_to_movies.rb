class AddCreatedByToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :created_by, :string
  end
end
