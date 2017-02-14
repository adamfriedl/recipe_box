class RecipesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		@recipes = Recipe.all
	end

	def new
		@recipe = Recipe.new
		2.times {@recipe.ingredients.build}
	end

	def create
		@recipe = Recipe.new(recipe_params)
		if @recipe.save
			redirect_to @recipe, notice: 'Your recipe was sucessfully created.'
		else
			render 'new', notice: 'There was a problem creating your recipe.'
		end		
	end

	def show
		@recipe = Recipe.find(params[:id])
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :instructions, :user_id, ingredients_attributes: [
			:id,
			:name
			]
		)
	end
	
end
