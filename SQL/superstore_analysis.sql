==============================================
-- SUPERSTORE SALES & PROFITABILITY ANALYSIS
-- MySQL 8.0
==============================================

==============================================
 DATA VALIDATION
==============================================

Query 1: Check total rows

SELECT COUNT(*) AS total_rows
FROM superstore_sales;

Query 2: Missing Values Verification

SELECT
    COUNT(*) AS total_rows,
    SUM(ship_mode IS NULL OR ship_mode = '') AS missing_ship_mode,
    SUM(segment IS NULL OR segment = '') AS missing_segment,
    SUM(country IS NULL OR country = '') AS missing_country,
    SUM(city IS NULL OR city = '') AS missing_city,
    SUM(state IS NULL OR state = '') AS missing_state,
    SUM(postal_code IS NULL OR postal_code = '') AS missing_postal_code,
    SUM(region IS NULL OR region = '') AS missing_region,
    SUM(category IS NULL OR category = '') AS missing_category,
    SUM(sub_category IS NULL OR sub_category = '') AS missing_sub_category,
    SUM(sales IS NULL) AS missing_sales,
    SUM(quantity IS NULL) AS missing_quantity,
    SUM(discount IS NULL) AS missing_discount,
    SUM(profit IS NULL) AS missing_profit
FROM superstore_sales;

Query 3: Negative Sales Verification

SELECT COUNT(*) AS negative_sales
FROM superstore_sales
WHERE sales < 0;

Query 4: Negative Profit Verification

SELECT COUNT(*) AS negative_profit
FROM superstore_sales
WHERE profit < 0;

Query 5: Categories Verification

SELECT DISTINCT category
FROM superstore_sales
ORDER BY category;

Query 6: Regions Verification

SELECT DISTINCT region
FROM superstore_sales
ORDER BY region;

Query 7: Segments Verification

SELECT DISTINCT segment
FROM superstore_sales
ORDER BY segment;

==============================================
 OVERALL KPIs
==============================================


Query 8: negative sales Verification

SELECT COUNT(*) AS negative_sales
FROM superstore_sales
WHERE sales < 0;


Query 9: negative profit Verification

SELECT COUNT(*) AS negative_profit
FROM superstore_sales
WHERE profit < 0;


Query 10: Categories Checking

SELECT DISTINCT category
FROM superstore_sales
ORDER BY category;

==============================================
 Regional Analysis
==============================================



Query 11: Region Checking

SELECT DISTINCT region
FROM superstore_sales
ORDER BY region;

Query 12: Segment Checking

SELECT DISTINCT segment
FROM superstore_sales
ORDER BY segment;

Query 13: Total Sales

SELECT
    SUM(sales) AS total_sales
FROM superstore_sales;


Query 14: Total Profit

SELECT
    SUM(profit) AS total_profit
FROM superstore_sales;

Query 15: Total Quantity

SELECT
    SUM(quantity) AS total_quantity
FROM superstore_sales;

Query 16: Average Discount

SELECT
    AVG(discount) AS average_discount
FROM superstore_sales;

Query 17: Minimum and Maximum Sales

SELECT
    MIN(sales) AS minimum_sale,
    MAX(sales) AS maximum_sale
FROM superstore_sales;

Query 18: Overall Profit Margin

SELECT
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales;

Query 18: Profit by Category

SELECT
    category,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

Query 19: Sales and Profit by Category

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

Query 20: Profit Margin by Category

