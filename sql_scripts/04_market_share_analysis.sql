/*
Business Question: 01 
What is each customer’s contribution to total net sales globally?

Why it matters:
Identifies revenue concentration and dependency risks.
*/

WITH customer_sales AS (
    SELECT
        customer,
        ROUND(SUM(net_sales) / 1000000, 2) AS net_sales_mln
    FROM net_sales_view
    WHERE fiscal_year = 2021
    GROUP BY customer
)
SELECT
    customer,
    net_sales_mln,
    ROUND(
        net_sales_mln * 100.0 / SUM(net_sales_mln) OVER (),
        2
    ) AS market_share_pct
FROM customer_sales
ORDER BY market_share_pct DESC;

/*
Business Question: 02
How is market share distributed within each region?

Why it matters:
Supports region-level sales strategy and resource allocation.
*/
WITH regional_sales AS (
    SELECT
        c.region,
        c.customer,
        ROUND(SUM(s.net_sales) / 1000000, 2) AS net_sales_mln
    FROM net_sales_view s
    JOIN dim_customer c
        ON s.customer_code = c.customer_code
    WHERE s.fiscal_year = 2021
    GROUP BY c.region, c.customer
)
SELECT
    region,
    customer,
    net_sales_mln,
    ROUND(
        net_sales_mln * 100.0
        / SUM(net_sales_mln) OVER (PARTITION BY region),
        2
    ) AS market_share_pct
FROM regional_sales
ORDER BY region, market_share_pct DESC;
