-- Now right click tables and import the data so the columns will automatically map onto the above.

-- Checking all the rows pulled through and the data is showing properly.
SELECT * FROM customers LIMIT 10;
SELECT COUNT(*) AS total_rows
FROM customers;

-- Spot check random data 
SELECT *
FROM customers
LIMIT 10;
SELECT *
FROM customers
ORDER BY RAND()
LIMIT 10;

-- Check for missing or broken import- if 0 rows then good no broken records
SELECT *
FROM customers
WHERE customerID IS NULL;

-- Check column completeness - all counts are equal then import is clean/ counts differ then missing data issue
SELECT 
    COUNT(customerID) AS id_count,
    COUNT(gender) AS gender_count,
    COUNT(tenure) AS tenure_count
FROM customers;


-- First Analysis: Calculate how many customers stay and leave- understand is churn a big problem in this dataset. 
SELECT churn, COUNT(*) AS total_customers
FROM customers
GROUP BY churn;

-- What % of customers are leaving? Calc churn rate
SELECT churn,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS percentage
FROM customers
GROUP BY churn;

-- Which customers are most likely to leave?
SELECT 
    contract,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate
FROM customers
GROUP BY contract;

-- Identify risky customer behavior patterns 
SELECT     paymentmethod,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY paymentmethod;

-- Tenure Analysis: group customers by how long they stayed
SELECT 
    CASE 
        WHEN tenure <= 12 THEN '0-1 year'
        WHEN tenure <= 24 THEN '1-2 years'
        WHEN tenure <= 48 THEN '2-4 years'
        ELSE '4+ years'
    END AS tenure_group,
    COUNT(*) AS customers,
    SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned
FROM customers
GROUP BY tenure_group;

-- Fliter high-risk customers - which customers most likely to churn right now- used for rentention campaigns
SELECT *
FROM customers
WHERE contract = 'Month-to-month'
  AND monthlycharges > 70
  AND tenure < 12;
  
-- Business Impact- Revenue Loss
SELECT 
    SUM(monthlycharges) AS monthly_loss
FROM customers
WHERE churn = 'Yes';