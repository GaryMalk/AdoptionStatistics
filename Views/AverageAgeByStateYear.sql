CREATE VIEW [dbo].[AverageAgeByStateYear] AS
SELECT [StateId]
      ,[Year]
      , ROUND(([Age_LT_1_YR] * .5
      + [Age_1_YR]
      + [Age_2_YR] * 2
      + [Age_3_YR] * 3
      + [Age_4_YR] * 4
      + [Age_5_YR] * 5
      + [Age_6_YR] * 6
      + [Age_7_YR] * 7
      + [Age_8_YR] * 8
      + [Age_9_YR] * 9
      + [Age_10_YR] * 10
      + [Age_11_YR] * 11
      + [Age_12_YR] * 12
      + [Age_13_YR] * 13
      + [Age_14_YR] * 14
      + [Age_15_YR] * 15
      + [Age_16_YR] * 16
      + [Age_17_YR] * 17
      + [Age_18_YR] * 18
      + [Age_19_YR] * 19
      + [Age_20_YR] * 20)/100, 2) AS AverageAge
FROM [dbo].[FinalAge]
GO