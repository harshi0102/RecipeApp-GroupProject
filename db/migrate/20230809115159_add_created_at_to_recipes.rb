class AddCreatedAtToRecipes < ActiveRecord::Migration[6.1]
  def change
    add_column :recipes, :created_at, :datetime
  end
end