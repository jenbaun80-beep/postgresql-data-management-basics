SELECT *
FROM supplies
WHERE quantity < 0;

ALTER TABLE supplies
ADD CONSTRAINT quantity_nonnegative
CHECK (quantity >= 0);