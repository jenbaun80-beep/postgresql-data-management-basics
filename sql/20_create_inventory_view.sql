-- Milestone 18: Create Inventory View

CREATE VIEW supply_inventory_view AS
SELECT d.department_name,
       s.supply_name,
       s.quantity
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id
;

-- Create department stock summary view

CREATE VIEW department_stock_summary AS
SELECT department_name, SUM(quantity) AS total_stock
FROM supply_inventory_view
GROUP BY department_name;

