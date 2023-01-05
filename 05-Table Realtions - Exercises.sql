DROP TABLE `people`;
DROP TABLE `passports`;

CREATE TABLE `passports`(
	`passport_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `passport_number` VARCHAR(50)
);

INSERT INTO `passports` (`passport_id`, `passport_number`)
VALUES
	(101, 'N34FG21B'),
	(102, 'K65LO4R7'),
	(103, 'ZE657QP2');
    
CREATE TABLE `people`(
	`person_id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    `first_name` VARCHAR(50),
    `salary` DECIMAL(9, 2),
    `passport_id` INT UNIQUE,
    CONSTRAINT fk_people_passports
    FOREIGN KEY (`passport_id`)
    REFERENCES `passports` (`passport_id`)
);


INSERT INTO `people` (`person_id`, `first_name`, `salary`, `passport_id`)
VALUES
	(1, 'Roberto', 43300.00, 102),
	(2, 'Tom', 56100.00, 103),
	(3, 'Yana', 60200.00, 101);
    
CREATE TABLE `manufacturers`(
	`manufacturer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50),
    `established_on` DATE
);

CREATE TABLE `models`(
	`model_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50), 
	`manufacturer_id` INT,
    CONSTRAINT fk_models_manufacturers
    FOREIGN KEY (`manufacturer_id`)
    REFERENCES `manufacturers` (`manufacturer_id`)
);

INSERT INTO `manufacturers` (`name`, `established_on`)
VALUES
	('BMW', '1916-03-01'),
	('Tesla', '2003-01-01'),
	('Lada', '1966-05-01');
    
INSERT INTO `models` (`model_id`, `name`, `manufacturer_id`)
VALUES
	(101, 'X1', 1),
	(102, 'i6', 1),
	(103, 'Model S', 2),
	(104, 'Model X', 2),
	(105, 'Model 3', 2),
	(106, 'Nova', 3);
    
