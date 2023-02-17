SELECT '' AS 'Chad Strachan';
SELECT '' AS 'PROG2220: Section 3';
SELECT '' AS 'Assignment 2: Task 2';
SELECT SYSDATE() AS 'Current System Date';

SELECT '';
SELECT '' AS '*** Task 2, Q1. SWE Exerise 1 [2 points]
***';
SELECT '' AS '*** Retrieve the names of the cities which each consultant lives. Suppress duplicate
outputs, and display the values in alphabetical order. ***';

USE swexpert;

SELECT DISTINCT c_city
FROM consultant
ORDER BY c_city ASC;

SELECT '';
SELECT '' AS '*** Task 2, Q2. SWE Exerise 2 [2 points]
***';
SELECT '' AS '*** Retrieve the project ID and project name of all projects that have parent projects ***';

USE swexpert;

SELECT p_id, project_name
FROM project
WHERE parent_p_id IS NOT NULL;


SELECT '';
SELECT '' AS '*** Task 2, Q3. SWE Exerise 3 [4 points]
***';
SELECT '' AS '*** Using only the project table, display the project id, project name, parent projects id along
with the parent projects name. Include all the projects even if they do not have any
parent project assigned. ***';

USE swexpert;

SELECT p1.p_id, p1.project_name, p2.parent_p_id, p2.project_name AS parent_project_name
FROM project p1, project p2;

SELECT '';
SELECT '' AS '*** Task 2, Q2. SWE Exerise 4 [2 points]
***';
SELECT '' AS '*** Write a SELECT statement that returns the consultant ID, skill ID and certification from
the consultant_skill table. List only consultants with skills that are certified. Sort the final
result set by skill ID, followed by consultant ID. ***';

USE swexpert;

SELECT c_id, skill_id, certification
FROM consultant_skill
WHERE certification = 'Y'
ORDER BY skill_id, c_id;

SELECT '';
SELECT '' AS '*** Task 2, Q2. SWE Exerise 2 [2 points]
***';
SELECT '' AS '*** List all the consultant ID, last name and first name, skill ID and skill description, only for
all consultants with skills that are certified. Sort the final result set by skill ID, followed by
consultant ID. ***';

USE swexpert;

SELECT c.c_id, c_last, c_first, s.skill_id, s.skill_description
FROM consultant c, skill s, consultant_skill cs
WHERE cs.certification = 'Y'
ORDER BY s.skill_id, c.c_id;

