# PostgreSQL Data Management Basics

A beginner learning project using Docker, PostgreSQL, and SQL to practice foundational data management concepts with synthetic clinic supply inventory data.

## Project Overview

This project documents my progression in learning PostgreSQL and SQL through a small synthetic healthcare inventory database. I built the project incrementally, starting with basic database and table creation and progressing through data validation, relationships, joins, aggregation, subqueries, and views.

The project uses fictional clinic supply inventory data and does not contain real patient information or protected health information (PHI).

## Tools Used

- PostgreSQL
- SQL
- Docker
- Visual Studio Code
- PowerShell
- Git
- GitHub

## What I Practiced

Throughout the project, I practiced:

- Creating and working with PostgreSQL databases and tables
- Inserting, selecting, updating, and deleting data
- Filtering and sorting query results
- Applying data constraints and validation rules
- Creating primary keys and foreign key relationships
- Using default values and timestamps
- Creating indexes
- Normalizing data into related tables
- Using INNER, LEFT, RIGHT, and FULL OUTER JOINs
- Combining JOINs with filtering and aggregation
- Using aggregate functions such as COUNT, SUM, AVG, MIN, and MAX
- Using GROUP BY and HAVING
- Writing subqueries and correlated subqueries
- Using CASE expressions to classify data
- Creating and querying PostgreSQL views

## Database Structure

The project centers on two related tables:

### departments

Stores department information such as:

- Department ID
- Department name

### supplies

Stores clinic supply inventory information such as:

- Supply ID
- Supply name
- Quantity
- Department ID

The `department_id` relationship connects supplies to their corresponding departments.

## SQL Views

The project concludes with two PostgreSQL views.

### supply_inventory_view

Combines supply and department information into a reusable inventory query containing:

- Department name
- Supply name
- Quantity

### department_stock_summary

Uses the inventory view to summarize total stock quantity by department.

This demonstrated how a view can simplify repeated queries while continuing to use data from the underlying tables.

## Learning Progression

The project was completed through 20 incremental milestones. Rather than building the final database all at once, each milestone introduced or reinforced a small SQL or PostgreSQL concept.

The progression moved from foundational database operations into:

`Tables → CRUD → Validation → Constraints → Relationships → Indexes → Normalization → JOINs → Aggregation → Subqueries → CASE → Views`

My detailed milestone notes are documented in `LEARNING_LOG.md`.

## Repository Structure

```text
postgresql-data-management-basics/
│
├── sql/
│   └── SQL files created throughout the learning milestones
│
├── LEARNING_LOG.md
├── README.md
└── .gitignore
