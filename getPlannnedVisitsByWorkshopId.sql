USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[GetPlannedVisitsByWorkshopId]    Script Date: 1/22/2020 9:15:48 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GetPlannedVisitsByWorkshopId]
	@WorkshopId int
AS
BEGIN
	SELECT c.ClientName, c.VisitId, c.VisitDate, c.ServiceType, c.StatusTypeName, c.StatusTypeId
	FROM (
		SELECT (u.FirstName + ' ' + u.LastName) as ClientName, v.Id as VisitId, st.Name as ServiceType, v.VisitDate as VisitDate, ROW_NUMBER() OVER (PARTITION BY v.ID ORDER BY vs.DateAdded DESC) as rn, vst.Name as StatusTypeName, vst.Id as StatusTypeId, vs.DateAdded as PlannedDate, v.WorkshopId
		FROM Visit v
		INNER JOIN ServiceType st on st.Id = v.ServiceTypeId
		INNER JOIN VisitStatus vs on vs.VisitId = v.Id
		INNER JOIN VisitStatusType vst on vst.Id = vs.VisitStatusTypeId
		INNER JOIN "User" u on u.ID = v.UserId) as c
	WHERE c.rn = 1 AND StatusTypeId = 1 AND CAST(CURRENT_TIMESTAMP as Date) = CAST(c.VisitDate as Date) AND c.WorkshopId = @WorkshopId
END
GO


