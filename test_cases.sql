/*
-------------------------------------------------------TEST CASES-----------------------------------------------------
*/ 

-- Test Case for 6:
-- Given Course Choosen: Comp. Sci(6543)
SELECT E.StudentID,a.AssignmentID, E.COURSEID, g.AwardedPoints
FROM ASSIGNMENT a, Grade g, ENROLLMENT E
WHERE E.STUDENTID=G.STUDENTID AND E.COURSEID = 6543 AND g.AssignmentID=a.AssignmentID;
/*
EXPECTED OUTPUT:
+----------+--------------+-----------------+
|ComputationID| CourseID  | Type.    |Percent|
+----------+--------------+-----------------+
| 24680    | 6543         | Lab      |  25 |      
| 24680   | 6543         | Midterm  |  25 |
| 18        | 6543         | Final    |  25 |
| 19        | 6543         | Homework |  25 |
+----------+--------------+-----------------+
*/

-- Test Case for 7:
SET SQL_SAFE_UPDATES = 0;
INSERT INTO ASSIGNMENT VALUES(30,13,100,1);
/*
+----------+--------------+-----------------+
| StudentID | AssignmentID | AwardedPoints   |
+----------+--------------+-----------------+
| 28       | 19     | 100  |  1 |      
| 29       | 14     | 100  |  1 |
| 30       | 13     | 100  |  1 |
+----------+--------------+-----------------+
*/

-- Test Case for 8:
-- Given Course Choosen: Comp. Sci(6543)
-- All components of the grade is worth 25
UPDATE Computation 
SET PERCENTAGE=25 
WHERE COURSEID=6543;

Select * from Computation
Where courseid = 6543;
/*
EXPECTED OUTPUT:
+----------+--------------+-----------------+
|ComputationID| CourseID  | Type.    |Percent|
+----------+--------------+-----------------+
| 16        | 6543         | Lab      |  25 |      
| 17        | 6543         | Midterm  |  25 |
| 18        | 6543         | Final    |  25 |
| 19        | 6543         | Homework |  25 |
+----------+--------------+-----------------+
*/

-- Test Case for 9:
-- Insert test data into GRADE table
INSERT INTO GRADE (StudentID, AssignmentID, AwardedPoints)
VALUES (1, 1, 90),
       (2, 2, 85),
       (3, 2, 95),
       (4, 3, 88);
-- Run the UPDATE statement
UPDATE GRADE
SET AwardedPoints = AwardedPoints + 2
WHERE AssignmentID = 2;
-- Run the SELECT statement to retrieve the updated data
SELECT *
FROM GRADE
WHERE AssignmentID = 2;

/*
EXPECTED OUTPUT:
+----------+--------------+-----------------+
| StudentID | AssignmentID | AwardedPoints   |
+----------+--------------+-----------------+
| 2         | 2            | 87              |
| 3         | 2            | 97              |
+----------+--------------+-----------------+
*/

-- Test Case For 10:
-- Insert test data into STUDENT table
INSERT INTO STUDENT (StudentID, F_NAME, L_NAME)
VALUES (1, 'John', 'Smith'),
       (2, 'Jane', 'Doe'),
       (3, 'Michael', 'Johnson'),
       (4, 'Sarah', 'Quinn');
-- Insert test data into GRADE table
INSERT INTO GRADE (StudentID, AssignmentID, AwardedPoints)
VALUES (1, 101, 90),
       (2, 101, 85),
       (3, 101, 95),
       (4, 101, 88);
-- Run the UPDATE statement
UPDATE GRADE
SET AwardedPoints = AwardedPoints + 2
WHERE STUDENTID IN (
  SELECT STUDENTID
  FROM Student
  WHERE L_NAME LIKE '%Q%'
);
-- Run the SELECT statement to retrieve the updated data
SELECT *
FROM GRADE G
INNER JOIN STUDENT S ON G.STUDENTID = S.STUDENTID
WHERE S.L_NAME LIKE 'Q%';


/*
EXPECTED OUTPUT:
+----------+--------------+-----------------+---------+----------+-------+--------+-------+
| StudentID| AssignmentID | AwardedPoints   | StudentID | F_NAME | L_NAME | StudentID | F_NAME | L_NAME |
+----------+--------------+-----------------+---------+----------+-------+--------+-------+
|        4 | 101          | 90              | 4        | Sarah  | Quinn | 4        | Sarah  | Quinn |
+----------+--------------+-----------------+---------+----------+-------+--------+-------+
*/


-- Test Case For 11:
-- avg grade for hank quoy in Calculus
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

/*
EXPECTED OUTPUT:
+----------+
| StudentID|
|     95.5 |
+----------+