CREATE TABLE `students` (
	`student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50)
);

CREATE TABLE `exams`(
	`exam_id` INT PRIMARY KEY AUTO_INCREMENT, 
    `name` VARCHAR(50)
);

CREATE TABLE `students_exams`(
	`student_id` INT,
    `exam_id` INT,
    CONSTRAINT pk_students_exams
    PRIMARY KEY (`student_id`, `exam_id`),
    CONSTRAINT fk_students_exams_students
    FOREIGN KEY (`student_id`)
    REFERENCES `students` (`student_id`),
    CONSTRAINT fk_students_exams_exams
    FOREIGN KEY (`exam_id`)
    REFERENCES `exams` (`exam_id`)
);

INSERT INTO `students` (`name`)
VALUES
	('Mila'),
	('Toni'),
	('Ron');
    
INSERT INTO `exams` (`exam_id`, `name`)
VALUES 
	(101, 'Spring MVC'),
	(102, 'Neo4j'),
	(103, 'Oracle 11g');
    
INSERT INTO `students_exams`
VALUES
	(1, 101),
	(1, 102),
	(2, 101),
	(3, 103),
	(2, 102),
	(2, 103);
    
CREATE TABLE `teachers` (
	`teacher_id` INT NOT NULL, 
    `name` VARCHAR(50), 
    `manager_id` INT,
    CONSTRAINT pk_teacher_id
    PRIMARY KEY (`teacher_id`),
    CONSTRAINT fk_techaer_id_manager_id
    FOREIGN KEY (`manager_id`)
    REFERENCES `teachers` (`teacher_id`)
);

INSERT INTO `teachers` (`teacher_id`, `name`)
VALUES 
	(101, 'John'),
	(102, 'Maya'),
	(103, 'Silvia'),
	(104, 'Ted'),
	(105, 'Mark'),
	(106, 'Greta');
    
UPDATE `teachers`
SET `manager_id` = 106
WHERE `teacher_id` = 102;

UPDATE `teachers`
SET `manager_id` = 106
WHERE `teacher_id` = 103;

UPDATE `teachers`
SET `manager_id` = 105
WHERE `teacher_id` = 104;

UPDATE `teachers`
SET `manager_id` = 101
WHERE `teacher_id` = 105;

UPDATE `teachers`
SET `manager_id` = 101
WHERE `teacher_id` = 106;


CREATE TABLE `item_types`(
	`item_type_id` INT(11) PRIMARY KEY NOT NULL, 
    `name` VARCHAR(50)
);

CREATE TABLE `items`(
	`item_id` INT(11) PRIMARY KEY NOT NULL,
    `name` VARCHAR(50), 
    `item_type_id` INT(11),
    CONSTRAINT fk_items_item_types
    FOREIGN KEY (`item_type_id`)
    REFERENCES `item_types` (`item_type_id`)
);

CREATE TABLE `cities` (
	`city_id` INT(11) PRIMARY KEY NOT NULL,
    `name` VARCHAR(50)
);

CREATE TABLE `customers` (
	`customer_id` INT(11) PRIMARY KEY NOT NULL,
    `name` VARCHAR(50),
    `birthday` DATE,
    `city_id` INT(11),
    CONSTRAINT fk_customers_cities
    FOREIGN KEY (`city_id`)
    REFERENCES `cities` (`city_id`)
);

CREATE TABLE `orders` (
	`order_id` INT(11) PRIMARY KEY NOT NULL,
    `customer_id` INT(11),
    CONSTRAINT fk_orders_customers
    FOREIGN KEY (`customer_id`)
    REFERENCES `customers` (`customer_id`)
);

CREATE TABLE `order_items` (
	`order_id` INT(11) NOT NULL, 
    `item_id` INT(11) NOT NULL, 
    CONSTRAINT pk_order_id_item_id
    PRIMARY KEY (`order_id`, `item_id`),
    CONSTRAINT fk_order_items_orders
    FOREIGN KEY (`order_id`)
    REFERENCES `orders` (`order_id`),
    CONSTRAINT fk_order_items_items
    FOREIGN KEY (`item_id`)
    REFERENCES `items` (`item_id`)
);

CREATE TABLE `majors`(
	`major_id` INT(11) PRIMARY KEY NOT NULL, 
    `name` VARCHAR(50)
);

CREATE TABLE `students` (
	`student_id` INT(11) PRIMARY KEY NOT NULL, 
    `student_number` VARCHAR(12),
    `student_name` VARCHAR(50),
    `major_id` INT(11),
    CONSTRAINT fk_students_majors
    FOREIGN KEY (`major_id`)
    REFERENCES `majors` (`major_id`)
);

CREATE TABLE `payments` (
	`payment_id` INT(11) PRIMARY KEY NOT NULL,
    `payment_date` DATE, 
    `payment_amount` DECIMAL(8, 2), 
    `student_id` INT(11),
    CONSTRAINT fk_payments_students
    FOREIGN KEY (`student_id`)
    REFERENCES `students` (`student_id`)
);

CREATE TABLE `subjects` (
	`subject_id` INT(11) PRIMARY KEY NOT NULL,
    `subject_name` VARCHAR(50)
);

CREATE TABLE `agenda`(
	`student_id` INT(11) NOT NULL,
    `subject_id` INT(11) NOT NULL,
    CONSTRAINT pk_student_id_subject_id
    PRIMARY KEY (`student_id`, `subject_id`),
    CONSTRAINT fk_agenda_students
    FOREIGN KEY (`student_id`)
    REFERENCES `students` (`student_id`),
    CONSTRAINT fk_agenda_subjects
    FOREIGN KEY (`subject_id`)
    REFERENCES `subjects` (`subject_id`)
);

USE `geography`;

SELECT 
	m.`mountain_range`,
    p.`peak_name`,
    p.`elevation`
FROM `peaks` AS p
JOIN `mountains` AS m
ON p.`mountain_id` = m.`id`
WHERE m.`mountain_range` = 'Rila'
ORDER BY p.`elevation` DESC;