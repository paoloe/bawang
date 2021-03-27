SELECT r.name AS 'Recipe', r.instructions, ri.amount AS 'Amount', mu.name AS 'Unit of Measure', i.name AS 'Ingredient' 
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id;

SELECT i.name AS 'Ingredient', sum(ri.amount), mu.name AS 'Measurement'
FROM Recipe r 
JOIN RecipeIngredient ri on r.id = ri.recipe_id 
JOIN Ingredient i on i.id = ri.ingredient_id 
LEFT OUTER JOIN Measure mu on mu.id = measure_id
WHERE r.name IN ('Boiled Egg', 'Chocolate Cake', 'Toad in the Hole')
GROUP BY i.name, mu.name;

-- step 1: add the recipe to the recipe table
INSERT INTO Recipe(name, description, instructions)
VALUES ('Toad in the Hole', 'Saussage in yorkshire pudding batter', 'example...');

-- step 2: add the ingridients
INSERT INTO Ingredient(name)
VALUES ('saussage'),
       ('milk'); 

-- step 3: link the ingridients to the recipe
INSERT INTO RecipeIngredient(amount, ingredient_id, measure_id, recipe_id)
VALUES (6, 7, NULL, 3);

SELECT * FROM Ingredient;
SELECT * FROM RecipeIngredient;
SELECT * FROM Recipe
WHERE name = 'Toad in the Hole';

