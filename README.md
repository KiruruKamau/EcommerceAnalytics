# 📊 Customer Orders & Delivery Performance Dashboard

This project simulates the work of a **Business Intelligence Analyst** tasked with helping an online retailer understand customer behavior, sales performance, and delivery efficiency using real-world transactional data.

---

## 📌 Project Overview

The goal of this project is to:
- Analyze over **100,000 rows** of e-commerce order data
- Clean and transform messy real-world datasets using **SQL Server**
- Load and visualize insights using **Power BI**

This end-to-end BI workflow moves from raw CSV files to actionable dashboards.

---

## 🧠 Key Questions Answered

- Which product categories generate the most revenue?
- Where are customers located — and what do they buy?
- Are late deliveries affecting customer satisfaction?
- Which sellers and regions have delivery delays?
- What payment methods are most used?

---

## 🛠️ Tools & Technologies

| Tool                  | Purpose                                      |
|-----------------------|----------------------------------------------|
| Microsoft SQL Server  | Data storage, cleaning, transformation       |
| Power BI              | Interactive dashboards & visualization       |
| DAX                   | Calculated fields and performance measures   |
| CSV Files             | Source datasets                              |

---

## 🧩 Data Sources

The project uses a cleaned and merged version of the following datasets:
- `customers`
- `orders`
- `order_items`
- `products`
- `product_category_translation`
- `sellers`
- `reviews`
- `payments`
- `geolocation`

Over **100,000+ records** were analyzed, cleaned, and modeled.

---

## 🧹 Data Cleaning Process (SQL Server)

Each dataset was:
- Imported from CSV into SQL Server
- Cleaned for nulls, mismatches, and outliers
- Standardized with consistent formats and column names
- Transformed into **flattened, analysis-ready tables**

Key SQL Steps:
- Created `clean_` versions of tables using `SELECT INTO`
- Dropped or filtered invalid records
- Used joins to build `customer_order_full_summary`

---

## 📈 Power BI Dashboard Features

### 🔹 Page 1: Executive Overview
- 📊 KPIs: Total Revenue, Avg Delivery Time, Avg Review Score
- 💸 Revenue by Product Category
- 🗺️ Customer Map by State
- 📈 Monthly Sales Trend  
![Executive Overview](Ecommerce%20Insights/Images/Customer%20&%20Product%20Deep%20Dive.png)

---

### 🔹 Page 2: Delivery & Satisfaction
- 🍩 Donut Chart: On-Time vs Late Orders
- 🚚 Avg Delivery Days by Seller State
- 🧮 Review Score vs Delivery Delay
- 📦 Freight Cost vs Product Price  
![Delivery & Logistics](Ecommerce%20Insights/Images/Delivery%20&%20Logistics.png)

---

### 🔹 Page 3: Customer & Product Insights
- 🏙️ Top Customer Cities by Order Count and Revenue
- 🌲 Product Category Tree Map by Revenue
- 📅 Monthly Revenue Trendline
- 📆 Category Seasonality by Month and Revenue
- 📍 Customer State vs Product Preferences  
![Customer & Product Deep Dive](Ecommerce%20Insights/Images/Customer%20&%20Product%20Deep%20Dive.png)

---

## 🔢 Key DAX Measures

```dax
Total Revenue = SUM(customer_order_full_summary[price])

Avg Delivery Days = 
AVERAGEX(
    VALUES(customer_order_full_summary[seller_id]),
    CALCULATE(AVERAGE(customer_order_full_summary[delivery_days]))
)

On Time % = 
DIVIDE(
    COUNTROWS(FILTER(customer_order_full_summary, delivery_late_by_days <= 0)),
    COUNTROWS(customer_order_full_summary)
)

🚀 How to Run This Project
Set up SQL Server and import CSVs into raw tables

Run the provided SQL scripts to clean and join data

Open the .pbix file in Power BI Desktop

Refresh to connect to your local database

Interact with the dashboard and explore insights

💡 Lessons Learned
Working with large datasets takes patience and optimized queries

Real-world data is never clean — handling NULLs, inconsistent formats, and missing relationships is essential

Power BI shines when paired with strong SQL transformation work

📬 Contact
Feel free to reach out with feedback or collaboration ideas!

Author: Timothy Kamau - KEdatalab
LinkedIn: https://www.linkedin.com/in/timothy-kamau-379133234/
Email: kedatalab@gmail.com


