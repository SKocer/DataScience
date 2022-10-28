------ Assignment 2

WITH Actions As
(
SELECT *
FROM (   
			VALUES
			       (1,'A', 'Left'),
				   (2,'A', 'Order'),
				   (3,'B', 'Left'),
					(4,'A', 'Order'),
					(5,'A', 'Review'),
					(6,'A', 'Left'),
					(7,'B', 'Left'),
					(8,'B', 'Order'),
					(9,'B', 'Review'),
					(10,'A', 'Review')
) AS TABLE1 (VISITOR_ID, ADV_TYPE, ACTIONS)
),
TABLE2 AS (
			SELECT ADV_TYPE,
					COUNT(*) CNT_ACTION,
					SUM(CASE WHEN ACTIONS = 'Order' THEN 1 ELSE 0 END) AS CNT_ORDER
			FROM Actions
			GROUP BY ADV_TYPE
)
SELECT ADV_TYPE,
		 CONVERT(NUMERIC(5,2), 1.0 * CNT_ORDER/CNT_ACTION) AS CONVERSION_RATE
FROM TABLE2