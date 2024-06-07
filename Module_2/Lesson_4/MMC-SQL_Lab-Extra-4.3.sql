USE `hr`;
# Bai toan 1 
SELECT `employees`.`F_NAME`, `employees`.`L_NAME`, `job_history`.`START_DATE` 
FROM `employees`
INNER JOIN `job_history` ON `job_history`.`EMPL_ID` = `employees`.`EMP_ID`
WHERE `employees`.`DEP_ID` = 5;
# Bai toan 2 
SELECT `employees`.`F_NAME`, `employees`.`L_NAME`, `job_history`.`START_DATE`, `jobs`.`JOB_TITLE`
FROM `employees`
INNER JOIN `job_history` 
ON `job_history`.`EMPL_ID` = `employees`.`EMP_ID`
INNER JOIN `jobs`
ON `jobs`.`JOB_IDENT` = `employees`.`JOB_ID`
WHERE `employees`.`DEP_ID` = 5;
# Bai toan 3
SELECT `e`.`EMP_ID`, `e`.`L_NAME`, `dp`.`DEPT_ID_DEP`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
LEFT OUTER JOIN `departments` AS `dp`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID`;
# Bai toan 4
SELECT `e`.`EMP_ID`, `e`.`L_NAME`, `dp`.`DEPT_ID_DEP`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
LEFT OUTER JOIN `departments` as `dp`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID`
WHERE `e`.`B_DATE` < DATE('1980-01-01');
# Bai toan 5
SELECT `e`.`EMP_ID`, `e`.`L_NAME`, `dp`.`DEPT_ID_DEP`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
INNER JOIN `departments` as `dp`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID`
WHERE `e`.`B_DATE` < DATE('1980-01-01');
# Bai toan 6
SELECT `e`.`F_NAME`, `e`.`L_NAME`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
LEFT OUTER JOIN `departments` AS `dp`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID`
RIGHT OUTER JOIN `departments`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID`;
# Bai toan 7
SELECT `e`.`F_NAME`, `e`.`L_NAME`, `dp`.`DEPT_ID_DEP`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
LEFT OUTER JOIN `departments` AS `dp`
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID` AND `e`.`sex` = 'M'
UNION ALL 
SELECT `e`.`F_NAME`, `e`.`L_NAME`, `dp`.`DEPT_ID_DEP`, `dp`.`DEP_NAME`
FROM `employees` AS `e`
RIGHT OUTER JOIN `departments` AS dp
ON `dp`.`DEPT_ID_DEP` = `e`.`DEP_ID` AND `e`.`sex` = 'M';