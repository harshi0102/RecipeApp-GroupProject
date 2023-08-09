class RecipeFoodsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @food = @recipe.foods.build
  end

  # Other actions and methods
end