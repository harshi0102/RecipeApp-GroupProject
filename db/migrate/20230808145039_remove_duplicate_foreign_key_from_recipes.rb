class RemoveDuplicateForeignKeyFromRecipes < ActiveRecord::Migration[7.0]
  def change
    remove_foreign_key :recipes, :users, column: :user_id, name: 'fk_rails_9606fce865'
  end
end
