USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[GetVisitsByUserId]    Script Date: 1/22/2020 9:15:53 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetVisitsByUserId]
	@UserId int,
	@WorkshopId int
AS
BEGIN
	SELECT (u.FirstName + ' ' + u.LastName) as Name, st.Name as ServiceName, v.VisitDate
	FROM Visit v
	INNER JOIN "User" u on u.Id = v.UserId
	INNER JOIN "ServiceType" st on st.Id = v.ServiceTypeId
	WHERE v.WorkshopId = @WorkshopId AND u.Id = @UserId
END
GO


