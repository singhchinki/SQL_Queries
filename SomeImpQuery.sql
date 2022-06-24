CREATE DATABASE SomeQueries;
USE SomeQueries;

--Creating tables with name Student and Subject--Create Query
CREATE TABLE Student(
ID int identity primary key,
Name varchar(30) not null,
Contact varchar(30) not null,
Department varchar(30) not null,
Year varchar(10) not null);
SELECT * FROM Student;

CREATE TABLE Subject(
ID int not null,
Subject_Name varchar(30) not null,
Semester varchar(30) not null
);
SELECT * FROM Subject;

--Insert Records into table
INSERT INTO Student(Name,Contact,Department,Year) VALUES
('Shristi','9090993768','Civil','2020'),
('Savita','9090886754','Computer','2021'),
('Supriya','9865486234','Electrical','2018'),
('Rohit','9097421588','Electrical','2020');
SELECT * FROM Student;
INSERT INTO Student(Name,Contact,Department,Year) VALUES
('Ashutosh','9079543658','Civil','2017');

INSERT INTO Subject(ID,Subject_Name,Semester) VALUES
('1','Advance Java','Fourth'),
('2','Construction Tech','Second'),
('1','Data Structure','Third'),
('4','Basic Electrical','Second'),
('3','CPP','Second');
SELECT * FROM Subject;
INSERT INTO Subject(ID,Subject_Name,Semester) VALUES
('5','Building Material','Third'),
('2','Advance Electrical','Fifth');

--Inner Join
SELECT ST.Name, SB.Subject_Name
FROM Student ST JOIN Subject SB
ON ST.ID = SB.ID;

--Left Join
SELECT ST.Name, SB.Subject_Name
FROM Student ST LEFT JOIN Subject SB
ON ST.ID = SB.ID;

--Right Join
SELECT ST.Name, SB.Subject_Name
FROM Student ST RIGHT JOIN Subject SB
ON ST.ID = SB.ID;

--Full Join
SELECT ST.Name, SB.Subject_Name
FROM Student ST FULL JOIN Subject SB
ON ST.ID = SB.ID;

--Cross Join
SELECT ST.Name, SB.Subject_Name
FROM Student ST CROSS JOIN Subject SB;

-- Creating One to One Relation
ALTER TABLE Subject ADD CONSTRAINT FK_Student FOREIGN KEY(ID) REFERENCES Student(ID) ON DELETE CASCADE;
DELETE FROM Student WHERE Name='Savita';

--Subquery
SELECT * FROM Student
WHERE Year=(SELECT MAX(Year) FROM Student);

--Stored Procedure
GO
CREATE PROCEDURE InsertStudent
@Name varchar(30),
@Contact varchar(30),
@Department varchar(30),
@Year varchar(10)
AS
BEGIN
INSERT INTO Student(
Name,Contact,Department,Year)
VALUES
(@Name,@Contact,@Department,@Year)
END

USE [SomeQueries]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[InsertStudent]
		@Name = N'chinki',
		@Contact = N'756752725',
		@Department = N'cs',
		@Year = N'2016'

SELECT	'Return Value' = @return_value


GO
SELECT * FROM Student;
-------------exception handling----------
GO
CREATE PROCEDURE dbo.spStudentDetails_select
AS
BEGIN
BEGIN TRY
	SELECT * FROM Student;
END TRY
BEGIN CATCH
SELECT  
            ERROR_NUMBER() AS ErrorNumber  
            ,ERROR_SEVERITY() AS ErrorSeverity  
            ,ERROR_STATE() AS ErrorState  
            ,ERROR_PROCEDURE() AS ErrorProcedure  
            ,ERROR_LINE() AS ErrorLine  
            ,ERROR_MESSAGE() AS ErrorMessage;  
    END CATCH
END;
USE [SomeQueries]
GO

DECLARE	@return_value int

EXEC	@return_value = [dbo].[spStudentDetails_select]

SELECT	'Return Value' = @return_value

GO






