# number of orders per pizza, item table is about the pizza, every pizza has its sku which corresponds to multiple ingredients of the pizza recipe
SELECT 
o.item_id,
i.sku,
i.item_name,
sum(o.quantity) as order_quantity
FROM orders o LEFT JOIN item i ON o.item_id=i.item_id
GROUP BY o.item_id,i.sku,i.item_id