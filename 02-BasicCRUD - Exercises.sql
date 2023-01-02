SELECT * FROM `departments`
ORDER BY `department_id` ASC;

SELECT `name` FROM `departments`
ORDER BY `department_id` ASC;

SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id` ASC;

SELECT `first_name`, `middle_name`, `last_name` FROM `employees`;

SELECT
CONCAT(`first_name`, '.', `last_name`, '@softuni.bg') AS 'full_email_address'
FROM `employees`;

SELECT `salary` FROM `employees`;

SELECT * FROM `employees`
WHERE `job_title` = 'Sales Representative'
ORDER BY `employee_id` ASC;

SELECT `first_name`, `last_name`, `job_title`
FROM `employees`
WHERE `salary` BETWEEN 20000 AND 30000
ORDER BY `employee_id` ASC;

SELECT 
concat_ws(' ' , `first_name`, `middle_name`, `last_name`) AS 'Full Name'
FROM `employees`
WHERE `salary` IN(25000, 14000, 12500, 23600)
ORDER BY `employee_id` ASC;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `first_name`, `last_name`, `salary`
FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

SELECT `first_name`, `last_name`
FROM `employees`
ORDER BY `salary` DESC
LIMIT 5;

SELECT `first_name`, `last_name`
FROM `employees`
WHERE `department_id` NOT IN (4);

SELECT * FROM `employees`
ORDER BY `salary` DESC,
`first_name` ASC,
`last_name` DESC,
`middle_name` ASC;

CREATE VIEW `v_employees_salaries` AS
SELECT `first_name`, `last_name`, `salary`
FROM `employees`;

SELECT * FROM `v_employees_salaries`;

CREATE VIEW `v_employees_job_titles` AS
SELECT CONCAT_WS(' ', `first_name`, IF(`middle_name` = NULL, '', `middle_name`), `last_name`) AS 'Full Name',
`job_title`
FROM `employees`;

DROP VIEW `v_employees_job_titles`;

SELECT * FROM `v_employees_job_titles`;

SELECT DISTINCT `job_title`
FROM `employees`;

SELECT * FROM `projects`
ORDER BY `start_date` ASC, `name` ASC
LIMIT 10;

SELECT `first_name`, `last_name`, `hire_date`
FROM `employees`
ORDER BY `hire_date` DESC
LIMIT 7;

UPDATE `employees`
SET `salary` =  `salary` * 1.12
WHERE `department_id` IN (
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Engineering'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Tool Design'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Marketing'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Information Services'));

SELECT `salary`
FROM `employees` 
WHERE `department_id` IN (
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Engineering'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Tool Design'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Marketing'),
	(SELECT `department_id` FROM `departments` WHERE `name` = 'Information Services'));

UPDATE `employees`
SET `salary` =  `salary` * 1.12
WHERE `department_id` IN (
	1,
	2,
	4,
	11);

SELECT `salary`
FROM `employees` 
WHERE `department_id` IN (
	1,
	2,
	4,
	11);
    
SELECT * FROM `departments`;

USE `geography`;

SELECT `peak_name` FROM `peaks`
ORDER BY `peak_name` ASC;

SELECT * FROM `continents`;

SELECT `country_name`, `population`
FROM `countries`
WHERE `continent_code` = 'EU'
ORDER BY `population` DESC, `country_name` ASC
LIMIT 30;

SELECT * FROM `currencies`;

SELECT `country_name`, `country_code`, IF(`currency_code` = 'EUR', 'Euro', 'Not Euro')
FROM `countries`
ORDER BY `country_name` ASC;

USE `diablo`;

SELECT `name`
FROM `characters`
ORDER BY `name` ASC;