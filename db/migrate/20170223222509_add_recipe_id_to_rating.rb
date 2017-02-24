class AddRecipeIdToRating < ActiveRecord::Migration[5.0]
  def change
    add_column :ratings, :recipe_id, :integer
  end
end
