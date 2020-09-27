CREATE VIEW [dbo].[ObservationsByStateYear] AS
SELECT ads.StateId
, ads.[Year]
, ads.Yes / 100 AS Subsidy
, Married / 100 AS Married
, AverageAge
, Male / 100 AS Male
, Black / 100 AS Black
, Hispanic / 100 AS Hispanic
, NativeAmerican / 100 AS NativeAmerican
, White / 100 AS White
, NonRelative / 100 AS NonRelative
, AverageMonths

FROM AdoptionSubsidy ads
JOIN FamilyStructure fs ON fs.StateId = ads.StateId AND fs.[Year] = ads.[Year]
JOIN AverageAgeByStateYear aa ON fs.StateId = aa.StateId AND fs.[Year] = aa.[Year]
JOIN Gender g ON g.StateId = aa.StateId AND g.[Year] = aa.[Year]
JOIN Race r ON r.StateId = g.StateId AND r.[Year] = g.[Year]
JOIN PriorRelationship pr ON r.StateId = pr.StateId AND r.[Year] = pr.[Year]
JOIN AverageTprMoByStateYear tpr ON tpr.StateId = pr.StateId AND tpr.[Year] = pr.[Year]
GO