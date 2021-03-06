class Recipe < ApplicationRecord
	belongs_to :user
	has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
	has_many :ratings

	validates :name, presence: true
	validates_associated :ingredients

	# Scope method
  scope :most_recent_contributor, -> { order(created_at: :desc).first.user }

	def ingredients_attributes=(ingredients)
		ingredients.values.each do |value|
			if value[:name] != ''
				ingredient = Ingredient.find_or_create_by!(name: value[:name])
				self.recipe_ingredients.build(ingredient_id: ingredient.id, quantity: value[:quantity])
			end
		end	
	end

end
