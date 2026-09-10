-- Milestone 14: Normalize Departments

CREATE TABLE Departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UINIQUE NOT NULL
);

INSERT INTO departments (department_name)
VALUES ('ER');

INSERT INTO departments (department_name)
VALUES ('Laboratory');

INSERT INTO departments (department_name)
VALUES ('ICU');

ALTER TABLE supplies
ADD COLUMN department_id INTEGER;

UPDATE supplies s
SET department_id = d.department_id
FROM departments d
WHERE s.department = d.department_name;

ALTER TABLE supplies
ADD CONSTRAINT fl_supplies_department
FOREIGN KEY (department_id)
REFERENCES departments(department_id);

ALTER TABLE supplies
ALTER COLUMN department_id SET NOT NULL;

DROP INDEX idx_supplies_department;

ALTER TABLE supplies
DROP CONSTRAINT unique_supply_department;

ALTER TABLE supplies
ADD CONSTRAINT unique_supply_department_id
UNIQUE (supply_name, department_id);

ALTER TABLE supplies
DROP COLUMN department;

