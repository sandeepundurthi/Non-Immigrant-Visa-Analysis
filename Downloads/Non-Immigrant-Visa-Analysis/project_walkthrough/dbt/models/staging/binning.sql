-- binning wage values and categorizing company size

-- loading data from the employer age model
with feature_data as (
    select * from {{ ref('employer_age') }}
)

-- applying binning for wages and company sizes
select 
    *,
    -- binning wage values into categories
    case 
        when "PW_WAGE" <= 50000 then 0
        when "PW_WAGE" > 50000 and "PW_WAGE" <= 75000 then 1
        when "PW_WAGE" > 75000 and "PW_WAGE" <= 125000 then 2
        when "PW_WAGE" > 125000 and "PW_WAGE" <= 150000 then 3
        else 4
    end as wage_bin,

    -- categorizing company sizes based on number of employees
    case 
        when "EMPLOYER_NUM_EMPLOYEES" <= 5000 then 0
        when "EMPLOYER_NUM_EMPLOYEES" > 5000 and "EMPLOYER_NUM_EMPLOYEES" <= 25000 then 1
        when "EMPLOYER_NUM_EMPLOYEES" > 25000 and "EMPLOYER_NUM_EMPLOYEES" <= 80000 then 2
        else 3
    end as company_size
from feature_data
