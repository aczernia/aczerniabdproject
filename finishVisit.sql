USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[FinishVisit]    Script Date: 1/22/2020 9:15:38 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[FinishVisit]
	@VisitId int,
	@TotalPrice float
AS
BEGIN
	BEGIN TRANSACTION
	
	UPDATE Visit SET Price = @TotalPrice WHERE Id = @VisitId

	INSERT INTO VisitStatus(VisitStatusTypeId, VisitId, DateAdded) VALUES (3, @VisitId, CURRENT_TIMESTAMP)

	COMMIT TRANSACTION
END
GO


