CREATE VIEW [dbo].[FamilyStructureCountView] AS
SELECT StateId
      ,[Year]
      ,ROUND([Married] * [Total] /100, 0) AS [Married]
	  ,ROUND([UnMarried] * [Total] /100, 0) AS [UnMarried]
	  ,ROUND([SingleFemale] * [Total] /100, 0) AS [Single Female]
	  ,ROUND([SingleMale] * [Total] /100,0) AS [Single Male]
FROM [dbo].[FamilyStructure]
GO