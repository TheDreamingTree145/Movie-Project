class RenameColumnDescriptionToQuote < ActiveRecord::Migration[5.1]
  def change
    rename_column :characters, :description, :quote
  end
end
