USE project;
DROP TABLE IF EXISTS ENROLLMENT;
CREATE TABLE ENROLLMENT (
  StudentID integer NOT NULL, 
  CourseID integer NOT NULL,
  PRIMARY KEY(StudentId, CourseId)
);

DROP TABLE IF EXISTS STUDENT;
CREATE TABLE STUDENT (
  StudentID integer NOT NULL,
  F_NAME text,
  L_NAME text,
  PRIMARY KEY(StudentID)
);

DROP TABLE IF EXISTS COURSE;
CREATE TABLE COURSE(
    CourseID integer NOT NULL unique,
    CourseNum integer NOT NULL,
    CourseName text NOT NULL, 
    Department text NOT NULL,
    Semester text NOT NULL, 
    Year int(5) NOT NULL,
    PRIMARY KEY(CourseID)
);

DROP TABLE IF EXISTS COMPUTATION;
CREATE TABLE COMPUTATION(
    ComputationID integer NOT NULL,
    CourseID integer,
    Type text,
    Percentage int
    );

DROP TABLE IF EXISTS ASSIGNMENT;
CREATE TABLE ASSIGNMENT(
    AssignmentID integer,
    ComputationID integer,
    TotalPoints integer,
    Instance integer,
    PRIMARY KEY(AssignmentID)
);

DROP TABLE IF EXISTS GRADE;
CREATE TABLE GRADE(
    StudentID integer,
    AssignmentID integer,
    AwardedPoints integer,
    PRIMARY KEY(StudentID, AssignmentID)
);

-- 2.2 Write the commands for inserting values;

INSERT INTO STUDENT (StudentID,F_NAME,L_NAME)
values
(12345, 'Hank', 'Quoy'),
(67890, 'Leslie', 'Shay'),
(24680, 'Kelly', 'Severide');

INSERT INTO COURSE (CourseID,CourseNum,CourseName,Department,Semester,Year)
values
(9876, 100, 'Pre-Calculus', 'Math', 'Spring', '2023'),
(8765, 202, 'Spanish II', 'Contemporary Lit', 'Spring', '2023'),
(7654, 203, 'Calculus', 'Math', 'Spring', '2023'),
(6543, 303, 'Computer Science III', 'Computer Science', 'Spring', '2023');

INSERT INTO ENROLLMENT (StudentID,CourseID)
values
(12345, 8765),
(12345, 7654),
(67890, 8765),
(67890, 6543),
(67890, 9876),
(24680, 6543),
(24680, 9876);

INSERT INTO COMPUTATION (ComputationID,CourseID,Type,Percentage)
values
(1, 9876, 'Midterm', 25),
(2, 9876, 'Final', 25),
(3, 9876, 'Quiz', 15),
(4, 9876, 'Homework', 15),
(5, 9876, 'Lab', 30),
(6, 8765, 'Oral', 20),
(7, 8765, 'Written', 20),
(8, 8765, 'Midterm', 15),
(9, 8765, 'Final', 30 ),
(10,8765, 'Project', 15 ),
(11,7654, 'Tests', 30),
(12,7654, 'Midterm', 20),
(13,7654, 'Final', 20 ),
(14,7654, 'Homework', 15),
(15,7654, 'Participation', 15 ),
(16,6543, 'Lab', 40),
(17,6543, 'Midterm', 20),
(18,6543, 'Final', 20),
(19,6543, 'Homework', 20);


INSERT INTO ASSIGNMENT (AssignmentID,ComputationID,TotalPoints,Instance)
values 
-- Assignments for Pre-Calculus(9876)
(1,1,100,1),
(2,2,100,1),
(3,3,100,1),
(4,3,100,2),
(5,4,100,1),
(6,4,100,2),
(7,5,100,1),
(8,5,100,2),
-- Assignments for Spanish II (8765)
(9,6,100,1),
(10,6,100,2),
(11,7,100,1),
(13,7,100,2),
(14,8,100,1),
(15,9,100,1),
(16,10,100,1),
(17,10,100,1),
-- Assignments for Calculus(7654)
(18,11,100,1),
(19,12,100,1),
(20,13,100,1),
(21,14,100,1),
(22,15,100,1),
-- Assignments for Computer Science III(6543)
(23,16,100,1),
(24,16,100,2),
(25,17,100,1),
(26,18,100,1),
(27,18,100,2),
(28,19,100,1);




