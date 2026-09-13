-- Milestone 17: GROUP BY and HAVING

SELECT department_id,
       SUM(quantity) AS total_quantity
FROM supplies
GROUP BY department_id;

SELECT department_id,
       COUNT(*) AS supply_count
FROM supplies
GROUP BY department_id;

SELECT department_id,
       ROUND(AVG(quantity), 2) AS average_quantity
FROM supplies
GROUP BY department_id;

SELECT d.department_name,
       ROUND(AVG(s.quantity), 2) AS average_quantity
FROM supplies s
JOIN departments d
     ON s.department_id = d.department_id
GROUP BY d.department_name;

SELECT d.department_name,
       SUM(s.quantity) AS total_quantity
FROM supplies s
JOIN departments d
     ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(s.quantity) > 500;

SELECT d.department_name,
       SUM(s.quantity) AS total_quantity
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id
GROUP BY d.department_name
ORDER BY total_quantity DESC;

SELECT d.department_name,
       COUNT(*) AS supply_count
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING COUNT(*) >= 2
ORDER BY supply_count DESC;
