CREATE DATABASE bank_loan;
USE bank_loan;

SELECT * FROM bank_loan_sql;

-- (1) Year Wise Loan Amount Stats

SELECT Issued_Year, Sum(Loan_Amnt) AS Total_Loan_Amnt
FROM bank_loan_sql
GROUP BY Issued_Year
Order BY 1;
    
--  (2) Grade and Sub Grade Wise Revol_Bal
SELECT Grade, Sub_Grade, SUM(Revol_Bal) AS Total_Revol_Bal
FROM bank_loan_sql
GROUP BY Grade, Sub_Grade
ORDER BY Grade;
    
-- (3) Total Payment for Verified Status Vs Total Payment for Non Verified Status
SELECT Verification_Status, SUM(Total_Payment) AS Total_Payment_Amount
FROM bank_loan_sql
WHERE Verification_Status IN ('Verified', 'Not Verified')
GROUP BY 1;

-- (4) State wise and last_credit_pull_d wise loan status

SELECT Addr_State,
Last_Credit_Pull_D,
Loan_Status
FROM bank_loan_sql
ORDER BY Addr_State,Loan_Status,Last_Credit_Pull_D;


-- (5) Home ownership Vs last payment date stats
SELECT 
    Home_Ownership, Last_pymnt_D
FROM bank_loan_sql
GROUP BY Home_Ownership, Last_pymnt_D
ORDER BY  Home_Ownership, Last_pymnt_D DESC;


