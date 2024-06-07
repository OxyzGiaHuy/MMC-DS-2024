USE Testing_System_Db;
# Ex 1
# Q1
SELECT acc.*, dp.*
FROM `account` AS acc
INNER JOIN `department` AS dp
ON acc.`DepartmentID` = dp.`DepartmentID`;
# Q2
SELECT acc.*
FROM `account` AS acc
WHERE acc.`CreateDate` > DATE('2010-12-20');
# Q3
SELECT acc.*
FROM `account` AS acc
INNER JOIN `position` AS pos 
ON pos.`PositionID` = acc.`PositionID`
WHERE pos.`PositionName` = 'Dev';
# Q4
SELECT dp.`DepartmentName`, COUNT(acc.`DepartmentID`) as 'Number of Staffs'
FROM `department` AS dp
JOIN `account` AS acc
ON acc.`DepartmentID` = dp.`DepartmentID`
GROUP BY dp.`DepartmentName`
HAVING COUNT(acc.`DepartmentID`) > 3;
# Q5
SELECT q.`Content`, COUNT(exq.`QuestionID`) AS 'So luong cau hoi'
FROM `question` AS q
INNER JOIN `examquestion` AS exq
ON exq.`QuestionID` = q.`QuestionID`
GROUP BY exq.`QuestionID`
ORDER BY COUNT(exq.`QuestionID`) DESC;
# Q7
SELECT q.*, COUNT(exq.`ExamID`) AS 'So luong Exam'
FROM `question` AS q
LEFT OUTER JOIN `examquestion` AS exq
ON exq.`QuestionID` = q.`QuestionID`
GROUP BY q.`QuestionID`;
# Q8
SELECT q.*, COUNT(ans.`QuestionID`) AS 'So luong Exam'
FROM `question` AS q
LEFT OUTER JOIN `answer` AS ans
ON ans.`QuestionID` = q.`QuestionID`
GROUP BY q.`QuestionID`
ORDER BY COUNT(q.`QuestionID`) DESC
LIMIT 1;
# Q9
SELECT gr.*, COUNT(gracc.`GroupID`) as "So account cua moi group"
FROM `group` AS gr
LEFT OUTER JOIN `groupaccount` as gracc
ON gracc.`GroupID` = gr.`GroupID`
GROUP BY gr.`GroupID`;
# Q10
SELECT pos.*, COUNT(acc.`PositionID`) as "So nguoi cua chuc vu nay`"
FROM `position` AS pos
LEFT OUTER JOIN `account` as acc
ON acc.`PositionID` = pos.`PositionID`
GROUP BY pos.`PositionID`
ORDER BY COUNT(acc.`PositionID`) ASC
LIMIT 1;
# Q11
SELECT dp.`DepartmentName`, COUNT(pos.`PositionName` = "Dev") as 'Number of Dev', COUNT(pos.`PositionName` = "Test") as 'Number of Test', COUNT(pos.`PositionName` = "Scrum Master") as 'Number of Scrum', COUNT(pos.`PositionName` = "PM") as 'Number of PM'
FROM `department` AS dp
LEFT OUTER JOIN `account` AS acc
ON acc.`DepartmentID` = dp.`DepartmentID`
LEFT OUTER JOIN `position` AS pos
ON acc.`PositionID` = pos.`PositionID`
GROUP BY dp.`DepartmentName`;
# Q12
SELECT q.`Content`, tq.`TypeName`, acc.`FullName`, ans.`Content`
FROM `question` AS q
INNER JOIN `typequestion` AS tq
ON q.`TypeID` = tq.`TypeID`
INNER JOIN `account` AS acc
ON q.`CreatorID` = acc.`AccountID`
INNER JOIN `answer` AS ans
ON q.`QuestionID` = ans.`QuestionID`;
# Q13
SELECT tq.`TypeName`, COUNT(tq.`TypeID`) AS "So luong cau hoi"
FROM `typequestion` AS tq
INNER JOIN `question` as q
ON q.`TypeID` = tq.`TypeID`
GROUP BY tq.`TypeName`; 
# Q14
SELECT gr.*, COUNT(gracc.`GroupID`) as "So account cua moi group"
FROM `group` AS gr
LEFT OUTER JOIN `groupaccount` as gracc
ON gracc.`GroupID` = gr.`GroupID`
GROUP BY gr.`GroupID`
HAVING COUNT(gracc.`GroupID`) = 0;
# Q16
SELECT q.*, COUNT(ans.`QuestionID`) AS 'So luong Exam'
FROM `question` AS q
LEFT OUTER JOIN `answer` AS ans
ON ans.`QuestionID` = q.`QuestionID`
GROUP BY q.`QuestionID`
HAVING COUNT(ans.`QuestionID`) = 0;

# Ex 2
# Q17
SELECT acc.*
FROM `account` AS acc
LEFT OUTER JOIN `groupaccount` AS gracc
ON acc.`AccountID` = gracc.`AccountID`
WHERE gracc.`GroupID` = 1
UNION 
SELECT acc.*
FROM `account` AS acc
LEFT OUTER JOIN `groupaccount` AS gracc
ON acc.`AccountID` = gracc.`AccountID`
WHERE gracc.`GroupID` = 2;
# Q18
SELECT gr.*
FROM `group` AS gr
LEFT OUTER JOIN `groupaccount` AS gracc
ON gracc.`GroupID` = gr.`GroupID`
GROUP BY gr.`GroupID`
HAVING COUNT(gracc.`GroupID`) > 3
UNION 
SELECT gr.*
FROM `group` AS gr
LEFT OUTER JOIN `groupaccount` AS gracc
ON gracc.`GroupID` = gr.`GroupID`
GROUP BY gr.`GroupID`
HAVING COUNT(gracc.`GroupID`) < 7;

