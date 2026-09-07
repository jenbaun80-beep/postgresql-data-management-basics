SELECT COUNT(*)
FROM supplies;

SELECT COUNT(*)
FROM supplies
WHERE department = 'ER';

SELECT department, COUNT(*)
FROM supplies
GROUP BY department;

SELECT department, SUM(quantity)
FROM supplies
GROUP BY department;
 
SELECT department, AVG(quantity)
FROM supplies
GROUP BY department;


