USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[RegisterVisit]    Script Date: 1/22/2020 9:15:59 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RegisterVisit]
	@UserId int,
	@WorkshopId int,
	@ServiceTypeId int,
	@VisitDate datetime
AS
BEGIN
	BEGIN TRANSACTION
	INSERT INTO "Visit"(ServiceTypeId, WorkshopId, UserId, Price, VisitDate) 
		VALUES (@ServiceTypeId, @WorkshopId, @UserId, null, @VisitDate);
	
	declare @VisitId int;
	SET @VisitId = @@IDENTITY

	INSERT INTO "VisitStatus"(VisitStatusTypeId, VisitId, DateAdded) 
		VALUES (1, @VisitId, CURRENT_TIMESTAMP)

	COMMIT TRANSACTION
END
GO


