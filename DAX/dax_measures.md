Total Applications = COUNT(fact_loans[loan_id])

MTD Applications =
CALCULATE(
    [Total Applications],
    DATESMTD(Date_Table[Date])
)

PMTD Applications =
CALCULATE(
    [Total Applications],
    DATESMTD(
        DATEADD(Date_Table[Date],-1,MONTH)
    )
)

MoM Applications =
([MTD Applications] - [PMTD Applications])
/
[PMTD Applications]

Total Funded Amount =
SUM(fact_loans[loan_amount])

Total Amount Received =
SUM(fact_loans[total_payment])

Average Interest Rate =
AVERAGE(fact_loans[int_rate]) * 100

Average DTI =
AVERAGE(fact_loans[dti]) * 100