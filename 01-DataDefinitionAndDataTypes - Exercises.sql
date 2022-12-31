CREATE SCHEMA `minions`;

USE `minions`;

CREATE TABLE `minions`(
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50),
    `age` INT
);

CREATE TABLE `towns`(
	`town_id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(50)
);

ALTER TABLE `minions`
ADD `town_id` INT;

ALTER TABLE `minions`
ADD CONSTRAINT fk_town_id
FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`);

INSERT INTO `towns` (`id`, `name`)
VALUES (1, 'Sofia'),
		(2, 'Plovdiv'),
        (3, 'Varna');

INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUES (1, 'Kevin', 22, (SELECT `id` FROM `towns` WHERE `name` = 'Sofia')),
		(2, 'Bob', 15, (SELECT `id` FROM `towns` WHERE `name` = 'Varna')),
        (3, 'Steward', NULL, (SELECT `id` FROM `towns` WHERE `name` = 'Plovdiv'));

DELETE FROM `minions`;

DROP TABLE `minions`, `towns`;

CREATE TABLE `people` (
	`id` INT AUTO_INCREMENT UNIQUE,
    `name` VARCHAR(200) NOT NULL, 
    `picture` BLOB,
    `height` FLOAT(5,2), 
    `weight` FLOAT(5,2),
    `gender` CHAR(1) NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
    );
    
INSERT INTO `people` (`id`, `name`, `height`, `weight`, `gender`, `birthdate` )
VALUES (1, 'John', 176.00, 186.32, 'M', DATE(NOW())),
		(2, 'George', 165.23, 150.50, 'M', DATE(NOW())),
		(3, 'Peter', 184.00, 179.00, 'M', DATE(NOW())),
		(4, 'Alan', 93.00, 125.65, 'M', DATE(NOW())),
		(5, 'Steve', 164.35, 79.46, 'M', DATE(NOW()));
            
DROP TABLE `people`; 

TRUNCATE TABLE `people`;

CREATE TABLE `users` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATETIME,
    `is_deleted` BOOL
);
    
DROP TABLE `users`;

INSERT INTO `users` (`id`, `username`, `password`)
VALUES (1, 'lyubakis', '1234565') ,
		(2, 'georgie_1', '654321'),
        (3, 'some_user', 'passward_321'),
        (4, 'user_1', 'supersecret'),
        (5, 'user_2', 'top_secret');
        
ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`, `username`);

ALTER TABLE `users`
modify `last_login_time`  DATETIME DEFAULT CURRENT_TIMESTAMP;

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD PRIMARY KEY (`id`),
ADD UNIQUE (`username`);

CREATE SCHEMA `movies`;

USE `movies`;

CREATE TABLE `directors` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `genres` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `categories` (
	`id` INT AUTO_INCREMENT PRIMARY KEY,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` TEXT
);

CREATE TABLE `movies`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `title` VARCHAR(50) NOT NULL,
    `director_id` INT, 
    `copyright_year` YEAR,
    `length` INT, 
    `genre_id` INT,
    `category_id` INT, 
    `rating` FLOAT, 
    `notes` TEXT
);

INSERT INTO `directors` (`id`, `director_name`)
VALUES (1, 'John Hopkins'),
		(2, 'John K. Hopkins'),
        (3, 'John Travolta'),
        (4, 'John Rees'),
        (5, 'John King');
        
INSERT INTO `genres` (`id`, `genre_name`)
VALUES (1, 'Thriller'),
		(2, 'Comedy'),
        (3, 'Action'),
        (4, 'Fantasy'),
        (5, 'Documentary');

INSERT INTO `categories` (`id`, `category_name`)
VALUES (1, 'Paid'),
		(2, 'Free'),
        (3, 'Free with Prime'),
        (4, 'Preview only'),
        (5, 'Trailer');
        
INSERT INTO `movies` (`id`, `title`, `director_id`, `genre_id`, `category_id`)
VALUES (1, '', 2, 3, 4),
		(2, '', 3, 2, 3),
        (3, '', 4, 1, 2),
        (4, '', 5, 4, 5),
        (5, '', 1, 5, 1);

CREATE SCHEMA `car_rental`;

USE `car_rental`;

CREATE TABLE `categories` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `category` VARCHAR(50) NOT NULL, 
    `daily_rate` FLOAT, 
    `weekly_rate` FLOAT, 
    `monthly_rate` FLOAT, 
    `weekend_rate` FLOAT
);

CREATE TABLE `cars` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `plate_number` VARCHAR(50), 
    `make` VARCHAR(50), 
    `model` VARCHAR(50), 
    `car_year` YEAR, 
    `category_id` INT, 
    `doors` INT, 
    `picture` BLOB, 
    `car_condition` VARCHAR(50), 
    `available` BOOL
);

