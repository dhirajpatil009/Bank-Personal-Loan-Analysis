create database bank_loan_analysis;
use bank_loan_analysis;

show databases;
show tables;

select *
from bank_customers
limit 10;

select count(*) as total_records
from bank_customers;

describe bank_customers;

select
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    count(*) - sum(`Personal Loan`) as not_accepted,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct
from bank_customers;

select
    case
        when Income <= 39 then 'Low income'
        when Income <= 64 then 'Lower-middle income'
        when Income <= 98 then 'Upper-middle income'
        else 'High income'
    end as income_segment,
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct
from bank_customers
group by
    case
        when Income <= 39 then 'Low income'
        when Income <= 64 then 'Lower-middle income'
        when Income <= 98 then 'Upper-middle income'
        else 'High income'
    end
order by acceptance_rate_pct desc;

select
    Education,
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct
from bank_customers
group by Education
order by Education;


select
    `CD Account`,
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct
from bank_customers
group by `CD Account`;


select
    Family,
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct
from bank_customers
group by Family
order by acceptance_rate_pct desc;


create view loan_acceptance_summary as
select
    count(*) as total_customers,
    sum(`Personal Loan`) as accepted_customers,
    round(avg(`Personal Loan`) * 100, 2)
        as acceptance_rate_pct,
    round(avg(Income), 2) as average_income,
    round(avg(CCAvg), 2) as average_cc_spending
from bank_customers;

select * from loan_acceptance_summary;
