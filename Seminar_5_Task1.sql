/*
Создать функцию, которая принимает кол-во секунд и фозвращает формат кол-во дней часов
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
