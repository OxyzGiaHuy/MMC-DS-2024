USE testing_system_db;

# Question 1
DROP VIEW IF EXISTS sale_member;
CREATE VIEW sale_member AS
SELECT acc.*
FROM `account` AS acc
INNER JOIN `department` AS dp
ON acc.`DepartmentID` = dp.`DepartmentID`
WHERE dp.`DepartmentName` = 'Sale';

# Question 2
DROP VIEW IF EXISTS most_account_group;
CREATE VIEW most_account_group AS
SELECT acc.*, COUNT(acc.`AccountID`) AS "So Luong group"
FROM `account` AS acc
INNER JOIN `groupaccount` AS gracc
ON acc.`AccountID` = gracc.`AccountID`
GROUP BY acc.`AccountID`
ORDER BY COUNT(acc.`AccountID`) DESC;

# Question 3
DROP VIEW IF EXISTS long_content_question;
CREATE VIEW long_content_question AS
SELECT q.* 
FROM `question` AS q
HAVING length(q.`Content`) <= 300;

# Question 4
DROP VIEW IF EXISTS most_staff_department;
CREATE VIEW most_staff_department AS
SELECT dp.*, COUNT(dp.`DepartmentID` = acc.`DepartmentID`)
FROM `department` AS dp
LEFT OUTER JOIN `account` AS acc
ON dp.`DepartmentID` = acc.`DepartmentID`
GROUP BY dp.`DepartmentID`;

# Question 5
DROP VIEW IF EXISTS user_nguyen;
CREATE VIEW user_nguyen AS
SELECT q.*, acc.`FullName`
FROM `question` AS q
INNER JOIN `account` AS acc
ON q.`CreatorID` = acc.`AccountID`
WHERE acc.`FullName` LIKE "Nguyen %" OR acc.`FullName` LIKE N'Nguyễn%';
