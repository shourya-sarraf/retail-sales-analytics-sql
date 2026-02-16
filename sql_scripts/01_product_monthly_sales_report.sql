/*
Business Requirement:
As a Product Owner, I want to generate a monthly aggregated
product-level sales report for the Croma India customer (FY 2021)
to track individual product performance and enable further
product analysis in Excel.

Customer: Croma India
Fiscal Year: 2021
Aggregation Level: Month + Product Code
*/
/*
Report Fields:
- Month
- Product Name
- Variant
- Sold Quantity
- Gross Price per Item
- Total Gross Sales
*/
SELECT 
    MONTH(s.date) AS month_no,
    s.fiscal_year,
    p.product_code,
    p.product,
    p.variant,
    SUM(s.sold_quantity) AS sold_qty,
    g.gross_price,
    ROUND(SUM(g.gross_price * s.sold_quantity), 2) AS total_gross_sales
FROM fact_sales_monthly s
JOIN dim_product p 
    ON p.product_code = s.product_code
JOIN fact_gross_price g 
    ON g.product_code = s.product_code
   AND g.fiscal_year = s.fiscal_year
WHERE s.customer_code = 90002002   -- Croma India
  AND s.fiscal_year = 2021
GROUP BY 
    month_no,
    s.fiscal_year,
    p.product_code,
    p.product,
    p.variant,
    g.gross_price
ORDER BY month_no;

