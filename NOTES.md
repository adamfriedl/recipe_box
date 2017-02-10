You are looking for the includes method. You need something like this :

recipe = Recipe.includes(:ingredients, :recipeingredients).first
this will return the first recipe with all it's associated ingredients and recipe ingredients.

http://stackoverflow.com/questions/29906088/learning-rails-setup-a-cookbook-app/29906643?noredirect=1#comment47939876_29906643 

---
