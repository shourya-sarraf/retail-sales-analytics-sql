 /*
Business Question:
Which are the top-performing products within each division
based on quantity sold in FY 2021?

Why it matters:
Supports division-level assortment and inventory decisions.
*/
WITH product_sales AS (
    SELECT
        p.division,
        p.product,
        SUM(s.sold_quantity) AS total_qty
    FROM net_sales_view s
    JOIN dim_product p
        ON s.product_code = p.product_code
    WHERE s.fiscal_year = 2021
    GROUP BY p.division, p.product
),
ranked_products AS (
    SELECT
        division,
        product,
        total_qty,
        DENSE_RANK() OVER (
            PARTITION BY division
            ORDER BY total_qty DESC
        ) AS rnk
    FROM product_sales
)
SELECT
    division,
    product,
    total_qty
FROM ranked_products
WHERE rnk <= 3
ORDER BY division, total_qty DESC;