-- Grades for Pre-Calculus
INSERT INTO GRADE (StudentID,AssignmentID,AwardedPoints)
values 
-- Students: 67890(Leslie) and 24680(Kelly)
(67890,1,75),
(24680,1,85),
(67890,2,100),
(24680,2,95),
(67890,3,100),
(24680,3,100),
(67890,4,0),
(24680,4,95),
(67890,5,0),
(24680,5,70),
(67890,6,50),
(24680,6,75),
(67890,7,100),
(24680,7,84),
(67890,8,0),
(24680,8,95),
-- Grades for Spanish II
-- Students: 12345(Hank) and 67890(Leslie)
(12345,9,20),
(67890,9,100),
(12345,10,50),
(67890,10,95),
(12345,11,75),
(67890,11,45),
(12345,12,96),
(67890,12,76),
(12345,13,80),
(67890,13,36),
(12345,14,45),
(67890,14,95),
(12345,15,56),
(67890,15,55),
(12345,16,75),
(67890,16,30),
(12345,17,96),
(67890,17,100),
-- Grades for Calculus
-- Students: 12345(Hank)
(12345,18,100),
(12345,19,100),
(12345,20,95),
(12345,21,0),
(12345,22,60),
-- Grades for Computer Science III
-- Students: 67890(Leslie) and Kelly(24680)
(67890,23,100),
(24680,23,85),
(67890,24,75),
(24680,24,100),
(67890,25,95),
(24680,25,100),
(67890,26,85),
(24680,26,95),
(67890,27,91),
(24680,27,92),
(67890,28,100),
(24680,28,85);


-- 3. Show the tables with the contents that you have inserted;
-- Listing all Students and Courses respectively
Select * from STUDENT;
Select * from COURSE;

-- Listing Enrollment of all Students 
Select * from Enrollment;

-- List Grade Computation by COURSE
-- Pre-Calculus --
Select * from Computation
Where CourseID = 9876;
-- Spanish II --
Select * from Computation
Where CourseID = 8765;
-- Calculus --
Select * from Computation
Where CourseID = 7654;
-- Computer Science III --
Select * from Computation
where CourseID = 6543;



-- Listing all Assignments
Select * from ASSIGNMENT;

-- Listing Scores by Students
-- Hank
 Select * from Grade
 Where StudentID=12345;
-- Leslie
Select * from Grade
Where StudentID=67890;
-- Kelly
Select * from Grade
Where StudentID=24680;

-- 4. Compute the average/highest/lowest score of an assignment;
-- Given Assignment Choosen: 15
SELECT a.AssignmentID, avg(g.AwardedPoints), max(g.AwardedPoints), min(g.AwardedPoints)
FROM ASSIGNMENT a, Grade g 
WHERE a.AssignmentID=15 
AND g.AssignmentID=a.AssignmentID;

-- 5. List all of the students in a given course;
-- Given Course Choosen: Pre-Calculus(9876)

SELECT S.StudentID, S.F_NAME from STUDENT S 
JOIN ENROLLMENT E 
WHERE E.COURSEID = 9876 AND S.StudentID=E.StudentID;

-- Given Course Choosen: Spanish II(8765)
SELECT S.StudentID, S.F_NAME from STUDENT S 
JOIN ENROLLMENT E 
WHERE E.COURSEID = 8765 AND S.StudentID=E.StudentID;

-- Given Course Choosen: Comp. Sci(6543)
SELECT S.StudentID, S.F_NAME from STUDENT S 
JOIN ENROLLMENT E 
WHERE E.COURSEID = 6543 AND S.StudentID=E.StudentID;


-- 6. List all of the students in a course and all of their scores on every assignment;
-- Given Course Choosen: Comp. Sci(6543)
SELECT E.StudentID,a.AssignmentID, E.COURSEID, g.AwardedPoints
FROM ASSIGNMENT a, Grade g, ENROLLMENT E
WHERE E.STUDENTID=G.STUDENTID AND E.COURSEID = 6543 AND g.AssignmentID=a.AssignmentID;

-- 7. Add an assignment to a course;
SET SQL_SAFE_UPDATES = 0;
INSERT INTO ASSIGNMENT VALUES(29,14,100,1);
SELECT * FROM ASSIGNMENT;

-- 8. Change the percentages of the categories for a course;
-- Given Course Choosen: Comp. Sci(6543)
-- All components of the grade is worth 25
UPDATE Computation 
SET PERCENTAGE=25 
WHERE COURSEID=6543;

