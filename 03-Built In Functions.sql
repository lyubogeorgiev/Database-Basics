SELECT `title`
FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = 'The'
ORDER BY `id`;

UPDATE `books`
SET `title` = REPLACE(`title`, 'The', '***');

SELECT `title` FROM `books`
WHERE SUBSTRING(`title`, 1, 3) = '***'
ORDER BY `id` ASC;

SELECT ROUND(SUM(`cost`), 2) FROM `books`;

SELECT CONCAT_WS(' ', `first_name`, `last_name`) AS 'Full Name',
TIMESTAMPDIFF(DAY, `born`, `died`) AS 'Days Lived'
FROM `authors`;

SELECT `title`
FROM `books`
WHERE `title` LIKE 'Harry Potter%';