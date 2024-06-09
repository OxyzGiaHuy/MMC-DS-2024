Use testing_system_db

--Q1
DROP TRIGGER IF EXISTS Trg_CheckInsertGroup; DELIMITER $$
CREATE TRIGGER Trg_CheckInsertGroup
BEFORE INSERT ON `Group`
FOR EACH ROW
BEGIN
DECLARE v_CreateDate DATETIME;
SET v_CreateDate = DATE_SUB(NOW(), interval 1 year);
 	IF (NEW.CreateDate <= v_CreateDate) THEN
 	SIGNAL SQLSTATE '12345'
 	SET MESSAGE_TEXT = 'Cant create this group';
 	END IF;
END$$ DELIMITER ;

--Q2
DROP TRIGGER IF EXISTS TrG_NotAddUserToSale; DELIMITER $$
CREATE TRIGGER TrG_NotAddUserToSale
BEFORE INSERT ON `account`
FOR EACH ROW
BEGIN
 	DECLARE v_depID TINYINT;
 	SELECT d.DepartmentID INTO v_depID FROM department d WHERE d.DepartmentName = 'Sale';
 	IF (NEW.DepartmentID = v_depID) THEN
 	SIGNAL SQLSTATE '12345'
 	SET MESSAGE_TEXT = 'Cant add more User to Sale Department';
 	END IF;
END$$ DELIMITER ;	

--Q3
DROP TRIGGER IF EXISTS TrG_CheckToAddAccountToGroup; DELIMITER $$
CREATE TRIGGER TrG_CheckToAddAccountToGroup
BEFORE INSERT ON `groupaccount`
FOR EACH ROW
BEGIN
 	SELECT count(GA.GroupID) INTO var_CountGroupID FROM groupaccount GA
 	WHERE GA.GroupID = NEW.GroupID;
 	IF (var_CountGroupID >5) THEN
 	SIGNAL SQLSTATE '12345'
 	SET MESSAGE_TEXT = 'Cant add more User to This Group';
 	END IF;
END$$ DELIMITER ;

--Q4
DROP TRIGGER IF EXISTS TrG_LimitQuesNumInExam10; DELIMITER $$
CREATE TRIGGER TrG_LimitQuesNumInExam10
BEFORE INSERT ON `examquestion`
FOR EACH ROW
BEGIN
 	SELECT count(EQ.ExamID) INTO var_CountQuesInExam FROM examquestion EQ
 	WHERE EQ.ExamID = NEW.ExamID;
 	IF (var_CountQuesInExam >10) THEN
 	SIGNAL SQLSTATE '12345'
 	SET MESSAGE_TEXT = 'Num Question in this Exam is limited 10';
 	END IF;
END$$ DELIMITER ;

INSERT INTO `examquestion`(`ExamID`, `QuestionID`) VALUES (6, 2);
