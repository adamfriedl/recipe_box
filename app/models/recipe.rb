class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	accepts_nested_attributes_for :ingredients, :reject_if => proc { |attributes| attributes['name'].blank? }

	# Scope method
  scope :most_recent_contributor, -> { order(created_at: :desc).first.user }


	# def ingredients_attributes=(ingredient)
	# 	self.ingredients = Ingredient.find_or_create_by(name: ingredient.name)
	# 	self.ingredient.update(ingredient)
	# end
end
