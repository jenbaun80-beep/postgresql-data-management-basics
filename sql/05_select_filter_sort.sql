SELECT *
FROM supplies
WHERE department = 'ER';

SELECT supply_name, quantity
FROM supplies
WHERE department = 'Laboratory';

SELECT supply_name, quantity
FROM supplies
ORDER BY quantity DESC;

SELECT supply_name, quantity
FROM supplies
WHERE department = 'Laboratory'
ORDER BY quantity ASC;

