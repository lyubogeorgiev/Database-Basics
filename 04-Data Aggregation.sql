USE `restaurant`;

SELECT `department_id`,
		COUNT(*) AS 'Number of employees'
FROM `employees`
GROUP BY `department_id`;

SELECT `department_id`, 
		ROUND(AVG(`salary`), 2) AS 'Average Salary'
FROM `employees`
GROUP BY `department_id`
ORDER BY `department_id` ASC;

SELECT `department_id`,
		ROUND(MIN(`salary`),2 ) AS `min_salary`
FROM `employees`
GROUP BY `department_id`
HAVING `min_salary` > 800;

SELECT * FROM `products`;

SELECT * FROM `categories`;

SELECT COUNT(`name`)
FROM `products`
WHERE `price` > 8
GROUP BY `category_id`
HAVING `category_id` = 2;

SELECT `category_id`,
		ROUND(AVG(`price`), 2) AS 'Average Price',
        MIN(`price`) AS 'Cheapest Product',
        MAX(`price`) AS 'Most Expensive Product'
FROM `products`
GROUP BY `category_id`;
