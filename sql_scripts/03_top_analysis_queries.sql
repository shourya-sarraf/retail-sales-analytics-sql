/*
01 -- Business Question:
Which markets generate the highest net sales in FY 2021?

Why it matters:
Helps leadership prioritize geographic investments.
*/
SELECT
    market,
    ROUND(SUM(net_sales) / 1000000, 2) AS net_sales_mln
FROM net_sales_view
WHERE fiscal_year = 2021
GROUP BY market
ORDER BY net_sales_mln DESC
LIMIT 5;
---
/*
02 -- Business Question:
Who are the top revenue-contributing customers?

Why it matters:
Supports account management and contract prioritization.
*/

SELECT
    customer,
    ROUND(SUM(net_sales) / 1000000, 2) AS net_sales_mln
FROM net_sales_view
WHERE fiscal_year = 2021
GROUP BY customer
ORDER BY net_sales_mln DESC
LIMIT 5;
--- 
/*
03 -- Business Question:
Which products drive the most revenue?

Why it matters:
Informs product strategy and inventory planning.
*/
SELECT
    product,
    ROUND(SUM(net_sales) / 1000000, 2) AS net_sales_mln
FROM net_sales_view
WHERE fiscal_year = 2021
GROUP BY product
ORDER BY net_sales_mln DESC
LIMIT 5;
---


