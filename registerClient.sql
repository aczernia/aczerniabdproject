CREATE PROCEDURE [dbo].[RegisterClient]
	@Username nvarchar(200),
	@FirstName nvarchar(200),
	@LastName nvarchar(200),
	@PhoneNumber nvarchar(200),
	@EmailAddress nvarchar(20),
	@PasswordHash nvarchar(30)
AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO "User"(Username, FirstName, LastName, PhoneNumber, EmailAddress, PasswordHash, RoleId, DateAdded, IsActive) 
		VALUES (@Username, @FirstName, @LastName, @PhoneNumber, @EmailAddress, @PasswordHash, 3, CURRENT_TIMESTAMP, 1);
	
	COMMIT TRANSACTION
END
