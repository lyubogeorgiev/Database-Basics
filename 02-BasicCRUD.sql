USE HOTEL;

SELECT `id`, `first_name`, `last_name`, `job_title`
FROM `employees`
ORDER BY `id` ASC;

SELECT `id`, 
CONCAT(`first_name`, ' ', `last_name`) AS 'Full Name',
`job_title`, 
`salary`
FROM `employees`
WHERE `salary` > 1000
ORDER BY `id` ASC;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
SELECT `salary` FROM `employees`;

SELECT * FROM `employees`
ORDER BY `salary` DESC
LIMIT 1;

SELECT * FROM `employees`
WHERE `department_id` = 4
AND `salary` >= 1000
ORDER BY `id` ASC;

DELETE FROM `employees`
WHERE `department_id` = 1 OR `department_id` = 2;

SELECT * FROM `employees`
ORDER BY `id` ASC;