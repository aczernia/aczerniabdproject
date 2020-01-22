USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[GetServicesForWorkshop]    Script Date: 1/22/2020 9:15:51 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[GetServicesForWorkshop]
	@WorkshopId int
AS
BEGIN
	SELECT st.Name
	FROM Workshop w
	INNER JOIN WorkshopServiceType wst on wst.WorkshopId = w.Id
	INNER JOIN ServiceType st on wst.ServiceTypeId = st.Id
	WHERE w.Id = @WorkshopId
END
GO


