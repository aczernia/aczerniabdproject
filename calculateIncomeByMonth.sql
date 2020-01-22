USE [Workshoper]
GO

/****** Object:  StoredProcedure [dbo].[CalculateIncomeByMonth]    Script Date: 1/22/2020 9:15:30 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[CalculateIncomeByMonth]
	@WorkshopId int
AS
BEGIN
	SELECT CAST(YEAR(v.VisitDate) as varchar(4)) + ' - ' + CAST(MONTH(v.VisitDate) as varchar(4)),  SUM(v.Price)
	FROM visit v
	WHERE v.WorkshopId = @WorkshopId
	GROUP BY CAST(YEAR(v.VisitDate) as varchar(4)) + ' - ' + CAST(MONTH(v.VisitDate) as varchar(4))
END
GO


