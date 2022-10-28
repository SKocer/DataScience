---- Assignment 3 Solution 

---- aggregate functions: mx, min, sum, count, avg



WITH T1 AS (
SELECT product_id, discount, SUM(quantity) cnt_quantity 
FROM [sale].[order_item]
GROUP BY product_id, discount
), T2 AS (
SELECT product_id, discount, cnt_quantity,
	FIRST_VALUE(cnt_quantity) OVER(PARTITION BY product_id ORDER BY discount) first_value,
	LAST_VALUE(cnt_quantity) OVER(PARTITION BY product_id ORDER BY discount ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) last_value
FROM T1
), T3 AS (

SELECT *,  1.0 * (last_value - first_value)/first_value as increase_rate
FROM T2
)
SELECT DISTINCT product_id, 
		CASE
			WHEN increase_rate < 0 THEN 'NEGATIVE'
			WHEN increase_rate = 0 THEN 'NEUTRAL'
			ELSE 'POSITIVE'
		END DISCOUNT_EFFECT
FROM T3













