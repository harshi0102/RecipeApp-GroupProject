class AddIndexesToTables < ActiveRecord::Migration[7.0]
  def change
    add_index :foods, :user_id, name: 'index_foods_on_unique_user_id'
    add_index :recipes, :user_id, name: 'index_recipes_on_unique_user_id'
    add_index :recipe_foods, :food_id, name: 'index_recipe_foods_on_unique_food_id'
    add_index :recipe_foods, :recipe_id, name: 'index_recipe_foods_on_unique_recipe_id'
  end
end
