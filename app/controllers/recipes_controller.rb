class RecipesController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:update]

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
    @recipe = Recipe.new(user_id: current_user.id, **recipe_params)
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
    @recipe_foods = @recipe.recipe_foods.includes(:food)
    @foods = @recipe_foods.map(&:food)
  end

  def edit
    @recipe = Recipe.find(params[:recipe_id])
    @recipe_food = @recipe.recipe_foods.find(params[:id])
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
    @public_recipes = Recipe.where(public: true).includes(:user).order(created_at: :desc)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name, :description, :preparation_time, :cooking_time, :public)
  end
end
