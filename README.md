# Customer-Churn-Analysis-SQL-Power-BI
# 📊 Customer Churn Analysis Dashboard

## 🔍 Project Overview
The Customer Churn Analysis Dashboard is a data analytics project developed to analyze customer behavior and identify the major factors responsible for customer churn in a telecom company.

The project uses PostgreSQL for data analysis and Power BI for data visualization. The main objective of this project is to help businesses understand why customers leave their services and how revenue loss can be reduced through data-driven insights.

---

# 🎯 Business Problem
Customer churn is one of the biggest challenges for telecom companies because losing customers directly impacts revenue and business growth.

This project focuses on:
- Identifying high-risk customers
- Analyzing churn patterns
- Understanding customer behavior
- Measuring revenue loss caused by churn

---

# 🛠️ Tools & Technologies Used

| Tool | Purpose |
|------|----------|
| PostgreSQL | Data Cleaning & SQL Analysis |
| pgAdmin 4 | Database Management |
| Power BI | Interactive Dashboard & Visualization |

---

# 📂 Dataset Information

Dataset Name:
```text
customer_churn_dataset.csv
```

The dataset contains telecom customer information such as:
- Customer demographics
- Internet services
- Contract types
- Payment methods
- Monthly charges
- Customer churn status

Total Records:
```text
7043 Customers
```

---

# 🧹 Data Cleaning Process

The following data cleaning steps were performed using PostgreSQL:

- Removed blank values from `TotalCharges`
- Converted `TotalCharges` from TEXT to NUMERIC
- Checked null values and inconsistencies
- Validated data types


# 📊 Dashboard Features

The Power BI dashboard includes:

## ✅ KPI Cards
- Total Customers
- Churn Customers
- Churn Rate
- Revenue Loss

## ✅ Interactive Filters
- Internet Service
- Contract Type
- Gender

## ✅ Visual Analysis
- Churn by Contract Type
- Payment Method Distribution
- Internet Service Churn
- High-Risk Customers Analysis
- Churn by Tenure Group

---

# 📈 Key Insights

### 🔹 Month-to-Month Customers Have Highest Churn
Customers using month-to-month contracts are more likely to leave the company compared to yearly contract customers.

### 🔹 High Monthly Charges Increase Churn Risk
Customers with higher monthly charges show a greater probability of churn.

### 🔹 Electronic Check Users Show Higher Churn
Customers using electronic check payment methods have a higher churn rate.

### 🔹 New Customers Churn More Frequently
Customers with lower tenure (0–12 months) show significantly higher churn behavior, indicating early-stage retention issues.

---

# 🧠 SQL Concepts Used

The project demonstrates multiple SQL concepts including:

- SELECT Statements
- GROUP BY
- ORDER BY
- CASE WHEN
- Aggregate Functions
- Window Functions
- Data Cleaning
- Filtering & Sorting

---

# 📷 Dashboard Preview

![Dashboard](https://github.com/Roshanraj0714/Customer-Churn-Analysis-SQL-Power-BI/blob/main/Customer_Churn_Dashboard.png)

---

# 🚀 Project Outcome

This project helps businesses:
- Identify churn-prone customers
- Improve customer retention strategies
- Reduce revenue loss
- Make better business decisions using data analytics

---

📂 Files in Repository

Customer_Churn.pbix → Power BI project file.

Customer_Churn_Analysis.sql → SQL queries used for data cleaning, customer churn analysis, revenue analysis, and business insights generation.

Amazon-Sales.png → Dashboard snapshot for quick view.

Customer_Churn_Dataset.csv → Customer_Churn_Dataset.csv → Telecom customer churn dataset containing customer demographics, services, contract details, payment methods, monthly charges, and churn information.

README.md → Project documentation.

🔗 Live Dashboard / Report (Optional)

👉 https://app.powerbi.com/groups/me/reports/64c2d343-7ca5-4f0c-b77a-ebb9e04a27d6/69091e3d44d66e37fe21?experience=power-bi

🙌 Acknowledgement

Dataset Source: IBM Sample Data / Kaggle Telco Customer Churn Dataset

Tools: PostgreSQL, pgAdmin 4, Microsoft Excel, Microsoft Power BI, GitHub

# ⭐ Conclusion

This project demonstrates practical skills in:
- SQL
- PostgreSQL
- Data Cleaning
- Business Analysis
- Data Visualization
- Power BI Dashboard Development

It is a complete end-to-end data analytics project suitable for Data Analyst and Business Analyst portfolios.
