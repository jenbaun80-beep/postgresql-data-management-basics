-- Milestone 19: SQL Subqueries

-- Section 1: Find supplies above the average quantity

SELECT supply_name, quantity
FROM supplies
WHERE quantity > (
    SELECT AVG(quantity)
    FROM supplies
);

-- Section 2: Find the supply with the maximum quantity

SELECT supply_name, quantity
FROM supplies
WHERE quantity = (
    SELECT MAX(quantity)
    FROM supplies
);

-- Section 3: Find supplies in ER or Laboratory

SELECT supply_name, department_id
FROM supplies
WHERE department_id IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('ER', 'Laboratory')
);

-- Section 4: Find supplies NOT in ER or Laboratory

SELECT supply_name, department_id
FROM supplies
WHERE department_id NOT IN (
    SELECT department_id
    FROM departments
    WHERE department_name IN ('ER', 'Laboratory')
);

-- Section 5: Find departments that have supplies

SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM supplies s
    WHERE s.department_id = d.department_id
);

-- Section 6: Find departments that have a supply with quantity greater than 500

SELECT d.department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM supplies s
    WHERE s.department_id = d.department_id
    AND s.quantity > 500
);

-- Section 7: Find supplies with quantity greater than every ER supply

SELECT supply_name, quantity
FROM supplies
WHERE quantity > ALL (
    SELECT quantity
    FROM supplies
    WHERE department_id = 1
);

-- Section 8: Find supplies with quantity greater than at least one ER supply

SELECT supply_name, quantity
FROM supplies
WHERE quantity > ANY (
    SELECT quantity
    FROM supplies
    WHERE department_id = 1
);

-- Section 9: Show each supply with the overall average quantity

SELECT supply_name,
       quantity,
       (SELECT AVG(quantity) FROM supplies) AS average_quantity
FROM supplies;


-- Section 10: Classify supplies as above or below average

SELECT supply_name,
       quantity,
       CASE
           WHEN quantity > (SELECT AVG(quantity) FROM supplies)
           THEN 'Above Average'
           ELSE 'Below Average'
       END AS stock_level
FROM supplies;

-- Section 11: Classify supplies into three stock levels

SELECT supply_name,
       quantity,
       CASE
           WHEN quantity < 100 THEN 'Low Stock'
           WHEN quantity <= 300 THEN 'Normal Stock'
           ELSE 'High Stock'
       END AS stock_level
FROM supplies;

-- Section 12: Find supplies above their department's average

SELECT s.supply_name,
       s.department_id,
       s.quantity
FROM supplies s
WHERE s.quantity > (
    SELECT AVG(s2.quantity)
    FROM supplies s2
    WHERE s2.department_id = s.department_id
);


