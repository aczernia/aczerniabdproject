USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[BeginVisit]    Script Date: 1/22/2020 9:15:26 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[BeginVisit]
	@VisitId int
AS
BEGIN
	BEGIN TRANSACTION
	
	INSERT INTO VisitStatus(VisitStatusTypeId, VisitId, DateAdded) VALUES (2, @VisitId, CURRENT_TIMESTAMP)

	COMMIT TRANSACTION
END
GO


