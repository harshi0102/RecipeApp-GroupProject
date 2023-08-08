# Controller for managing food items.

class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(food_params)

    if @food.save
      flash[:notice] = 'Food created successfully'
      render turbo_stream: turbo_stream.append('food_list', partial: 'food', locals: { food: @food })
    else
      flash[:alert] = 'Food creation failed'
      render turbo_stream: turbo_stream.replace('food_form', partial: 'form', locals: { food: @food })
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy

    redirect_to request.referrer
  end

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price, :quantity)
  end
end
