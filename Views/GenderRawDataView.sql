CREATE VIEW [dbo].[GenderRawDataView] AS
SELECT StateId
      ,[Year]
      ,ROUND([Male] * [Total] /100, 0) AS [Male]
	  ,ROUND([Female] * [Total] /100, 0) AS [Female]
FROM [dbo].[Gender]
GO