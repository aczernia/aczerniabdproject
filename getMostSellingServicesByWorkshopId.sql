USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[GetMostSellingServicesByWorkshopId]    Script Date: 1/22/2020 9:15:44 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[GetMostSellingServicesByWorkshopId]
	@WorkshopId int
AS
BEGIN
	SELECT count(v.Id) as VisitNumber, st.name as VisitName
	FROM Visit v
	INNER JOIN ServiceType st on st.Id = v.ServiceTypeId
	WHERE v.WorkshopId = @WorkshopId
	GROUP BY st.Id, st.Name
	ORDER BY count(v.Id) DESC
END
GO


