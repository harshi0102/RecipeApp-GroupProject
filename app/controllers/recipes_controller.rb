class RecipesController < ApplicationController
  def index
    @recipes = if user_signed_in?
                 current_user.recipes.or(Recipe.where(public: true))
               else
                 Recipe.where(public: true)
               end
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    if @recipe.save
      flash[:notice] = 'Recipe created successfully'
      redirect_to recipes_path
    else
      flash[:alert] = 'Recipe creation failed'
      puts @recipe.errors.full_messages # Check for validation errors in the server logs
      render :new
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      flash[:success] = 'Recipe visibility updated.'
    else
      flash[:error] = 'Failed to update recipe visibility.'
    end
    respond_to do |format|
      format.html { redirect_to @recipe }
      format.js # Add this line to respond to AJAX request
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def public_recipes
    @recipes = Recipe.where(public: true).includes(:user, recipe_foods: :food).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public)
  end
end