Select * from Computation
Where courseid = 6543;

-- 9. Add 2 points to the score of each student on an assignment

UPDATE GRADE
SET AwardedPoints=AwardedPoints+2
WHERE AssignmentID=2;

SELECT * FROM GRADE
WHERE ASSIGNMENTID=2;
-- reverting score---
UPDATE GRADE
SET AwardedPoints=AwardedPoints-2
WHERE AssignmentID=2;

SELECT * FROM GRADE
WHERE ASSIGNMENTID=2;

-- 10.Add 2 points just to those students whose last name contains a ‘Q’.
-- Hank Quoy (12345)
UPDATE GRADE
SET AwardedPoints=AwardedPoints+2 
WHERE STUDENTID IN (
  SELECT STUDENTID
  FROM Student
  WHERE L_NAME LIKE '%Q%'
);

SELECT * 
FROM GRADE G INNER JOIN STUDENT S ON G.STUDENTID= S.STUDENTID
WHERE S.L_NAME LIKE 'Q%';



-- 11.Compute the grade for a student;
-- Hank Calculus-- 
SELECT SUM((G.AwardedPoints) * (C.PERCENTAGE/INSTANCE)/TotalPoints) AS grade
FROM GRADE G
LEFT JOIN ASSIGNMENT A ON G.ASSIGNMENTID = A.ASSIGNMENTID
JOIN COMPUTATION C ON C.COMPUTATIONID = A.COMPUTATIONID
JOIN(SELECT C.COMPUTATIONID, COUNT(*)AS COUNTER FROM GRADE G
LEFT JOIN ASSIGNMENT A ON G.ASSIGNMENTID = A.ASSIGNMENTID
JOIN COMPUTATION C ON C.COMPUTATIONID = A.COMPUTATIONID
WHERE COURSEID AND STUDENTID GROUP BY C.COMPUTATIONID)
J ON J.COMPUTATIONID = C.COMPUTATIONID
WHERE COURSEID = 7654 AND STUDENTID = 12345;

-- Hank Spanish II --
SELECT SUM((G.AwardedPoints) * (C.PERCENTAGE/INSTANCE)/TotalPoints) AS grade
FROM GRADE G
LEFT JOIN ASSIGNMENT A ON G.ASSIGNMENTID = A.ASSIGNMENTID
JOIN COMPUTATION C ON C.COMPUTATIONID = A.COMPUTATIONID
JOIN(SELECT C.COMPUTATIONID, COUNT(*)AS COUNTER FROM GRADE G
LEFT JOIN ASSIGNMENT A ON G.ASSIGNMENTID = A.ASSIGNMENTID
JOIN COMPUTATION C ON C.COMPUTATIONID = A.COMPUTATIONID
WHERE COURSEID AND STUDENTID GROUP BY C.COMPUTATIONID)
J ON J.COMPUTATIONID = C.COMPUTATIONID
WHERE COURSEID = 8765 AND STUDENTID = 12345;



-- 12. Compute the grade for a student, where the lowest score for a given category is dropped.
-- Hank Spanish II --
SELECT s.StudentID, c.CourseName, 
  ROUND(SUM(GREATEST(g.AwardedPoints, subquery.min_points) * comp.Percentage / 100), 2) AS Grade
FROM STUDENT s 
JOIN ENROLLMENT e ON s.StudentID = e.StudentID 
JOIN COURSE c ON e.CourseID = c.CourseID 
JOIN COMPUTATION comp ON c.CourseID = comp.CourseID 
JOIN ASSIGNMENT a ON comp.ComputationID = a.ComputationID 
JOIN GRADE g ON s.StudentID = g.StudentID AND a.AssignmentID = g.AssignmentID 
JOIN (
SELECT comp.Type, comp.CourseID, MIN(g.AwardedPoints) AS min_points
FROM COMPUTATION comp
JOIN ASSIGNMENT a ON comp.ComputationID = a.ComputationID 
JOIN GRADE g ON a.AssignmentID = g.AssignmentID 
GROUP BY comp.Type, comp.CourseID
) subquery ON comp.Type = subquery.Type AND comp.CourseID = subquery.CourseID 
WHERE s.StudentID = 12345 AND e.CourseID = 8765
GROUP BY s.StudentID, c.CourseName;

















