-- Milestone 15: JOIN Queries

SELECT s.supply_name,
       d.department_name
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id

SELECT s.supply_name,
       d.department_name
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id
WHERE d.department_name = 'ER';

SELECT s.supply_name,
       d.department_name
FROM supplies s
LEFT JOIN departments d
    ON s.department_id = d.department_id;

SELECT s.supply_name,
       d.department_id
FROM supplies s
LEFT JOIN departments d
    ON s.department_id = d.department_id
    WHERE d.department_id IS NULL;

    