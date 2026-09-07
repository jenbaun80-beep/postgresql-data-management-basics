CREATE TABLE supplies (
    supply_id SERIAL PRIMARY KEY,
    supply_name VARCHAR(100),
    department VARCHAR(100),
    quantity INTEGER,
    unit_cost DECIMAL,
    last_updated DATE
);