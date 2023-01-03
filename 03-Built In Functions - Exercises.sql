USE `soft_uni`;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `first_name` LIKE 'Sa%'
ORDER BY `employee_id`;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `last_name` LIKE '%ei%'
ORDER BY `employee_id` ASC;

SELECT `first_name`, YEAR(`hire_date`), `department_id` FROM `employees`
WHERE `department_id` IN (3,10);

SELECT `first_name`
FROM `employees` 
WHERE `department_id` IN (3, 10)
AND YEAR(`hire_date`) BETWEEN 1995 AND 2005
ORDER BY `employee_id` ASC;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `job_title` NOT LIKE '%engineer%'
ORDER BY `employee_id` ASC;

SELECT `name`
FROM `towns`
WHERE LENGTH(`name`) IN (5,6)
ORDER BY `name` ASC;

SELECT SUBSTRING(`name`, 1, 1) FROM `towns`;

SELECT `town_id`, `name`
FROM `towns`
WHERE UPPER(SUBSTRING(`name`, 1, 1)) IN ('M', 'K', 'B', 'E')
ORDER BY `name` ASC;

SELECT `town_id`, `name`
FROM `towns`
WHERE SUBSTRING(`name`, 1, 1) NOT IN('R', 'B', 'D')
ORDER BY `name`; 

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`, `last_name`
FROM `employees`
WHERE YEAR(`hire_date`) > 2000;

SELECT * FROM `v_employees_hired_after_2000`;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE LENGTH(`last_name`) = 5;

USE `geography`;

SELECT `country_name`, `iso_code`
FROM `countries`
WHERE (LENGTH(`country_name`) - LENGTH(REPLACE(UPPER(`country_name`), 'A', ''))) >= 3
ORDER BY `iso_code` ASC;

SELECT `country_name`, `iso_code`,
LENGTH(`country_name`) AS 'CountryLength',
LENGTH(REPLACE(UPPER(`country_name`), 'A', '')) AS 'Length after replacement'
FROM `countries`;

SELECT `peaks`.`peak_name`, `rivers`.`river_name`, LOWER(CONCAT(`peaks`.`peak_name`, SUBSTRING(`rivers`.`river_name`, 2, LENGTH(`rivers`.`river_name`)))) as 'mix'
FROM `peaks`
INNER JOIN `rivers`
ON SUBSTRING(`peaks`.`peak_name`, LENGTH(`peaks`.`peak_name`), LENGTH(`peaks`.`peak_name`)) = SUBSTRING(`rivers`.`river_name`, 1, 1)
ORDER BY `mix` ASC;

USE `diablo`;

SELECT `name`, DATE_FORMAT(`start`, '%Y-%m-%d') AS 'start'
FROM `games`
WHERE YEAR(`start`) IN(2011, 2012)
ORDER BY `start` ASC, `name` ASC
LIMIT 50;

SELECT `user_name`, SUBSTRING(`email`, POSITION('@' IN `email`) + 1, LENGTH(`email`)) AS 'email provider'
FROM `users`
ORDER BY `email provider` ASC,
`user_name` ASC;

SELECT `user_name`, `ip_address`
FROM `users`
WHERE `ip_address` LIKE '___.1%.%.___'
ORDER BY `user_name` ASC;

SELECT HOUR(`start`) AS 'time start' FROM `games`;

SELECT IF (HOUR(`start`) > 0, 'GREATER', 'LOWER') AS 'Test'
FROM `games`;

SELECT IF (HOUR(`start`) BETWEEN 0 AND 11, CONCAT('Bt0-12 ',HOUR(`start`)), IF(HOUR(`start`) BETWEEN 12 AND 17, CONCAT('Bt12-18 ',HOUR(`start`)), CONCAT('Bt18-24 ',HOUR(`start`)))) AS 'Part of the Day'
FROM `games`;

SELECT `name`,
		IF (HOUR(`start`) BETWEEN 0 AND 11, 'Morning', IF(HOUR(`start`) BETWEEN 12 AND 17, 'Afternoon', 'Evening')) AS 'Part of the Day',
        IF (`duration` <= 3, 'Extra Short', IF (`duration` BETWEEN 3 AND 6, 'Short', IF (`duration` BETWEEN 6 AND 10, 'Long', 'Extra Long'))) AS 'Duration'
FROM `games`;


USE `orders`;

SELECT `product_name`, `order_date`,
ADDDATE(`order_date`, 3) AS 'pay_due',
ADDDATE(`order_date`, INTERVAL 1 MONTH) AS 'delivery_due'
FROM `orders`; 