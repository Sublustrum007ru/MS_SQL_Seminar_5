/* 
Выведите только четные числа от 1 до 10.
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


    