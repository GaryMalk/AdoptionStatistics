CREATE VIEW [dbo].[SpecialNeedsCountView] AS
SELECT StateId
      ,[Year]
      ,ROUND([Yes] * [Total] /100, 0) AS [Yes]
	  ,ROUND([No] * [Total] /100, 0) AS [No]
FROM [dbo].[SpecialNeeds]
GO