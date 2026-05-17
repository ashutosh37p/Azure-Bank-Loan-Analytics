-- =====================================================
-- 1. TOTAL LOAN APPLICATIONS
-- =====================================================

SELECT COUNT(loan_id) AS Total_Loan_Applications
FROM fact_loans;



-- =====================================================
-- 2. TOTAL FUNDED AMOUNT
-- =====================================================

SELECT SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans;



-- =====================================================
-- 3. TOTAL AMOUNT RECEIVED
-- =====================================================

SELECT SUM(total_payment) AS Total_Amount_Received
FROM fact_loans;



-- =====================================================
-- 4. AVERAGE INTEREST RATE
-- =====================================================

SELECT ROUND(AVG(int_rate) * 100, 2) AS Avg_Interest_Rate
FROM fact_loans;



-- =====================================================
-- 5. AVERAGE DTI
-- =====================================================

SELECT ROUND(AVG(dti) * 100, 2) AS Avg_DTI
FROM fact_loans;



-- =====================================================
-- 6. GOOD LOAN ANALYSIS
-- =====================================================

SELECT 
    COUNT(CASE 
        WHEN loan_status IN ('Fully Paid', 'Current') 
        THEN loan_id 
    END) * 100.0 / COUNT(*) AS Good_Loan_Percentage
FROM fact_loans;



-- =====================================================
-- 7. BAD LOAN ANALYSIS
-- =====================================================

SELECT 
    COUNT(CASE 
        WHEN loan_status = 'Charged Off' 
        THEN loan_id 
    END) * 100.0 / COUNT(*) AS Bad_Loan_Percentage
FROM fact_loans;



-- =====================================================
-- 8. STATE-WISE LOAN ANALYSIS
-- =====================================================

SELECT 
    dc.address_state,
    COUNT(fl.loan_id) AS Total_Loans,
    SUM(fl.loan_amount) AS Total_Funded
FROM fact_loans fl
JOIN dim_customers dc
    ON fl.customer_id = dc.customer_id
GROUP BY dc.address_state
ORDER BY Total_Funded DESC;



-- =====================================================
-- 9. GRADE-WISE LOAN ANALYSIS
-- =====================================================

SELECT 
    dg.grade,
    COUNT(fl.loan_id) AS Total_Loans,
    SUM(fl.loan_amount) AS Total_Funded,
    SUM(fl.total_payment) AS Total_Received
FROM fact_loans fl
JOIN dim_grade dg
    ON fl.sub_grade = dg.sub_grade
GROUP BY dg.grade
ORDER BY Total_Funded DESC;



-- =====================================================
-- 10. MONTHLY TREND ANALYSIS
-- =====================================================

SELECT 
    MONTH(issue_date) AS Month_Number,
    DATENAME(MONTH, issue_date) AS Month_Name,
    COUNT(loan_id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans
GROUP BY 
    MONTH(issue_date),
    DATENAME(MONTH, issue_date)
ORDER BY Month_Number;



-- =====================================================
-- 11. EMPLOYEE LENGTH ANALYSIS
-- =====================================================

SELECT 
    emp_length,
    COUNT(loan_id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans
GROUP BY emp_length
ORDER BY Total_Funded_Amount DESC;



-- =====================================================
-- 12. LOAN TERM ANALYSIS
-- =====================================================

SELECT 
    term,
    COUNT(loan_id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans
GROUP BY term;



-- =====================================================
-- 13. PURPOSE ANALYSIS
-- =====================================================

SELECT 
    purpose,
    COUNT(loan_id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans
GROUP BY purpose
ORDER BY Total_Funded_Amount DESC;



-- =====================================================
-- 14. HOME OWNERSHIP ANALYSIS
-- =====================================================

SELECT 
    home_ownership,
    COUNT(loan_id) AS Total_Applications,
    SUM(loan_amount) AS Total_Funded_Amount
FROM fact_loans
GROUP BY home_ownership;


-- =====================================================
-- 15. Windows Function-Rank States by Funded Amount
-- =====================================================


SELECT 
    dc.address_state,
    SUM(fl.loan_amount) AS Total_Funded_Amount,

    RANK() OVER(
        ORDER BY SUM(fl.loan_amount) DESC
    ) AS State_Rank

FROM fact_loans fl
JOIN dim_customers dc
    ON fl.customer_id = dc.customer_id

GROUP BY dc.address_state;