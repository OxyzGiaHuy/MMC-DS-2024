USE hr;

-- Ex1
SELECT * FROM EMPLOYEES WHERE ADDRESS LIKE '%Elgin,IL';

-- Ex2
SELECT * FROM EMPLOYEES WHERE B_DATE LIKE '197%';

-- Ex3
SELECT * FROM EMPLOYEES WHERE DEP_ID = 5 AND SALARY BETWEEN 60000 AND 70000;

-- Ex4A
SELECT * FROM EMPLOYEES ORDER BY DEP_ID;

-- Ex4B
SELECT * FROM EMPLOYEES ORDER BY DEP_ID DESC, F_NAME DESC;

-- Ex5A
SELECT DEP_ID, COUNT(*) FROM EMPLOYEES GROUP BY DEP_ID;

-- Ex5B
SELECT DEP_ID, COUNT(*), AVG(SALARY) FROM EMPLOYEES GROUP BY DEP_ID; 

-- Ex5C
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DEP_ID; 

-- Ex5D
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY FROM EMPLOYEES GROUP BY DEP_ID ORDER BY AVG_SALARY;

-- Ex5E
SELECT DEP_ID, COUNT(*) AS NUM_EMPLOYEES, AVG(SALARY) AS AVG_SALARY 
FROM EMPLOYEES GROUP BY DEP_ID 
HAVING COUNT(*) < 4 ORDER BY AVG_SALARY;
