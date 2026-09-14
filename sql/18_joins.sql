-- Milestone 18: SQL JOINs

-- Section 1: Basic INNER JOIN
-- Connect supplies to departments

SELECT s.supply_name, d.department_name
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id;

-- JOIN: show supply, department, and quantity

SELECT s.supply_name, d.department_name, s.quantity
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id;

-- JOIN + WHERE: show ER supplies only

SELECT s.supply_name, d.department_name, s.quantity
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
WHERE d.department_name = 'ER';

-- JOIN + ORDER BY: highest quantity first

SELECT s.supply_name, d.department_name, s.quantity
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
ORDER BY s.quantity DESC;

-- JOIN + GROUP BY + SUM:
-- total stock by department

SELECT d.department_name, SUM(s.quantity) AS total_stock
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;

-- JOIN + GROUP BY + COUNT:
-- number of supplies by department

SELECT d.department_name, COUNT(*) AS supply_count
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name;

-- JOIN + GROUP BY + HAVING:
-- departments with more than 500 total units

SELECT d.department_name, SUM(s.quantity) AS total_stock
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(s.quantity) > 500;

-- WHERE filters individual supplies first.
-- HAVING filters the department totals afterward.

SELECT d.department_name, SUM(s.quantity) AS total_stock
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
WHERE s.quantity > 100
GROUP BY d.department_name
HAVING SUM(s.quantity) > 500;

-- Complete analytical JOIN:
-- total stock by department,
-- keep totals above 500,
-- highest total first.

SELECT d.department_name, SUM(s.quantity) AS total_stock
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
GROUP BY d.department_name
HAVING SUM(s.quantity) > 500
ORDER BY total_stock DESC;

-- LEFT JOIN keeps all departments,
-- even if they have no supplies.

SELECT d.department_name, s.supply_name
FROM departments d
LEFT JOIN supplies s
ON d.department_id = s.department_id;

-- Sort first by department,
-- then alphabetically by supply name.

SELECT d.department_name, s.supply_name, s.quantity
FROM supplies s
JOIN departments d
ON s.department_id = d.department_id
ORDER BY d.department_name, s.supply_name;

-- Section 12: Additional JOIN concepts
-- RIGHT JOIN keeps all rows from the right table.
-- 
-- FULL OUTER JOIN keeps all rows from both tables.
