CREATE FUNCTION dbo.factorial
(@number_entry int)
RETURNS INT
AS
BEGIN
	DECLARE @i INT = 1, @result INT = 1
	WHILE 
	(@i <= @number_entry) 
		BEGIN 
		SET @result = @result * @i
		SET @i += 1
		END
RETURN @result
END

SELECT dbo.factorial(10)