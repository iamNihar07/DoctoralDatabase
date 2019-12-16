DROP DATABASE IF EXISTS DOCTORAL;
CREATE DATABASE DOCTORAL;
USE DOCTORAL;

DROP TABLE IF EXISTS PHDCOMMITTEE;
DROP TABLE IF EXISTS GRANTSASSOCIATED;
DROP TABLE IF EXISTS GRANTS;
DROP TABLE IF EXISTS MILESTONESPASSED;
DROP TABLE IF EXISTS MILESTONE;
DROP TABLE IF EXISTS COURSESTAUGHT;
DROP TABLE IF EXISTS SECTION;
DROP TABLE IF EXISTS COURSE;
DROP TABLE IF EXISTS SCHOLARSHIPSUPPORT;
DROP TABLE IF EXISTS SELFSUPPORT;
DROP TABLE IF EXISTS GRA;
DROP TABLE IF EXISTS GTA;
DROP TABLE IF EXISTS PHDSTUDENT;
DROP TABLE IF EXISTS TT;
DROP TABLE IF EXISTS INSTRUCTOR;


create table INSTRUCTOR (InstructorId char(6) NOT NULL, FName VARCHAR(20) NOT NULL, LName VARCHAR (20) NOT NULL, StartDate DATE NOT NULL, DEGREE VARCHAR(10), Rank VARCHAR(30) NOT NULL, Type VARCHAR(10) NOT NULL, CONSTRAINT Instructor_InstructorId_PK PRIMARY KEY(InstructorId));
create table TT(InstructorId char(6) NOT NULL REFERENCES INSTRUCTOR(InstructorId), NoOfPhDStudents int NOT NULL, CONSTRAINT TT_InstructorId_PK PRIMARY KEY (InstructorId) );
create table PHDSTUDENT(StudentId char(6) NOT NULL, FName varchar(20) NOT NULL, LName varchar(20) NOT NULL, StSem VARCHAR(7) NOT NULL, StYear int NOT NULL, Supervisor char(6) NOT NULL, CONSTRAINT PhDStudent_StudentId_PK PRIMARY KEY(StudentId), CONSTRAINT PhDStudent_supervisor_FK FOREIGN KEY (Supervisor) REFERENCES Instructor(InstructorId));
create table COURSE(CourseID char(7) NOT NULL, CName varchar(50) NOT NULL, CONSTRAINT Course_CourseID_PK PRIMARY KEY(CourseID));
create table SECTION(SectionId char(11) NOT NULL, CourseId char(7) NOT NULL, CONSTRAINT Section_SectionId_PK PRIMARY KEY(SectionId), CONSTRAINT Section_CourseId_FK FOREIGN KEY (CourseId) REFERENCES COURSE(CourseID));
create table GRANTS(AccountNo char(4) NOT NULL, Type varchar(15) NOT NULL, GrantTitle varchar(30) NOT NULL, Source varchar(50) NOT NULL, StDate DATE NOT NULL, EndDate DATE NOT NULL, StAmount int NOT NULL, CurrBalance int NOT NULL, CONSTRAINT Grants_AccountNo_PK PRIMARY KEY (AccountNo));
create table GTA(SectionId char(11) NOT NULL, MonthlyPay int NOT NULL, StudentId char(6) NOT NULL REFERENCES PHDSTUDENT(StudentId), CONSTRAINT GTA_StudentId_PK PRIMARY KEY(StudentId), CONSTRAINT GTA_SectionId_FK FOREIGN KEY(SectionId) REFERENCES SECTION(SectionId));
create table GRA(StudentId char(6) NOT NULL REFERENCES PHDSTUDENT(StudentId), Funding char(4) NOT NULL, MonthlyPay int NOT NULL, CONSTRAINT GRA_StudentId_PK PRIMARY KEY(StudentId), CONSTRAINT GRA_Funding_FK FOREIGN KEY(Funding) REFERENCES GRANTS(AccountNo));
create table SELFSUPPORT(StudentId char(6) NOT NULL REFERENCES PHDSTUDENT(StudentId), CONSTRAINT SelfSupport_StudentId_PK PRIMARY KEY(StudentId));
create table SCHOLARSHIPSUPPORT(StudentId char(6) NOT NULL REFERENCES PHDSTUDENT(StudentId), Type varchar(15) NOT NULL, Source varchar(15) NOT NULL, CONSTRAINT ScholarshipSupport_StudentId_PK PRIMARY KEY(StudentId));
create table COURSESTAUGHT(CourseId char(7) NOT NULL, InstructorId char(6) NOT NULL, CONSTRAINT CoursesTaught_PK PRIMARY KEY(CourseId, InstructorId), CONSTRAINT CoursesTaught_CourseId_FK FOREIGN KEY(CourseId) REFERENCES Course(CourseId), CONSTRAINT CoursesTaught_InstructorId_FK FOREIGN KEY(InstructorId) REFERENCES Instructor(InstructorId));
create table MILESTONE(MId char(2) NOT NULL, MName varchar(20) NOT NULL, CONSTRAINT Milestone_MId_PK PRIMARY KEY(MId));
create table MILESTONESPASSED(StudentId char(6) NOT NULL, MId char(2) NOT NULL, PassDate DATE NOT NULL, CONSTRAINT MilestonesPassed_PK PRIMARY KEY(StudentId, MId), CONSTRAINT MilestonesPassed_StudentId_FK FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId), CONSTRAINT MilestonesPassed_MId_FK FOREIGN KEY(MId) REFERENCES MILESTONE(MId));
create table GRANTSASSOCIATED(AccountNo char(4) NOT NULL, InstructorId char(6) NOT NULL, PIType varchar(4) NOT NULL, CONSTRAINT GrantsAssociated_PK PRIMARY KEY(AccountNo, InstructorId), CONSTRAINT GrantsAssocaited_AccountNo_FK FOREIGN KEY(AccountNo) REFERENCES GRANTS(AccountNo), CONSTRAINT GrantsAssocaited_InstructorId_FK FOREIGN KEY (InstructorId) REFERENCES Instructor(InstructorId));
create table PHDCOMMITTEE(StudentId char(6) NOT NULL, InstructorId char(6) NOT NULL, CONSTRAINT PhDCommittee_PK PRIMARY KEY(StudentId, InstructorId), CONSTRAINT PhDCommittee_StudentId_FK FOREIGN KEY(StudentId) REFERENCES PHDSTUDENT(StudentId), CONSTRAINT PhDCommittee_InstructorId_FK FOREIGN KEY(InstructorId) REFERENCES Instructor(InstructorId));



LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_Instructor.txt' INTO TABLE INSTRUCTOR FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_TT.txt' INTO TABLE TT FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_PhDStudent.txt' INTO TABLE PHDSTUDENT FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_GTA.txt' INTO TABLE GTA FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_GRA.txt' INTO TABLE GRA FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_SelfSupport.txt' INTO TABLE SELFSUPPORT FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_ScholarshipSupport.txt' INTO TABLE SCHOLARSHIPSUPPORT FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_Course.txt' INTO TABLE COURSE FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_Section.txt' INTO TABLE SECTION FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_CoursesTaught.txt' INTO TABLE COURSESTAUGHT FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_Milestone.txt' INTO TABLE MILESTONE FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_MilestonesPassed.txt' INTO TABLE MILESTONESPASSED FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_Grants.txt' INTO TABLE GRANTS FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_GrantAssociated.txt' INTO TABLE GRANTSASSOCIATED FIELDS TERMINATED BY ',';
LOAD DATA LOCAL INFILE 'C:/xampp/mysql/data/doctoral_data/_PhDCommittee.txt' INTO TABLE PHDCOMMITTEE FIELDS TERMINATED BY ','; 

SELECT * FROM INSTRUCTOR;
SELECT * FROM TT;
SELECT * FROM PHDSTUDENT;
SELECT * FROM GTA;
SELECT * FROM GRA;
SELECT * FROM SELFSUPPORT;
SELECT * FROM SCHOLARSHIPSUPPORT;
SELECT * FROM COURSE;
SELECT * FROM SECTION;
SELECT * FROM COURSESTAUGHT;
SELECT * FROM MILESTONE;
SELECT * FROM MILESTONESPASSED;
SELECT * FROM GRANTS;
SELECT * FROM GRANTSASSOCIATED;
SELECT * FROM PHDCOMMITTEE;