CREATE TABLE `employees` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
	`first_name` VARCHAR(50), 
	`last_name` VARCHAR(50), 
	`title` VARCHAR(50), 
	`notes` TEXT
);

CREATE TABLE `customers` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `driver_licence_number` VARCHAR(50), 
    `full_name` VARCHAR(50), 
    `address` VARCHAR(200), 
    `city` VARCHAR(50), 
    `zip_code` VARCHAR(50), 
    `notes` TEXT
);

CREATE TABLE `rental_orders` (
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `employee_id` INT, 
    `customer_id` INT, 
    `car_id` INT, 
    `car_condition` VARCHAR(50), 
    `tank_level` INT, 
    `kilometrage_start` INT, 
    `kilometrage_end` INT, 
    `total_kilometrage` INT, 
    `start_date` DATE, 
    `end_date` DATE, 
    `total_days` INT, 
    `rate_applied` FLOAT, 
    `tax_rate` FLOAT, 
    `order_status` VARCHAR(50), 
    `notes` TEXT
);

INSERT INTO `categories` (`id`, `category`, `daily_rate`)
VALUES (1, 'Van', 250),
		(2, 'Sedan', 120),
        (3, 'Sport', 320);

INSERT INTO `cars` (`id`, `plate_number`, `make`, `model`, `category_id`)
VALUES (1, 'GLA213', 'Mecedes', 'C-class', 3),
		(2, 'U602LA', 'Audi', 'A5', 2),
        (3, 'MG312A', 'Volkswagen', 'Passat', 1);

INSERT INTO `employees` (`id`, `first_name`, `last_name`)
VALUES (1, 'John', 'Smith'),
		(2, 'Jenifer', 'Lopez'),
        (3, 'Bill', 'Gates');

INSERT INTO `customers` (`id`, `driver_licence_number`, `full_name`)
VALUES (1, '135678954', 'Donald Trump'),
		(2, '789654123', 'John Travolta'),
        (3, '456369741', 'Mariah Carry');

INSERT INTO `rental_orders` (`id`, `employee_id`, `customer_id`, `car_id`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, `total_days`, `rate_applied`)
VALUES (1, 3, 2, 1, 1000, 1200, 200, 3, 200.00),
		(2, 2, 1, 2, 12400, 13000, 600, 6, 123.50),
        (3, 1, 3, 3, 25320, 26340, 1020, 7, 321.00);
        
CREATE SCHEMA `soft_uni`;

USE `soft_uni`;

CREATE TABLE `towns`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(50)
);

CREATE TABLE `addresses`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `address_text` VARCHAR(200), 
    `town_id` INT,
    FOREIGN KEY (`town_id`) REFERENCES `towns` (`id`)
);

CREATE TABLE `departments`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `name` VARCHAR(200)
);

CREATE TABLE `employees`(
	`id` INT AUTO_INCREMENT PRIMARY KEY, 
    `first_name` VARCHAR(50), 
    `middle_name` VARCHAR(50), 
    `last_name` VARCHAR(50), 
    `job_title` VARCHAR(50), 
    `department_id` INT, 
    `hire_date` DATE, 
    `salary` FLOAT, 
    `address_id` INT,
    FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`),
    FOREIGN KEY (`address_id`) REFERENCES `addresses` (`id`)
);

INSERT INTO `towns` (`name`)
VALUES ('Sofia'),
		('Plovdiv'),
        ('Varna'),
        ('Burgas');

INSERT INTO `departments` (`name`)
VALUES ('Engineering'),
		('Sales'),
        ('Marketing'),
        ('Software Development'),
        ('Quality Assurance');

INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES ('Ivan', 'Ivanov', 'Ivanov', '.NET Developer', 4, '2013-02-01', 3500.00),
		('Petar', 'Petrov', 'Petrov', 'Senior Engineer', 1, '2004-03-02', 4000.00),
        ('Maria', 'Petrova', 'Ivanova', 'Intern', 5, '2016-08-28', 525.25),
        ('Georgi', 'Terziev', 'Ivanov', 'CEO', 2, '2007-12-09', 3000.00),
        ('Peter', 'Pan', 'Pan', 'Intern', 3, '2016-08-28', 599.88);
        
SELECT * FROM `towns`;

SELECT * FROM `towns` 
ORDER BY `name` ASC;

SELECT * FROM `departments`;

SELECT * FROM `departments`
ORDER BY `name` ASC;

SELECT * FROM `employees`;

SELECT * FROM `employees`
ORDER BY `salary` DESC;

SELECT `name` FROM `towns`
ORDER BY `name` ASC;

SELECT `name` FROM `departments`
ORDER BY `name` ASC;

SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

UPDATE `employees`
SET `salary` = `salary` * 1.1;

