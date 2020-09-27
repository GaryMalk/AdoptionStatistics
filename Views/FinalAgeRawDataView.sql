CREATE VIEW [dbo].[FinalAgeRawDataView] AS
SELECT StateId
      ,[Year]
      ,ROUND([Age_LT_1_YR] * [Total] /100, 0) AS [< 1 yr]
,ROUND([Age_1_YR] * [Total] /100, 0) AS [1 yr]
,ROUND([Age_2_YR] * [Total] /100, 0) AS [2 yr]
,ROUND([Age_3_YR] * [Total] /100, 0) AS [3 yr]
,ROUND([Age_4_YR] * [Total] /100, 0) AS [4 yr]
,ROUND([Age_5_YR] * [Total] /100, 0) AS [5 yr]
,ROUND([Age_6_YR] * [Total] /100, 0) AS [6 yr]
,ROUND([Age_7_YR] * [Total] /100, 0) AS [7 yr]
,ROUND([Age_8_YR] * [Total] /100, 0) AS [8 yr]
,ROUND([Age_9_YR] * [Total] /100, 0) AS [9 yr]
,ROUND([Age_10_YR] * [Total] /100, 0) AS [10 yr]
,ROUND([Age_11_YR] * [Total] /100, 0) AS [11 yr]
,ROUND([Age_12_YR] * [Total] /100, 0) AS [12 yr]
,ROUND([Age_13_YR] * [Total] /100, 0) AS [13 yr]
,ROUND([Age_14_YR] * [Total] /100, 0) AS [14 yr]
,ROUND([Age_15_YR] * [Total] /100, 0) AS [15 yr]
,ROUND([Age_16_YR] * [Total] /100, 0) AS [16 yr]
,ROUND([Age_17_YR] * [Total] /100, 0) AS [17 yr]
,ROUND([Age_18_YR] * [Total] /100, 0) AS [18 yr]
,ROUND([Age_19_YR] * [Total] /100, 0) AS [19 yr]
,ROUND([Age_20_YR] * [Total] /100, 0) AS [20 yr]
FROM [dbo].[FinalAge]
GO