DROP VIEW SUPERVISION_INFO;
CREATE VIEW SUPERVISION_INFO(IId, IFName, ILName, SId, SFName, SLName, SStSem, SStYear) AS SELECT I.InstructorId, I.Fname, I.LName, S.StudentId, S.FName, S.LName, S.StSem, S.StYear FROM INSTRUCTOR AS I, PHDSTUDENT AS S WHERE S.SUPERVISOR = I.InstructorId;
SELECT DISTINCT IId, IFName, ILName, COUNT(*) AS 'NoOfStudentsSupervised' FROM SUPERVISION_INFO GROUP BY IId;
SELECT SFName, SLName FROM SUPERVISION_INFO WHERE IFName='Ahmed' AND ILName='Sarhan'; 
SELECT IFName, ILName, SFName, SLName FROM SUPERVISION_INFO WHERE (SFName, SLName) IN (('Ife', 'Jelani'),('Maya', 'Smith'), ('Raymond', 'Wilson'));

SELECT P.StudentId, P.FName, P.LName, M.MName, MP.PassDate FROM PHDSTUDENT AS P, MILESTONE AS M, MILESTONESPASSED AS MP WHERE P.StudentId = MP.StudentId AND M.MId=MP.MId;
SELECT P.StudentId, P.FName, P.LName, G.GrantTitle FROM PHDSTUDENT AS P, GRA, GRANTS AS G WHERE P.StudentId=GRA.StudentId AND GRA.Funding=G.AccountNo;
SELECT P.StudentId, P.FName, P.LName, C.CName FROM PHDSTUDENT AS P, GTA, COURSE AS C, SECTION AS S WHERE P.StudentId = GTA.StudentId AND GTA.SectionID = S.SectionId AND S.CourseId = C.CourseID;

DELETE FROM PHDSTUDENT WHERE FName='Xiu'; /*Violates Referential Integrity Constraint*/

INSERT INTO PHDSTUDENT VALUES(NULL,'John','Doe','Fall',2019,'AO5671'); /*Violates Entity Integrity Constraint as NULL is inserted as primary key*/
INSERT INTO SECTION VALUES('CSE3315-001','CSE3315'); /*Violates Referential Integrity Constraint as a FK references a PK that does not exist*/
INSERT INTO GRA VALUES('AB1234','ABC1',-1500); /*Violates Semantic Integrity Constraint as salary can not be negative*/

SELECT I.FName, I.LName, T.NoOfPhDStudents, I.StartDate FROM INSTRUCTOR AS I, TT AS T WHERE I.StartDate > '1989-12-25' AND I.InstructorId = T.InstructorId;
SELECT P.FName, P.LName, P.StYear, M.MName FROM PHDSTUDENT AS P, MILESTONESPASSED AS MP, MILESTONE AS M WHERE P.StYear >= '2017' AND M.MId = MP.MId AND P.StudentId = MP.StudentId AND MP.PassDate > '2018-05-01';
SELECT FName, LName, StartDate, Degree FROM INSTRUCTOR WHERE StartDate > '1999-05-01' AND StartDate < '2004-05-01';
SELECT I.FName FROM INSTRUCTOR AS I, TT AS T WHERE I.InstructorId=T.InstructorId AND T.NoOfPhDStudents > 5;
SELECT SUM(MonthlyPay) AS Total, AVG(MonthlyPay) as Avergae, MIN(MonthlyPay) as Minimum, MAX(MonthlyPay) as Maximum FROM GTA;
SELECT C.CName, COUNT(*) as 'NumberOfSections' FROM COURSE C, SECTION S WHERE C.CourseID=S.CourseId GROUP BY S.CourseId ORDER BY 'NoOfSections' ASC;
SELECT FName, LName FROM PHDSTUDENT WHERE FName LIKE 'a%';
SELECT P.FName, GTA.SectionId FROM PHDSTUDENT AS P LEFT OUTER JOIN GTA ON P.StudentId=GTA.StudentId ORDER BY P.FName ASC;
SELECT P.FName, G.SectionId FROM PHDSTUDENT P, GTA AS G WHERE P.StudentId=G.StudentId ORDER BY FName ASC;
