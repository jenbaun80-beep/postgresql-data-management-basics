# PostgreSQL Data Management Basics - Learning Log

This log tracks what I practiced, what I practiced it, and what I learned while building this project. 

## Current Status

- Milesstone 16: Complete
- Next: Milestone 17 - GROUP BY and HAVING
- Project progress: 17 of 20 miles complete

## Milestone 1 - Create the Supplies Table

**What I did:** Created the initial 'supplies' table for the clinic inventory database.
**Why:** I needed a basic table where inventory records could be stored. 
**What I learned:** A database table organizes related information into columns and rows. Each column represents a type of information, while each row represents one record.

## Mileston 2 - Insert Inventory Data

**What I did:** Added sample clinic supply records to the 'supplies' table using "INSERT INTO'.
**Why:** A table needs records before I can practice retrieving, filtering, and analyzing data.
**What I learned:** 'INSERT INTO' adds new rows to a table. I also learned that the values I insert need to match the table's columns and expected data types. 

## Milestone 3 - Query Inventory Data

**What I did:** Used 'SELECT' to retrieve information from the 'supplies' table. 
**Why:** I needed to learn how to view the data stored in PostgreSQL instead of only adding records. 
**What I learned:** 'SELECT' retrieves data without changing it. "SELECT *' returns all columns, while specifying column names lets me retrieve only the information I need. 

## Milestone 4 - Filter Inventory Data

**What I did:* Used 'WHERE' to retrieve only inventory records that matched specific conditions. 
**Why:** I wanted to answer more specific questions instead of displaying every record in tbale. 
**What I learned:** 'WHERE' filters row based on a condition. This lets me ask PostgreSQL questions such as which supplies belong to a particular department or meet a certain quantity condition. 

## Milestone 5 - Update Inventory Data

**What I did:** Used 'UPDATE' to modify information already stored in the 'supplies table.
**Why:** Inventory information can change, so I needed to learn how to modify an existing record instead of deleting it and creating a new one. 
**What I learned:** 'UPDATE' changes existing data, and 'WHERE' controls which rows are changed. I learned to be careful with 'UPDATE' because leaving out the 'WHERE' conditon can affect every row in the table. 

## Milestone 6 - Delete Inventory Data

**What I did:** Used 'DELETE' to remove records from the 'supplies" tabel. 
**Why:** Databases sometimes contain records that are no longer needed or were entered for testing. 
**What I learned:** 'DELETE' removes rows, and "WHERE' determines which rows are removed. Just like with 'UPDATE', I learned that forgetting the 'WHERE' condition could affect every row in the table. 

## Milestone 7 - Add a Primary Key

**What I did:** Used 'supply_id' as the primary key for the 'supplies' table. 
**Why:** Each inventory record needs a realiable way to be uniquely identified.
**What I learned:** A 'PRIMARY KEY' uniquely indentifies each row in a table. Two records might have similar information, but their primary key values must be unique. 

## Milestone 8 - Validate Inventory Data

**What I did:** Practiced indentifying invalid inventory values before adding stronger database rules. 
**Why:** Inventory data should follow basic business rules. For example, a supply quantity should not be negative. 
**What I learned:** Data validation helps catch incorrect or unrealistic values. I learned that checjing that data first is important before enforcing a new database constraint. 

## Milestone 9 - Add a CHECK Constraint

**What I did:** Added a 'CHECK' constraint to prevent negative inventory quantities. 
**Why:** A negative quantity would not make sense for the clinic inventory.
**What I learned:** A 'CHECK' constraint lets PostgreSQL enforce a rule automatically. Instead if relying on me to remember that quantity must be zero or greater, the database can reject invalid data. 
**Rule used:** quantity >= 0

## Milestone 10 - Create an Index

**What I did:** Created an index named 'idx_supplies_department' on the 'department' column.
**Why:** I wanted to learn how PostfreSQL can make searches and filtering more efficient as a table becomes larger. 
**What I learned:** An 'INDEX' helps PostgreSQL locate rows more efficiently instead of always scanning an entire table. An index has more value as the amount of data grows. 
**Index used:** 'idx_supplies_department'

## Mileston 11 - Add UNIQUE Constraint

**What I did:** Added a 'UNIQUE' constraint to prevent the same supply from being entered more than once for the same department. 
**Why:** The inventory should not contain duplicate records for the same supply within the same department. 
**What I learned:** A 'UNIQUE' constraint prevents duplkicate combinations of values. Multiple departments can have the same supply, but the same supply-and-department combination should appear only once. 
**Original rule:** (supply_name, department)

