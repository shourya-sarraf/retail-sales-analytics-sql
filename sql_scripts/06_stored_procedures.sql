/*
Procedure: 01 
Get Top-N products by net sales for a given fiscal year,
optionally filtered by market.

Why it matters:
Enables dynamic reporting without rewriting SQL.
*/
DELIMITER $$

CREATE PROCEDURE get_top_products_by_sales (
    IN p_fiscal_year INT,
    IN p_market VARCHAR(50),
    IN p_top_n INT
)
BEGIN
    SELECT
        product,
        ROUND(SUM(net_sales) / 1000000, 2) AS net_sales_mln
    FROM net_sales_view
    WHERE fiscal_year = p_fiscal_year
      AND (p_market IS NULL OR p_market = '' OR market = p_market)
    GROUP BY product
    ORDER BY net_sales_mln DESC
    LIMIT p_top_n;
END $$

DELIMITER ;

/*
Procedure: 02 
Return top-N products within each division
based on quantity sold for a given fiscal year.

Why it matters:
Supports division-level planning and inventory optimization.
*/

DELIMITER $$

CREATE PROCEDURE get_top_n_products_by_division_qty (
    IN p_fiscal_year INT,
    IN p_top_n INT
)
BEGIN
    WITH product_sales AS (
        SELECT
            p.division,
            p.product,
            SUM(s.sold_quantity) AS total_qty
        FROM net_sales_view s
        JOIN dim_product p
            ON s.product_code = p.product_code
        WHERE s.fiscal_year = p_fiscal_year
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
    WHERE rnk <= p_top_n
    ORDER BY division, total_qty DESC;
END $$

DELIMITER ;


