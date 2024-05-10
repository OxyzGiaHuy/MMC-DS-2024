USE Testing_System_Db;

-- Q2
SELECT * FROM department;

-- Q3
SELECT DepartmentID 
FROM department
WHERE DepartmentName = 'Sale';

DELETE FROM `account` WHERE AccountID = 11;

-- Q4
SELECT * 
FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`);

-- Q5
SELECT * 
FROM `Account`
WHERE LENGTH(Fullname) = (SELECT MAX(LENGTH(Fullname)) FROM `Account`) 
AND DepartmentID = 3;

-- Q6
SELECT GroupName 
FROM `Group`
WHERE CreateDate < '2019-12-20';

-- Q7
SELECT QuestionID, COUNT(QuestionID)
FROM ANSWER
GROUP BY QuestionID
HAVING COUNT(QuestionID) >= 4;

-- Q8
SELECT Code, Duration, CreateDate
FROM Exam 
WHERE Duration >= 60 AND CreateDate < '2019-12-20';

-- Q9
SELECT CreateDate
FROM `Group`
ORDER BY CreateDate DESC
LIMIT 5;

-- Q10
SELECT COUNT(DepartmentID) 
FROM `Account`
WHERE DepartmentID = 2;

-- Q11
SELECT Fullname 
FROM `Account`
WHERE Fullname LIKE 'D%o';

-- Q12
DELETE FROM Exam
WHERE CreateDate < '2019-12-20 00:00:00';

-- Q13
DELETE FROM Question
WHERE `Content` LIKE N'Câu hỏi%';

-- Q14
UPDATE `Account`
SET Fullname = N'Lô Văn Đề', Email = N'lo.vande@mmc.edu.vn'
WHERE AccountID =5;

-- Q15
UPDATE `Account`
SET DepartmentID = 4
WHERE AccountID = 5;