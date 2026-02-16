# Retail Sales Analytics using SQL

## Project Overview
This project focuses on analyzing retail sales data using SQL to derive
business insights such as top-performing markets, products, customers,
and overall market share.

The project follows a structured, production-style SQL workflow with
clear separation of business logic, analysis queries, and documentation.

---

## Business Objectives
- Calculate Gross and Net Sales accurately
- Identify top markets, customers, and products
- Analyze market contribution and performance
- Use SQL best practices such as views, CTEs, and window functions

---

## Dataset Description
The dataset contains retail sales transaction data including:
- Sales quantity
- Product details
- Market and customer information
- Pricing and discount data

(Data modeled using fact and dimension tables)

---

## Project Structure
sql_scripts/ → Core SQL queries and views
docs/ → Business logic and metric explanations
sample_outputs/ → Query results and visual outputs
schema/ → Database schema reference

---

## Key SQL Concepts Used
- Joins (INNER, LEFT)
- Aggregations
- Views
- Window Functions (RANK, DENSE_RANK)
- Stored Procedures
- Date and fiscal year filtering

---

## Key Analyses Performed
- Net Sales Calculation
- Top 5 Markets by Net Sales
- Top Products and Customers
- Market Share Analysis
- Ranking Analysis using Window Functions

---

## How to Use

1. Review business logic and metric definitions in  
   [`business_logic_docs/`](business_logic_docs/)
   - [`metric_definitions.md`](business_logic_docs/metric_definitions.md)
   - [`net_sales_formula.md`](business_logic_docs/net_sales_formula.md)

2. Execute SQL scripts sequentially from `01` to `06` located in  
   [`sql_scripts/`](sql_scripts/)

3. Refer to expected results in  
   [`sample_outputs/`](sample_outputs/)

---

## Author
**Shourya Sarraf**  
Aspiring Data Analyst | SQL | Excel | Power BI
