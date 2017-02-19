<label for="recipe_ingredient_quantity">Quantity</label>
      <input type="text" name="recipe[recipe_ingredients][<%= ingredients_form.index %>][quantity]" />

      [<%= ingredients_form.index %>]


A recipe_ingredient is automatically initialized when an ingredient is listed. When I enter quantity, it initializes a *new* recipe_ingredient ranther than adds the quantity to the one corresponding to the ingredient.