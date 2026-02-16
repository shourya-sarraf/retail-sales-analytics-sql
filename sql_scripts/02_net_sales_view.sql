/*
Purpose:
Create a reusable Net Sales view that standardizes revenue
calculation across the organization.

Why:
Gross sales alone do not reflect true revenue.
This view applies all pricing and discount logic once,
so downstream analytics remains consistent.

Grain:
Date + Product + Customer
*/
/*
Net Sales Calculation Flow:
1. Gross Sales = Sold Quantity × Gross Price
2. Apply Pre-Invoice Discounts
3. Apply Post-Invoice Discounts
4. Final Net Sales
*/
CREATE OR REPLACE VIEW net_sales_view AS
SELECT
    s.date,
    s.fiscal_year,
    s.product_code,
    s.customer_code,
    s.sold_quantity,
    g.gross_price,
    
    -- Gross Sales
    ROUND(s.sold_quantity * g.gross_price, 2) AS gross_sales,
    
    -- Net Sales after discounts
    ROUND(
        (s.sold_quantity * g.gross_price)
        * (1 - pre.pre_invoice_discount_pct)
        * (1 - post.post_invoice_discount_pct),
    2) AS net_sales
FROM fact_sales_monthly s
JOIN fact_gross_price g
    ON s.product_code = g.product_code
   AND s.fiscal_year = g.fiscal_year
JOIN fact_pre_invoice_deductions pre
    ON s.customer_code = pre.customer_code
   AND s.fiscal_year = pre.fiscal_year
JOIN fact_post_invoice_deductions post
    ON s.date = post.date
   AND s.product_code = post.product_code;