## Milestone 12 - Require a Supply Name

**What I did:** Added a 'NOT NULL' constraint to 'supply_name'
**Why:** Every inventory record should identify what the supply actually is. A record without a supply name would be incomplete. 
**What I learned:** 'NOT NULL' makes a value required. PostgreSQL will reject a new record if a required column is left empty. 
**Rule used:** 'supply_name NOT NULL'

## Milestone 13 - Add a Default Date

**What I did:** Added 'CURRENT_DATE' as the default value for the 'last_updated' column. 
**Why:** I wanted new inventory records to automatically record the date they were added or updated without manually entering a date every time. 
**What I learned:** A 'DEFAULT' provides a value automatically when I do not supply one during an "INSERT'. I also learned that adding a default does not automatically change older rows that already contain 'NULL'.
**Default used:** 'CURRENT_DATE'

## Milestone 14 - Normalize Departments

**What I did:** Created a separate 'departments' table and replaced repeated department name in 'supplies' with 'department_id'.
**why:** Storing department names repeatedly creates unnecessary duplication. A separate departments table gives each department one ID and one authoritative name. 
**What I learned:** Normalization separteds related information into tabels and connects them through keys. A 'PRIMARY KEY' identifies a department, while a 'FOREIGN KEY' lets 'supplies' reference that department.

**Migration process:**
1. Create the 'departments' table.
2. Added ER, Laboratory, and ICU. 
3. Added 'department_id' to 'supplies'
4. Matched the existing department names to their IDs.
5. Added a foreign key.
6. Made 'department_id' 'NOT NULL'.
7. Replaced the old UNIQUE constraint with '(supply_name, department_id)'.
8. Removed the redundant 'department' text column.

**Key relationship:** 'supplies.department_id' -> 'departments.department_id'
**Important lesson:** Migrate and verify existing data before removing the old structure.

## Milestone 15 - JOIN Queries

**What I did:** Used 'JOIN' and 'LEFT JOIN' to combine information from the 'supplies' and 'departments' tables. 
**Why:** After normalizing the database, 'supplies' stores 'department_id' instead of repeating department names. A JOIN lets me retrieve the department name when I need it. 
**What I learned:** 'JOIN' combines related tables, while 'ON' tells PostgreSQL how the rows match. I used table aliases ('s' and 'd') to make queries easier to read. I also learned that an 'INNER JOIN' returns matching rows, while a 'LEFT JOIN' keeps all rows from the left table.
**Key relationship:** 's.department_id = d.department_id'
**Data-quality check:** A 'LEFT JOIN' combined with 'WHERE d.department_id IS NULL' can identity supplies without a matching department. My check returned 0 rows, confirming that every supply currently has a valid department relationship.

## Milestone 16 - Aggregate Queries

**What I did:** Used aggregate functions to summarize inventory  data. I practices 'COUNT()', 'SUM()', 'AVG()', 'MIN()', and 'MAX()'. I also used 'WHERE' with an aggregate, added readable column aliases with 'AS', and used 'ROUND()' to control decimal places. 
**Why:** Aggregate functions let me turn multiple inventory records into useful summary information, such as the total number of supplies, total inventory quantity, average quantity, and the lowest and highest quantities. 
**What I learned:** Aggregate funtions summarize many rows into calculated results, 'COUNT()' count records, 'SUM()' add values, 'AVG()' calculates an average, 'MIN()' finds the smallest value, and 'MAX()' finds the largest value. I also learned that 'WHERE' filters the rows before the aggregate calculation is performed. 

**Results from my practice data:**
- Total supply records: 7
- Total inventory quantity: 1,825
- Average quantity: 260.71
- Lowest quantity: 50
- Highest quantity: 800
- ER total quantity: 600

**Important lesson:** Multiple aggregate functions can be placed in the same 'SELECT' statement. Each aggregate becomes a separate result column, while PostgreSQL can still return one summary row for the entire table.

## Milestone 17 -

**What I did:**
**Why:**
**What I learned:**

## Milestone 18 -

**What I did:**
**Why:**
**What I learned:**

## Milestone 19 -

**What I did:**
**Why:**
**What I learned:**

## Milestone 20 - 
**What I did:**
**Why:**
**What I learned:**

