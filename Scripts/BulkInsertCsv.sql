/*
BulkInsertCsv.sql
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.

 Bulk insert the contents of the CSV files into the respective tables.
--------------------------------------------------------------------------------------
*/

BULK INSERT AdoptionSubsidy
FROM '.\adoption_subsidy2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT FamilyStructure
FROM '.\family_structure.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT FinalAge
FROM '.\final_age.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT Gender
FROM '.\gender.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT PriorRelationship
FROM '.\prior_relation.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT Race
FROM '.\race.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT SpecialNeeds
FROM '.\special_needs2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT TPR_Adopt
FROM '.\tpr.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)
