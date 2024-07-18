/*
1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.
Пример: 123456 ->'1 days 10 hours 17 minutes 36 seconds '
*/

DELIMITER $$
CREATE FUNCTION task1(numb INT)
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
	DECLARE result VARCHAR(100) DEFAULT NULL;
    CASE
		WHEn numb <= 1 THEN
			SET result = CONCAT(numb, ' second');
		WHEN numb <= 60 THEN
			SET result = CONCAT(numb, ' seconds');
		WHEN numb > 60 AND numb <= 3600 THEN
			SET result = CONCAT(numb DIV 60, ' minuts', ' ', MOD(numb, 60), ' seconds');
		WHEN numb > 3600 AND numb <= 86400 THEN
			SET result = CONCAT(numb DIV 3600, ' hours', ' ', MOD(numb, 60), ' minuts', ' ', MOD(numb, 60), ' seconds');
		WHEN numb > 84600 THEN
			SET result = CONCAT(numb DIV 86400, ' days', ' ', MOD(numb, 86400) DIV 3600, ' hours', ' ', MOD(MOD(numb, 86400),3600) DIV 60, ' minutes', ' ', MOD(MOD(MOD(numb, 86400),3600),60), ' seconds');
	END CASE;
    RETURN result;
END $$
DELIMITER ;

SELECT task1(123456);


/*
2. Выведите только чётные числа от 1 до 10.
Пример: 2,4,6,8,10
*/

DELIMITER $$
CREATE PROCEDURE task2(numb1 INT, numb2 INT)
BEGIN
	DECLARE numb INT DEFAULT numb1;
    DECLARE result TEXT DEFAULT NULL;
    WHILE  numb <= numb2 DO
        IF numb % 2 = 0 THEN
			IF result IS NULL THEN
				SET result = CONCAT(numb);
			ELSE
				SET result = CONCAT(result, ', ', numb);
			END IF;
		END IF;
        SET numb = numb + 1;
    END WHILE;
	SELECT result;
END $$
DELIMITER ;

CALL task2(1, 15);
