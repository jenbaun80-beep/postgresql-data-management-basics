-- Milestone 18: Create Inventory View

CREATE VIEW supply_inventory_view AS
SELECT d.department_name,
       s.supply_name,
       s.quantity
FROM supplies s
JOIN departments d
    ON s.department_id = d.department_id
    