CREATE VIEW [dbo].[RaceRawDataView] AS
SELECT StateId
      ,[Year]
      ,ROUND([NativeAmerican] * [Total] /100, 0) AS [Native American]
	  ,ROUND([Asian] * [Total] /100, 0) AS [Asian]
	  ,ROUND([Black] * [Total] /100, 0) AS [Black or African-American]
	  ,ROUND([PacificIslander] * [Total] /100,0) AS [Native Hawaiian or Pacific Islander]
	  ,ROUND([Hispanic] * [Total] /100, 0) AS [Hispanic]
	  ,ROUND([White] * [Total] /100, 0) AS [White]
	  ,ROUND([Unknown] * [Total] /100, 0) AS [Unknown]
	  ,ROUND([Multiracial] * [Total] /100, 0) AS [Multiracial]
FROM [dbo].[Race]
GO