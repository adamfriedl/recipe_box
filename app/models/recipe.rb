class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients

	validates :name, presence: true
	validates_associated :ingredients

	# Scope method
  scope :most_recent_contributor, -> { order(created_at: :desc).first.user }

	# This creates duplicate nested items. Cannot use in final project.
	accepts_nested_attributes_for :ingredients, :reject_if => proc { |attributes| attributes['name'].blank? }

	# def ingredients_attributes=(ingredient)
	# 	self.ingredients = Ingredient.find_or_create_by(name: ingredient.name)
	# 	self.ingredient.update(ingredient)
	# end
end
