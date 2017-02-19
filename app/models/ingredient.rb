class Ingredient < ApplicationRecord
	has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients

	validates :name, presence: true

	def recipe_ingredients_attributes=(recipe_ingredients)
		recipe_ingredients.each do |ri|
			if ri[][quantity] != ''
				ri.update
				# (quantity: value[:quantity])
				# self.recipe_ingredients << recipe_ingredient
			end
		end
	end
end
