/*
PostDeploy.sql
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.
 Insert State names into the dbo.[State] table
 Bulk insert the contents of the CSV files into the respective tables.
--------------------------------------------------------------------------------------
*/

-- Insert State Names

CREATE TABLE #states
(
  [Name] VARCHAR(20) NOT NULL
)
 
INSERT INTO #states (Name) VALUES ('Alabama'),
('Alaska'),
('Arizona'),
('Arkansas'),
('California'),
('Colorado'),
('Connecticut'),
('Delaware'),
('District of Columbia'),
('Florida'),
('Georgia'),
('Hawaii'),
('Idaho'),
('Illinois'),
('Indiana'),
('Iowa'),
('Kansas'),
('Kentucky'),
('Louisiana'),
('Maine'),
('Maryland'),
('Massachusetts'),
('Michigan'),
('Minnesota'),
('Mississippi'),
('Missouri'),
('Montana'),
('Nebraska'),
('Nevada'),
('New Hampshire'),
('New Jersey'),
('New Mexico'),
('New York'),
('North Carolina'),
('North Dakota'),
('Ohio'),
('Oklahoma'),
('Oregon'),
('Pennsylvania'),
('Rhode Island'),
('South Carolina'),
('South Dakota'),
('Tennessee'),
('Texas'),
('Utah'),
('Vermont'),
('Virginia'),
('Washington'),
('West Virginia'),
('Wisconsin'),
('Wyoming'),
('Puerto Rico')

MERGE State
USING #states
ON (#states.[Name] = [State].[Name])
WHEN NOT MATCHED THEN
INSERT VALUES (#states.[Name]);

DROP TABLE #states

GO

-- BULK INSERT from CSV files into their respective tables

BULK INSERT AdoptionSubsidy
FROM '$(CurrentPath)\adoption_subsidy2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT FamilyStructure
FROM '$(CurrentPath)\family_structure.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT FinalAge
FROM '$(CurrentPath)\final_age.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT Gender
FROM '$(CurrentPath)\gender2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT PriorRelationship
FROM '$(CurrentPath)\prior_relation.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT Race
FROM '$(CurrentPath)\race.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT SpecialNeeds
FROM '$(CurrentPath)\special_needs2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT TPR_Adopt
FROM '$(CurrentPath)\tpr.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

GO