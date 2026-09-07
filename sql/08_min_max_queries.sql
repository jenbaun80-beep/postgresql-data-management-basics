SELECT department, MIN(quantity), MAX(quantity)
FROM supplies
GROUP BY department;