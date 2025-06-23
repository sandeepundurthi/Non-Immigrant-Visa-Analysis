-- converting the target column to binary (0/1)

-- loading data from the yes/no conversion model


{{ config(materialized='table') }}


with yes_no_data as (
    select * from {{ ref('convert_yes_no') }}
)

-- creating binary target column and dropping original case status
select
    *,
    case 
        when "CASE_STATUS" = 'Denied' then 0
        else 1
    end as "TARGET"
from yes_no_data
