class AddDescriptionToCharacters < ActiveRecord::Migration[5.1]
  def change
    add_column :characters, :description, :string
  end
end
