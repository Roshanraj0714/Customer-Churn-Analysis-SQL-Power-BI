CREATE TABLE customers1(
    customerID VARCHAR(50) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(10),
    Dependents VARCHAR(10),
    tenure INT,
    PhoneService VARCHAR(10),
    MultipleLines VARCHAR(20),
    InternetService VARCHAR(20),
    OnlineSecurity VARCHAR(20),
    OnlineBackup VARCHAR(20),
    DeviceProtection VARCHAR(20),
    TechSupport VARCHAR(20),
    StreamingTV VARCHAR(20),
    StreamingMovies VARCHAR(20),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(10),
    PaymentMethod VARCHAR(50),
    MonthlyCharges NUMERIC,
    TotalCharges VARCHAR(50),
    Churn VARCHAR(10)
);

UPDATE customers1
SET TotalCharges = NULL
WHERE TRIM(TotalCharges) = '';

ALTER TABLE customers1
ALTER COLUMN TotalCharges TYPE NUMERIC(10,2)
USING TotalCharges::NUMERIC;

SELECT * FROM customers1;

SELECT * FROM customers1 LIMIT 10;

--Query 1 — Total Customers

	SELECT COUNT(*) FROM customers1;
--INSIGHT:The dataset contains 7043 customers.

--Query 2 — Churn Count

	SELECT Churn, COUNT(*)
	FROM customers1
	GROUP BY Churn;
/*INSIGHT:1869 customers have churned,
while 5174 customers stayed with the company.*/

--QUERY 3 — Churn Percentage

	SELECT 
	ROUND(
	COUNT(CASE WHEN Churn='Yes' THEN 1 END)*100.0/COUNT(*),
	2
	) AS churn_rate
	FROM customers1;
/*INSIGHT:The company has a churn rate of 26.54%, 
indicating that a significant number of customers are leaving the company.*/

--QUERY 4 — Contract Type Analysis

	SELECT Contract,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
	FROM customers1
	GROUP BY Contract
	ORDER BY churned_customers DESC;
/* INSIGHT:Customers with month-to-month contracts have the highest churn rate,
while customers with long-term contracts are more loyal.*/

--QUERY 5 — Payment Method Analysis

	SELECT PaymentMethod,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
	FROM customers1
	GROUP BY PaymentMethod
	ORDER BY churned_customers DESC;
--INSIGHT:Customers using electronic check payment methods show higher churn behavior compared to other payment methods.

--QUERY 6 — Internet Service Analysis

	SELECT InternetService,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
	FROM customers1
	GROUP BY InternetService;
--INSIGHT:Customers using fiber optic internet services are more likely to churn than DSL users.

--QUERY 7 — Revenue Analysis

	SELECT 
	ROUND(SUM(MonthlyCharges),2) AS total_revenue
	FROM customers1;
--INSIGHT:The company generates significant monthly revenue from its customers.

--QUERY 8 — Revenue Loss Due to Churn

	SELECT 
	ROUND(SUM(MonthlyCharges),2) AS revenue_loss
	FROM customers1
	WHERE Churn='Yes';
--INSIGHT:Customer churn is causing a major revenue loss to the company.

--QUERY 9 — High Risk Customers

	SELECT customerID,
	tenure,
	MonthlyCharges,
	Contract
	FROM customers1
	WHERE tenure < 6
	AND MonthlyCharges > 70
	AND Churn='Yes';
--INSIGHT: New customers with high monthly charges are more likely to leave the company early.

--QUERY 10 — Customer Ranking

SELECT customerID,
MonthlyCharges,
RANK() OVER(ORDER BY MonthlyCharges DESC) AS customer_rank
FROM customers1;
--INSIGHT:Ranking functions help identify high-value customers based on monthly charges.

--QUERY 11 — Average Monthly Charges by Contract

	SELECT Contract,
	ROUND(AVG(MonthlyCharges),2) AS avg_monthly_charge
	FROM customers1
	GROUP BY Contract;
--INSIGHT:Month-to-month customers tend to have higher average monthly charges.

--QUERY 12 — Top 10 Highest Paying Customers

	SELECT customerID,
	MonthlyCharges
	FROM customers1
	ORDER BY MonthlyCharges DESC
	LIMIT 10;
--INSIGHT:The company’s highest-paying customers contribute significantly to revenue.

--QUERY 13 — Senior Citizen Churn Analysis

	SELECT SeniorCitizen,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END) AS churned_customers
	FROM customers1
	GROUP BY SeniorCitizen;
--INSIGHT:Senior citizens show different churn behavior compared to non-senior customers.

--QUERY 14 — Window Function

	SELECT customerID,
	MonthlyCharges,
	RANK() OVER(ORDER BY MonthlyCharges DESC) AS customer_rank
	FROM customers1;
--INSIGHT:Window functions help rank customers based on spending patterns.

--QUERY 15 — Running Revenue Total

	SELECT customerID,
	MonthlyCharges,
	SUM(MonthlyCharges) OVER(ORDER BY MonthlyCharges) AS running_total
	FROM customers1;
--INSIGHT:Running totals help analyze cumulative revenue growth across customers.

--QUERY 16 — CTE

	WITH churn_customers1 AS (
	    SELECT customerID,
	           MonthlyCharges
	    FROM customers1
	    WHERE Churn='Yes'
	)
	SELECT AVG(MonthlyCharges) AS avg_churn_charge
	FROM churn_customers1;
--INSIGHT:CTEs improve query readability and simplify complex analysis.

--QUERY 17 — Subquery

	SELECT customerID,
	MonthlyCharges
	FROM customers1
	WHERE MonthlyCharges > (
	    SELECT AVG(MonthlyCharges)
	    FROM customers1
	);
--INSIGHT:Some customers pay above-average monthly charges, making them valuable to the business.

--QUERY 18 — Churn Rate by Internet Service

	SELECT InternetService,
	ROUND(
	SUM(CASE WHEN Churn='Yes' THEN 1 ELSE 0 END)*100.0/COUNT(*),
	2
	) AS churn_percentage
	FROM customers1
	GROUP BY InternetService;
--INSIGHT:Fiber optic customers have a higher churn percentage compared to DSL users.