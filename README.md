# Retail Sales Analytics (SQL)

## Business Problem
Retail organizations need a clear understanding of sales performance across markets, customers, and products.
This project focuses on analyzing retail sales data to calculate net sales accurately and generate business-ready insights such as top-performing markets, customer contribution, and product rankings.

The analysis is designed to support decision-making in areas like pricing, discount strategy, and product performance evaluation.

---

## Dataset Overview
The dataset follows a star-schema design and includes:
- Monthly sales transactions
- Product master data
- Customer and market information
- Gross pricing
- Pre-invoice and post-invoice discount details

The analysis is performed for a specific financial year and can be parameterized for reuse.

---

## Key Metrics Defined
- **Gross Sales**: Gross price × sold quantity  
- **Pre-Invoice Discount**: Discount applied before invoicing  
- **Post-Invoice Discount**: Discounts and deductions applied after invoicing  
- **Net Sales**: Final revenue after all discounts  
- **Market Share**: Contribution percentage of a customer or market to total net sales  

Detailed metric definitions are available in the `docs/` folder.

---

## Analysis Performed
- Creation of a reusable net sales view
- Top-performing markets, customers, and products analysis
- Global and region-wise market share analysis
- Product ranking within divisions using window functions
- Parameterized stored procedures for reusable analysis

---

## Project Structure
docs/ -> Business logic and metric explanations
sql/ -> SQL scripts used for analysis
sample_output/ -> Sample outputs and result snapshots
README.md -> Project overview and documentation

---

## Tools Used
- MySQL
- SQL (CTEs, Window Functions, Views, Stored Procedures)
- GitHub


