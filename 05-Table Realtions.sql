USE `camp`;

CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `peaks`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50), 
    `mountain_id` INT,
    CONSTRAINT `fk_peaks_moutnais`
    FOREIGN KEY (`mountain_id`)
    REFERENCES `mountains` (`id`)
);

SELECT * FROM `campers`;

SELECT * FROM `vehicles`;

SELECT * 
FROM `campers`
JOIN `vehicles`
ON campers.vehicle_id = vehicles.id;

SELECT `campers`.`id`, `vehicles`.`vehicle_type`,
	CONCAT_WS(' ', `campers`.`first_name`, `campers`.`last_name`) AS 'driver_name'
FROM `vehicles`
JOIN `campers`
ON `vehicles`.`driver_id` = `campers`.`id`;

SELECT r.`starting_point` AS 'route_starting_point',
		r.`end_point` AS 'route_ending_point', 
        c.`id` AS 'leader_id',
        CONCAT_WS(' ', c.`first_name`, c.`last_name`) AS 'leader_name'
FROM `routes` AS r
JOIN `campers` AS c
ON r.`leader_id` = c.`id`;

DROP TABLE `peaks`;
DROP TABLE `mountains`;

CREATE TABLE `mountains`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45)
);

CREATE TABLE `peaks`(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(45),
    `mountain_id` INT,
    CONSTRAINT fk_peaks_mountains
    FOREIGN KEY (`mountain_id`)
    REFERENCES `mountains` (`id`)
    ON DELETE CASCADE
);
 DROP SCHEMA `project_management`;
CREATE SCHEMA `project_management`;
USE `project_management`;
CREATE TABLE `clients`(
	`id` INT(11) PRIMARY KEY, 
    `name` VARCHAR(100)
);

CREATE TABLE `projects`(
	`id` INT(11) PRIMARY KEY, 
	`client_id` INT(11), 
    `project_lead_id` INT(11)
);

CREATE TABLE `employees`(
	`id` INT(11) PRIMARY KEY,
    `first_name` VARCHAR(30),
    `last_name` VARCHAR(30),
    `project_id` INT(11)
);

ALTER TABLE `employees`
ADD 
    CONSTRAINT fk_employees_projects
    FOREIGN KEY (`project_id`)
    REFERENCES `projects` (`id`);
    
ALTER TABLE `projects`
ADD
CONSTRAINT fk_projects_employees
FOREIGN KEY (`project_lead_id`)
REFERENCES `employees` (`id`),
ADD
CONSTRAINT fk_projects_clients
FOREIGN KEY (`client_id`)
REFERENCES `clients` (`id`);