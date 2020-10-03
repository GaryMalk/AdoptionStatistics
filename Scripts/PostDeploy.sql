/*
PostDeploy.sql
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.
 Insert State names into the dbo.[State] table
 BULK INSERT #the contents of the CSV files into the respective tables.
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

-- Create Temp tables

CREATE TABLE #adoptsubs(
	StateId int,
	Year int,
	Yes float,
	No float,
	Total int,
	Missing int
)	

CREATE TABLE #familystruct(
	StateId int,
	Year int,
	Married float,
	UnMarried float,
	SingleFemale float,
	SingleMale float,
	Total int,
	Missing int
)

CREATE TABLE #age(
	StateId int,
	Year int,
	Age_LT_1_YR float,
	Age_1_YR float,
	Age_2_YR float,
	Age_3_YR float,
	Age_4_YR float,
	Age_5_YR float,
	Age_6_YR float,
	Age_7_YR float,
	Age_8_YR float,
	Age_0_TO_8_YR float,
	Age_9_YR float,
	Age_10_YR float,
	Age_11_YR float,
	Age_12_YR float,
	Age_13_YR float,
	Age_14_YR float,
	Age_15_YR float,
	Age_16_YR float,
	Age_17_YR float,
	Age_18_YR float,
	Age_19_YR float,
	Age_20_YR float,
	Total int,
	Missing int,
	Mean float,
	Meridian float
)

CREATE TABLE #gender(
	StateId int,
	Year int,
	Male float,
	Female float,
	Total int,
	Missing int
)

CREATE TABLE #priorelation(
	StateId int,
	Year int,
	NonRelative float,
	FosterParent float,
	StepParent float,
	OtherRelative float,
	Total int,
	Missing int
)

CREATE TABLE #race(
	StateId int,
	Year int,
	NativeAmerican float,
	Asian float,
	Black float,
	PacificIslander float,
	Hispanic float,
	White float,
	Unknown float,
	Multiracial float,
	Total int,
	Missing int
)

CREATE TABLE #specneeds(
	StateId int,
	Year int,
	Yes float,
	No float,
	Total int,
	Missing int
)

CREATE TABLE #tpr(
	StateId int,
	Year int,
	Tpr_LT_1Mo float,
	Tpr_1_to_5Mo float,
	Tpr_6_to_11Mo float,
	Tpr_12_to_17Mo float,
	Tpr_18_to_23Mo float,
	Tpr_24_to_29Mo float,
	Tpr_30_to_35Mo float,
	Tpr_3_to_4YR float,
	Tpr_MT_5YR float,
	Total int,
	Missing int,
	Mean float,
	Meridian int
)

GO

-- BULK INSERT #from CSV files into their temp tables

BULK INSERT #adoptsubs
FROM '$(CsvPath)\adoption_subsidy2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #familystruct
FROM '$(CsvPath)\family_structure.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #age
FROM '$(CsvPath)\final_age.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #gender
FROM '$(CsvPath)\gender2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #priorelation
FROM '$(CsvPath)\prior_relation.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #race
FROM '$(CsvPath)\race.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #specneeds
FROM '$(CsvPath)\special_needs2012_2016.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

BULK INSERT #tpr
FROM '$(CsvPath)\tpr.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
)

GO

-- Merge temp tables into actual tables

MERGE AdoptionSubsidy dest
USING #adoptsubs src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.Yes,
	src.No,
	src.Total,
	src.Missing);

MERGE FamilyStructure dest
USING #familystruct src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.Married,
	src.UnMarried,
	src.SingleFemale,
	src.SingleMale,
	src.Total,
	src.Missing);

MERGE FinalAge dest
USING #age src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (	src.StateId,
	src.Year,
	src.Age_LT_1_YR,
	src.Age_1_YR,
	src.Age_2_YR,
	src.Age_3_YR,
	src.Age_4_YR,
	src.Age_5_YR,
	src.Age_6_YR,
	src.Age_7_YR,
	src.Age_8_YR,
	src.Age_0_TO_8_YR,
	src.Age_9_YR,
	src.Age_10_YR,
	src.Age_11_YR,
	src.Age_12_YR,
	src.Age_13_YR,
	src.Age_14_YR,
	src.Age_15_YR,
	src.Age_16_YR,
	src.Age_17_YR,
	src.Age_18_YR,
	src.Age_19_YR,
	src.Age_20_YR,
	src.Total,
	src.Missing,
	src.Mean,
	src.Meridian);

MERGE Gender dest
USING #gender src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.Male,
	src.Female,
	src.Total,
	src.Missing);

MERGE PriorRelationship dest
USING #priorelation src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.NonRelative,
	src.FosterParent,
	src.StepParent,
	src.OtherRelative,
	src.Total,
	src.Missing);

MERGE Race dest
USING #race src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.NativeAmerican,
	src.Asian,
	src.Black,
	src.PacificIslander,
	src.Hispanic,
	src.White,
	src.Unknown,
	src.Multiracial,
	src.Total,
	src.Missing);

MERGE SpecialNeeds dest
USING #specneeds src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.Yes,
	src.No,
	src.Total,
	src.Missing);

MERGE TPR_Adopt dest
USING #tpr src
ON (src.StateId = dest.StateId AND src.Year = dest.Year)
WHEN NOT MATCHED THEN
INSERT VALUES (src.StateId,
	src.Year,
	src.Tpr_LT_1Mo,
	src.Tpr_1_to_5Mo,
	src.Tpr_6_to_11Mo,
	src.Tpr_12_to_17Mo,
	src.Tpr_18_to_23Mo,
	src.Tpr_24_to_29Mo,
	src.Tpr_30_to_35Mo,
	src.Tpr_3_to_4YR,
	src.Tpr_MT_5YR,
	src.Total,
	src.Missing,
	src.Mean,
	src.Meridian);

GO

-- Delete temp tables
DROP TABLE #adoptsubs
DROP TABLE #familystruct
DROP TABLE #age
DROP TABLE #gender
DROP TABLE #priorelation
DROP TABLE #race
DROP TABLE #specneeds
DROP TABLE #tpr

GO