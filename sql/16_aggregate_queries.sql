-- Milestone 16: Aggregate Queries

SELECT COUNT(*) AS total_supplies
FROM Supplies;

SELECT SUM(quantity) AS total_quantity
FROM supplies;

SELECT AVG(quantity) AS average_quantity
FROM supplies;

SELECT MIN(quantity) AS lowest_quantity
FROM supplies;

SELECT MAX(quantity) AS highest_quantity
FROM supplies;

SELECT ROUND(AVG(quantity), 2) AS average_quantity
FROM supplies;

SELECT SUM(quantity) AS er_total_quantity
FROM supplies
WHERE department_id = 1;

SELECT COUNT(*) AS total_supplies,
        SUM(quantity) AS total_quantity,
        ROUND(AVG(quantity), 2) AS average_quantity,
        MIN(quantity) AS lowest_quantity,
        MAX(quantity) AS highest_quantity
FROM supplies;
