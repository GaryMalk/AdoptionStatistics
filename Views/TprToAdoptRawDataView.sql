CREATE VIEW [dbo].[TprToAdoptRawDataView] AS
SELECT StateId
      ,[Year]
,ROUND([Tpr_LT_1Mo] * [Total] /100, 0) AS [< 1 mo]
,ROUND([Tpr_1_to_5Mo] * [Total] /100, 0) AS [1 to 5 mo]
,ROUND([Tpr_6_to_11Mo] * [Total] /100, 0) AS [6 to 11 mo]
,ROUND([Tpr_12_to_17Mo] * [Total] /100, 0) AS [12 to 17 mo]
,ROUND([Tpr_18_to_23Mo] * [Total] /100, 0) AS [18 to 23 mo]
,ROUND([Tpr_24_to_29Mo] * [Total] /100, 0) AS [24 to 29 mo]
,ROUND([Tpr_30_to_35Mo] * [Total] /100, 0) AS [30 to 35 mo]
,ROUND([Tpr_3_to_4YR] * [Total] /100, 0) AS [3 to 4 yr]
,ROUND([Tpr_MT_5YR] * [Total] /100, 0) AS [>= 5 yr]
FROM [dbo].[TPR_Adopt]
GO