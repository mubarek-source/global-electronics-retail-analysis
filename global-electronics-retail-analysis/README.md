# Global Electronics Retail Analysis

SQL and Excel analysis of 62,884 retail records covering sales channels, seasonal demand, and delivery performance.

![Dashboard](screenshots/dashboard.png)
<img width="932" height="521" alt="Dashboard" src="https://github.com/user-attachments/assets/de89c22d-8e0c-46af-af8c-4a3629faa3ec" />

## About this project

I was new to SQL when I started this, so I used this project to learn it by doing something real. I took a retail dataset, wrote SQL queries to answer a handful of business questions, and then built an Excel dashboard to show the results.

The data is the Global Electronics Retailer dataset from the Maven Analytics Data Playground (public domain). It's sales data for a fictitious electronics company, so none of it is real business data. It covers orders from January 2016 to February 2021 and has customers, products, stores, and sales (62,884 rows in the sales table).

Source: https://mavenanalytics.io/data-playground/global-electronics-retailer

## Questions I wanted to answer

These are the suggested analysis questions that come with the dataset.

1. Where are our customers, and what do we sell?
2. How do orders and revenue change over time?
3. Is delivery getting faster?
4. Do customers spend more online or in the store?

## What I found

**Customers and products**
- The United States has the most customers by a lot: 6,828 out of 15,266, about 45%. The UK is second with 1,944.
- Home Appliances (661) and Computers (606) have the most products in the catalog. Music, Movies and Audio Books has the fewest (90), followed by Audio (115). This counts products, not sales.

**Orders and revenue over time**
- Order volume drops every March and April, and April is the lowest month each year from 2016 to 2020.
- December is the highest month every year from 2016 to 2019 (for example, 1,250 orders in December 2019).
- Total revenue was $43.2M across the whole dataset. It grew every year until 2019 ($14.7M), then dropped to $7.4M in 2020. I can't tell why from this data alone.

**Delivery**
- Average delivery time for online orders dropped from about 8 days in early 2016 to about 4 days by 2019, then stayed around 4 days through early 2021.
- Only online orders have delivery dates, so this only covers online orders.

**Online vs. in-store**
- In-store made about 79% of revenue and orders: $34.27M from 20,746 orders, compared to $8.94M from 5,580 orders online.
- Average order value was a little higher in-store ($1,651.94) than online ($1,602.35), about 3% higher. I expected a bigger gap.

## Tools

- SQL (SQLite, run in DB Browser for SQLite)
- Excel (charts and dashboard)

## SQL concepts I practiced

- `GROUP BY` and aggregate functions (`COUNT`, `SUM`, `AVG`)
- `JOIN` to connect tables (sales to products for prices)
- `COUNT(DISTINCT ...)` to count each order once, since one order can have several line items
- `strftime` and `julianday` for dates
- `CASE WHEN` to label online vs. in-store orders
- Checking my totals against each other (for example, revenue by month and revenue by channel both add up to $43,212,329.17)

## Files

```
├── Dashboard.xlsx          Excel dashboard
├── sql/                    The queries
├── results/                CSV output from each query
└── screenshots/            Dashboard screenshot
```

| Query | Question |
|---|---|
| `q1_customer_geography.sql` | Customers by country |
| `q1_product_mix.sql` | Number of products by category and subcategory |
| `q2_order_volume_by_month.sql` | Orders per month |
| `q2_revenue_by_month.sql` | Revenue per month |
| `q3_delivery_by_month.sql` | Average delivery days per month (online orders) |
| `q4_aov_by_channel.sql` | Revenue, orders, and average order value by channel |

## Notes

- The data ends in February 2021, so 2021 is only two months.
- Price data was stored as text with a dollar sign, so I used a cleaned numeric price column for the revenue math.
- Online orders are identified by `StoreKey` 0 in the Stores table.
- I left out the raw customer data from this repo.
