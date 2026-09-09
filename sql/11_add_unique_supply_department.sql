ALTER TABLE supplies
ADD CONSTRAINT unique_supply_department
UNIQUE (supply_name, department);
