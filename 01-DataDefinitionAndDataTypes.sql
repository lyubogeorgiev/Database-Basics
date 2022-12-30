CREATE SCHEMA `gamebar` DEFAULT CHARACTER SET utf8;

USE `gamebar`;

CREATE TABLE `employees`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    PRIMARY KEY (`id`)
);

CREATE TABLE `categories`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE `products`(
	`id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `category_id` INT REFERENCES `categories`(`id`),
    PRIMARY KEY (`id`)
    -- FOREIGN KEY (`category_id`) REFERENCES `categories`(`id`)-- 
);

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES ('John', 'Travolta'),
		('Jenifer', 'Lopez'),
        ('Bill', 'Gates');
        
INSERT INTO `gamebar`.`categories` (`name`)
VALUES ('wine'),
		('beer'),
        ('liquor');
        
INSERT INTO `gamebar`.`products` (`name`, `category_id`)
VALUES ('Lagunitas', (SELECT `id` FROM `gamebar`.`categories` WHERE `name` = 'beer')),
		('New Amsterdam',(SELECT `id` FROM `gamebar`.`categories` WHERE `name` = 'liquor')),
        ('Kendall Jackson',(SELECT `id` FROM `gamebar`.`categories` WHERE `name` = 'wine'));
        
SELECT * FROM `employees` WHERE `first_name` = 'John';

DELETE FROM `employees` WHERE `first_name` = 'John';

ALTER TABLE `employees`
ADD COLUMN `middle_name` VARCHAR(100);

ALTER TABLE `products`
ADD CONSTRAINT fk_id
FOREIGN KEY (`category_id`)
REFERENCES `categories` (`id`);

ALTER TABLE `employees`
MODIFY `middle_name` VARCHAR(100);