SELECT
    category,
    SUM(sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY category
ORDER BY profit_margin_percentage DESC;

Query 21: Overall Profit Margin

SELECT
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales;

Query 22: Sales by Category

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

Query 23: Profit by Category

SELECT
    category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_profit DESC;

Query 24: Sales + Profit by Category

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY category
ORDER BY total_sales DESC;

Query 25: Profit Margin by Category

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY category
ORDER BY profit_margin_percentage DESC;

Query 26: Sales by Region

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

Query 27: Profit by Region

SELECT
    region,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY region
ORDER BY total_profit DESC;

Query 28: Sales, Profit & Margin by Region

SELECT
    region,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY region
ORDER BY total_sales DESC;

Query 29: Sales by Segment

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY segment
ORDER BY total_sales DESC;

Query 30: Profit by Segment

SELECT
    segment,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY segment
ORDER BY total_profit DESC;

Query 31: Segment Profitability

SELECT
    segment,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY segment
ORDER BY profit_margin_percentage DESC;

Query 32: Sales by Sub-Category

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_sales DESC;

Query 33: Profit by Sub-Category

SELECT
    sub_category,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY sub_category
ORDER BY total_profit DESC;

Query 34: Sub-Category Profit Margin

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY sub_category
ORDER BY profit_margin_percentage DESC;

Query 35: Find Loss-Making Sub-Categories

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC;

Query 36: Top 10 States by Sales

SELECT
    state,
    ROUND(SUM(sales), 2) AS total_sales
FROM superstore_sales
GROUP BY state
ORDER BY total_sales DESC
LIMIT 10;

Query 37: Top 10 States by Profit

SELECT
    state,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY state
ORDER BY total_profit DESC
LIMIT 10;

Query 38: Profit by Discount Level

SELECT
    discount,
    COUNT(*) AS number_of_sales,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY discount
ORDER BY discount;

Query 39: Create Discount Categories

SELECT
    CASE
        WHEN discount = 0 THEN 'No Discount'
        WHEN discount <= 0.20 THEN 'Low Discount'
        WHEN discount <= 0.40 THEN 'Medium Discount'
        ELSE 'High Discount'
    END AS discount_level,

    COUNT(*) AS number_of_sales,

    ROUND(SUM(sales), 2) AS total_sales,

    ROUND(SUM(profit), 2) AS total_profit,

    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage

FROM superstore_sales

GROUP BY discount_level

ORDER BY
    CASE discount_level
        WHEN 'No Discount' THEN 1
        WHEN 'Low Discount' THEN 2
        WHEN 'Medium Discount' THEN 3
        WHEN 'High Discount' THEN 4
    END;

Query 40: High Discount Transactions

SELECT
    COUNT(*) AS high_discount_sales,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
WHERE discount >= 0.40;

Query 41: High Discount by Category

SELECT
    category,
    COUNT(*) AS high_discount_sales,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
WHERE discount >= 0.40
GROUP BY category
ORDER BY total_profit ASC;

Query 42: Rank Sub-Categories by Sales

WITH subcategory_sales AS (
    SELECT
        sub_category,
        SUM(sales) AS total_sales
    FROM superstore_sales
    GROUP BY sub_category
)

SELECT
    sub_category,
    ROUND(total_sales, 2) AS total_sales,
    RANK() OVER (
        ORDER BY total_sales DESC
    ) AS sales_rank
FROM subcategory_sales
ORDER BY sales_rank;

Query 43: Rank Sub-Categories by Profit

WITH subcategory_profit AS (
    SELECT
        sub_category,
        SUM(profit) AS total_profit
    FROM superstore_sales
    GROUP BY sub_category
)

SELECT
    sub_category,
    ROUND(total_profit, 2) AS total_profit,
    RANK() OVER (
        ORDER BY total_profit DESC
    ) AS profit_rank
FROM subcategory_profit
ORDER BY profit_rank;

Query 44: Rank Regions by Profit Margin

WITH regional_performance AS (
    SELECT
        region,
        SUM(sales) AS total_sales,
        SUM(profit) AS total_profit
    FROM superstore_sales
    GROUP BY region
)

SELECT
    region,
    ROUND(total_sales, 2) AS total_sales,
    ROUND(total_profit, 2) AS total_profit,
    ROUND(
        total_profit / total_sales * 100,
        2
    ) AS profit_margin_percentage,
    RANK() OVER (
        ORDER BY total_profit / total_sales DESC
    ) AS margin_rank
FROM regional_performance
ORDER BY margin_rank;

Query 45: Top 5 Sub-Categories by Profit

WITH subcategory_profit AS (
    SELECT
        sub_category,
        SUM(profit) AS total_profit
    FROM superstore_sales
    GROUP BY sub_category
),

ranked_subcategories AS (
    SELECT
        sub_category,
        total_profit,
        RANK() OVER (
            ORDER BY total_profit DESC
        ) AS profit_rank
    FROM subcategory_profit
)

SELECT
    sub_category,
    ROUND(total_profit, 2) AS total_profit,
    profit_rank
FROM ranked_subcategories
WHERE profit_rank <= 5
ORDER BY profit_rank;

Query 46: Which Region Has the Highest Discount?

SELECT
    region,
    COUNT(*) AS number_of_sales,
    ROUND(AVG(discount) * 100, 2) AS average_discount_percentage,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY region
ORDER BY average_discount_percentage DESC;

Query 47: Category Performance Within Each Region

SELECT
    region,
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY region, category
ORDER BY region, total_profit DESC;

Query 48: Find the Worst 10 State/Sub-Category Combinations

SELECT
    state,
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit
FROM superstore_sales
GROUP BY state, sub_category
HAVING SUM(profit) < 0
ORDER BY total_profit ASC
LIMIT 10;

Query 49: Find High-Sales but Low-Profit Sub-Categories

SELECT
    sub_category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(
        SUM(profit) / SUM(sales) * 100,
        2
    ) AS profit_margin_percentage
FROM superstore_sales
GROUP BY sub_category
HAVING
    SUM(sales) > 100000
    AND SUM(profit) / SUM(sales) < 0.10
ORDER BY profit_margin_percentage ASC;

Query 50: Negative Profit Transactions

SELECT
    COUNT(*) AS loss_making_transactions,
    ROUND(SUM(sales), 2) AS sales_from_loss_transactions,
    ROUND(SUM(profit), 2) AS total_loss
FROM superstore_sales
WHERE profit < 0;



