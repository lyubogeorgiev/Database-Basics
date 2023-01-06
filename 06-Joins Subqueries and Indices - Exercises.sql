USE `soft_uni`;

SELECT 
	e.`employee_id`,
    e.`job_title`,
    a.`address_id`,
    a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
ORDER BY a.`address_id` ASC
LIMIT 5;

SELECT 
	e.`first_name`,
	e.`last_name`,
    t.`name` AS 'town',
    a.`address_text`
FROM `employees` AS e
JOIN `addresses` AS a
ON e.`address_id` = a.`address_id`
JOIN `towns` AS t
ON a.`town_id` = t.`town_id`
ORDER BY e.`first_name` ASC, e.`last_name` ASC
LIMIT 5;

SELECT 
	e.`employee_id`,
	e.`first_name`,
    e.`last_name`,
    d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE d.`name` = 'Sales'
ORDER BY e.`employee_id` DESC;

SELECT 
	e.`employee_id`,
    e.`first_name`,
    e.`salary`,
    d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`salary` > 15000
ORDER BY d.`department_id` DESC
LIMIT 5;

SELECT 
	e.`employee_id`,
    e.`first_name`
FROM `employees` AS e
LEFT JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
WHERE `project_id` IS NULL
ORDER BY e.`employee_id` DESC
LIMIT 3;

SELECT 
	e.`first_name`,
    e.`last_name`,
    e.`hire_date`, 
    d.`name`
FROM `employees` AS e
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`hire_date` > '1999-01-01'
AND d.`name` IN ('Sales', 'Finance')
ORDER BY e.`hire_date` ASC;

SELECT 
	e.`employee_id`,
    e.`first_name`, 
    p.`name` AS `project_name`
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
ON ep.`project_id` = p.`project_id`
WHERE DATE(p.`start_date`) >= '2002-08-13'
AND p.`end_date` IS NULL
ORDER BY e.`first_name` ASC, p.`name` ASC
LIMIT 5;

SELECT 
	e.`employee_id`,
    e.`first_name`,
    IF (YEAR(p.`start_date`) < 2005, p.`name`, NULL) AS 'project_name'
FROM `employees` AS e
JOIN `employees_projects` AS ep
ON e.`employee_id` = ep.`employee_id`
JOIN `projects` AS p
ON ep.`project_id` = p.`project_id`
WHERE e.`employee_id` = 24
ORDER BY p.`name` ASC;

SELECT
	em.`employee_id`,
    em.`first_name`,
    em.`manager_id`,
    m.`first_name` AS 'manager_name'
FROM `employees` AS em
JOIN `employees` AS m
ON em.`manager_id` = m.`employee_id`
WHERE em.`manager_id` IN (3, 7)
ORDER BY em.`first_name` ASC;

SELECT 
	e.`employee_id`,
    CONCAT_WS(' ', e.`first_name`, e.`last_name`) AS 'employee_name',
    CONCAT_WS(' ', m.`first_name`, m.`last_name`) AS 'manager_name',
    d.`name` AS 'department_name'
FROM `employees` AS e
JOIN `employees` AS m
ON e.`manager_id` = m.`employee_id`
JOIN `departments` AS d
ON e.`department_id` = d.`department_id`
WHERE e.`manager_id` IS NOT NULL
ORDER BY e.`employee_id`
LIMIT 5;

USE `soft_uni`;

SELECT AVG(`salary`) AS 'min_avg_salary'
FROM `employees`        
GROUP BY `department_id`
ORDER BY `min_avg_salary`
LIMIT 1;

USE `geography`;

SELECT 
	c.`country_code`,
    m.`mountain_range`,
    p.`peak_name`,
    p.`elevation`
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` = m.`id`
JOIN `peaks` as p
ON m.`id` = p.`mountain_id`
WHERE c.`country_name` = 'Bulgaria' AND p.`elevation` > 2835
ORDER BY p.`elevation` DESC;

SELECT
	c.`country_code`,
	COUNT(m.`mountain_range`) AS 'mountain_range'
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` = m.`id`
WHERE c.`country_name` IN ('United States', 'Russia', 'Bulgaria')
GROUP BY c.`country_code`
ORDER BY `mountain_range` DESC;

SELECT
	c.`country_name`,
	r.`river_name`
FROM `countries` AS c
LEFT JOIN `countries_rivers` AS cr
ON c.`country_code` = cr.`country_code`
LEFT JOIN `rivers` AS r
ON cr.`river_id` = r.`id`
JOIN `continents` AS co
ON c.`continent_code` = co.`continent_code`
WHERE co.`continent_name` = 'Africa'
ORDER BY c.`country_name` ASC
LIMIT 5;

SELECT
	cn.`continent_code`,
    c.`country_code`,
    cr.`currency_code`,
    COUNT(cr.`currency_code`) AS `currency_usage`
FROM `continents` AS cn
JOIN `countries` AS c
ON cn.`continent_code` = c.`continent_code`
JOIN `currencies` AS cr
ON c.`currency_code` = cr.`currency_code`
WHERE c.`currency_code` = (
	SELECT `currency_code`
)
GROUP BY cn.`continent_code`
ORDER BY `currency_usage` DESC, cn.`continent_code`, cr.`currency_code`;

SELECT
	COUNT(*) AS 'country_count'
FROM `countries` AS c
LEFT JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
WHERE mc.`mountain_id` IS NULL;

SELECT 
	c.`country_name`,
    MAX(p.`elevation`) AS 'highest_peak_elevation',
    MAX(r.`length`) AS 'longest_river_length'
FROM `countries` AS c
JOIN `mountains_countries` AS mc
ON c.`country_code` = mc.`country_code`
JOIN `mountains` AS m
ON mc.`mountain_id` = m.`id`
JOIN `peaks` AS p
ON p.`mountain_id` = m.`id`
JOIN `countries_rivers` AS cr
ON c.`country_code` = cr.`country_code`
JOIN `rivers` AS r
ON cr.`river_id` = r.`id`
GROUP BY c.`country_code`
ORDER BY `highest_peak_elevation` DESC, `longest_river_length` DESC, c.`country_name` ASC
LIMIT 5;