#subquery: only using the value of total ordered weight of the ingredients from the previous query i.e. stock1 and grouping by ingredients rather than item name or pizza
#superquery:calculating total weight of the ingredients in the inventory (number of units in inventory * weight of each quantity from ingredient table
			#finally subtracting the total weight in inventory-ordered weight of the ingredient
SELECT 
s2.ing_name,
s2.ordered_weight,
ing.ing_weight,
inv.quantity,
ing.ing_weight*inv.quantity AS total_inv_weight,
(ing.ing_weight*inv.quantity-s2.ordered_weight) AS remaining_weight
 FROM
(SELECT
	ing_id,
	ing_name,
	
	sum(ordered_weight) AS ordered_weight
FROM 
	stock1 

GROUP BY 
	ing_id,
	ing_name)s2
LEFT JOIN inventory inv ON s2.ing_id=inv.item_id
LEFT JOIN ingredient ing ON ing.ing_id =s2.ing_id
	
	