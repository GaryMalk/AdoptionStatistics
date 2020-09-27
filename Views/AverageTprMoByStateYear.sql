CREATE VIEW [dbo].[AverageTprMoByStateYear] AS
select StateId
, [Year]
, ROUND(([Tpr_LT_1Mo] * 0.5
 + [Tpr_1_to_5Mo] * 3
 + [Tpr_6_to_11Mo] * 8.5
 + [Tpr_12_to_17Mo] * 14.5
 + [Tpr_18_to_23Mo] * 20.5
 + [Tpr_24_to_29Mo] * 26.5
 + [Tpr_30_to_35Mo] * 32.5
 + [Tpr_3_to_4YR] * 42
 + [Tpr_MT_5YR] * 60) / 100,2) AS AverageMonths
From [TPR_Adopt]
GO