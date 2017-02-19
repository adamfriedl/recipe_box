class IngredientsController < ApplicationController

	def index
		@ingredients = Ingredient.all
	end

	def show
		@ingredient = Ingredient.find(params[:id])
	end

	def create
	end

	private

	def ingredient_params
		params.require(:ingredient).permit(:name, :recipe_ingredients_attributes: [:id, :quantity])
		
	end

	
end
