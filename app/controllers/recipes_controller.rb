class RecipesController < ApplicationController
	skip_before_action :authenticate_user!, only: [:index]

	def index
		if params[:user_id]
			@recipes = User.find(params[:user_id]).recipes
			@user = User.find(params[:user_id])
		else
			@recipes = Recipe.all
		end

	end

	def new
		@recipe = Recipe.new
		2.times {@recipe.ingredients.build}
	end

	def create
		user = User.find(params[:user_id])
		@recipe = user.recipes.new(recipe_params)
		binding.pry
		if @recipe.save
			redirect_to @recipe, notice: 'Your recipe was sucessfully created.'
		else
			render 'new', notice: 'There was a problem creating your recipe.'
		end		
	end

	def show
		@recipe = Recipe.includes(:ingredients, :recipe_ingredients).find(params[:id])
	end

	def update
	end

	private

	def recipe_params
		params.require(:recipe).permit(:name, :instructions, :user_id, recipe_ingredients_attributes: [:id, :quantity], ingredients_attributes: [:id, :name, :quantity])
	end
	
end
