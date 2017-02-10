class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	accepts_nested_attributes_for :ingredients

	# def ingredients_attributes=(ingredient)
	# 	self.ingredients = Ingredient.find_or_create_by(name: ingredient.name)
	# 	self.ingredient.update(ingredient)
	# end
end
