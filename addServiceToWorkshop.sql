USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[AddServiceToWorkshop]    Script Date: 1/22/2020 9:15:19 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[AddServiceToWorkshop]
	@WorkshopId int,
	@ServiceTypeId int
AS
BEGIN
	BEGIN TRANSACTION
	
	INSERT INTO WorkshopServiceType(ServiceTypeId, WorkshopId) VALUES (@ServiceTypeId, @WorkshopId);

	COMMIT TRANSACTION
END
GO


