-- Active: 1715395058611@@127.0.0.1@3306@testing_system_db
USE Testing_System_Db;

-- Question 1: Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các account thuộc phòng ban đó

DROP PROCEDURE IF EXISTS sp_GetAccFromDep;
DELIMITER $$
CREATE PROCEDURE sp_GetAccFromDep(IN in_department_name NVARCHAR(50))
BEGIN
    SELECT      A.*
    FROM        account A
    INNER JOIN  department D ON A.DepartmentID = D.DepartmentID
    WHERE       D.DepartmentName = in_department_name;
END$$
DELIMITER ;

CALL sp_GetAccFromDep('Sale');
-- Question 2: Tạo store để in ra số lượng account trong mỗi group
DROP PROCEDURE IF EXISTS sp_GetNumAccFromGroup;
DELIMITER $$
CREATE PROCEDURE sp_GetNumAccFromGroup (IN in_group_name VARCHAR(50), OUT out_num_acc INT UNSIGNED)
BEGIN
    SELECT      COUNT(A.AccountID) INTO out_num_acc
    FROM        `group` G
    LEFT JOIN   groupaccount GA ON G.GroupID = GA.GroupID 
    LEFT JOIN   account A  ON GA.AccountID = A.AccountID
    WHERE       G.GroupName = in_group_name;
END$$
DELIMITER ;

SET @num_acc_in_group = 0;
CALL sp_GetNumAccFromGroup('VTI Sale 01', @num_acc_in_group);
SELECT @num_acc_in_group



-- Question 3: Tạo store để thống kê mỗi type question có bao nhiêu question được tạo
-- trong tháng hiện tại
-- Question 4: Tạo store để trả ra id của type question có nhiều câu hỏi nhất
-- Question 5: Sử dụng store ở question 4 để tìm ra tên của type question
-- Question 6: Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên
-- chứa chuỗi của người dùng nhập vào hoặc trả về user có username chứa chuỗi của
-- người dùng nhập vào
-- Question 7: Viết 1 store cho phép người dùng nhập vào thông tin fullName, email và
-- trong store sẽ tự động gán:
-- username sẽ giống email nhưng bỏ phần @..mail đi
-- positionID: sẽ có default là developer
-- departmentID: sẽ được cho vào 1 phòng chờ
-- Sau đó in ra kết quả tạo thành công
-- Question 8: Viết 1 store cho phép người dùng nhập vào Essay hoặc Multiple-Choice để
-- thống kê câu hỏi essay hoặc multiple-choice nào có content dài nhất
-- Question 9: Viết 1 store cho phép người dùng xóa exam dựa vào ID
-- Question 10: Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng
-- store ở câu 9 để xóa) Sau đó in số lượng record đã remove từ các table liên quan trong khi removing
-- Question 11: Viết store cho phép người dùng xóa phòng ban bằng cách người dùng nhập
-- vào tên phòng ban và các account thuộc phòng ban đó sẽ được chuyển về phòng ban
-- default là phòng ban chờ việc
-- Question 12: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay
-- Question 13: Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng
-- gần đây nhất (Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")
