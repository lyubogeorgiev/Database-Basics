DROP SCHEMA `soft_uni`;

USE `soft_uni`;

SELECT
	e.`employee_id`,
    CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS 'full_name', 
    d.`department_id`,
    d.`name`
FROM `departments` AS d
JOIN `employees` AS e
ON d.`manager_id` = e.`employee_id`
ORDER BY e.`employee_id` ASC
LIMIT 5;

SELECT 
	t.`town_id`,
    t.`name`,
    e.`address_text`
FROM `addresses` AS e
JOIN `towns` AS t
ON e.`town_id` = t.`town_id`
WHERE t.`name` IN ('San Francisco', 'Sofia', 'Carnation')
ORDER BY t.`town_id`, e.`address_id`;

SELECT
	`employee_id`,
    `first_name`,
    `last_name`,
    `department_id`,
    `salary`
FROM `employees`
WHERE `manager_id` IS NULL;

SELECT COUNT(`salary`)
FROM `employees`
WHERE `salary` > (SELECT AVG(`SALARY`) FROM `employees`);