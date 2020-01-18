CREATE PROCEDURE [dbo].[RegisterWorkshop]
	@Name nvarchar(200),
	@PhoneNumber nvarchar(200),
	@EmailAddress nvarchar(200),
	@CityId int,
	@AddressLine1 nvarchar(200),
	@AddressLine2 nvarchar(200),
	@Latitude float,
	@Longitude float,
	@Username nvarchar(200),
	@PasswordHash nvarchar(200)
AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO "User"(Username, FirstName, LastName, PhoneNumber, EmailAddress, PasswordHash, RoleId, DateAdded, IsActive) 
		VALUES (@Username, '', '', @PhoneNumber, @EmailAddress, @PasswordHash, 2, CURRENT_TIMESTAMP, 1);

	declare @UserId int;
	SET @UserId = @@IDENTITY
	
	INSERT INTO "Workshop"(PhoneNumber, Name, UserId, IsActive, DateAdded)
		VALUES (@PhoneNumber, @Name, @UserId, 1, CURRENT_TIMESTAMP);

	declare @WorkshopId int;
	SET @WorkshopId = @@IDENTITY

	INSERT INTO "Address"(WorkshopId, CityId, AddressLine1, AddressLine2, Latitude, Longitude)
		VALUES (@WorkshopId, @CityId, @AddressLine1, @AddressLine2, @Latitude, @Longitude)
	
	COMMIT TRANSACTION
END
