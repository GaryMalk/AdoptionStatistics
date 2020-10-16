CREATE VIEW [dbo].[PriorRelationshipCountView] AS
SELECT StateId
      ,[Year]
      ,ROUND([NonRelative] * [Total] /100, 0) AS [NonRelative]
      ,ROUND([FosterParent] * [Total] /100, 0) AS [Foster Parent]
      ,ROUND([StepParent] * [Total] /100, 0) AS [Step Parent]
      ,ROUND([OtherRelative] * [Total] /100, 0) AS [Other Relative]
FROM [dbo].[PriorRelationship]
GO