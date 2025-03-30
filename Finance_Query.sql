use bank_analytics;
ALTER TABLE finance RENAME COLUMN ï»¿id to id;

-- KPI 1 --

SELECT Issued_Year, Loan_Status, SUM(loan_amnt) AS Loan_Amount 
FROM finance
GROUP BY issued_year, loan_status
ORDER BY issued_year;

-- KPI 2 --

SELECT Grade, Sub_Grade, SUM(revol_bal) AS Revol_Bal 
FROM finance
GROUP BY grade, sub_grade 
ORDER BY grade;

-- KPI 3 --

SELECT Verification_Status, ROUND(SUM(total_pymnt),2) AS Total_Payment
FROM finance 
WHERE verification_status IN ("Verified", "Not Verified")
GROUP BY verification_status;

-- KPI 4 --

SELECT addr_state AS State, issued_month AS Month, loan_status
FROM finance;

-- KPI 5 -- 

SELECT home_ownership, last_payment_year AS payment_year, ROUND(SUM(last_payment_amount),2) AS Payment_Amount
FROM finance
WHERE last_payment_year NOT IN ("1900") AND home_ownership NOT IN ("NONE")
GROUP BY home_ownership, last_payment_year
ORDER BY home_ownership, last_payment_year;