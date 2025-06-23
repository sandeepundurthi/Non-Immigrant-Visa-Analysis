-- converting yes/no columns to numeric (0/1) after joining data

-- loading joined data from the previous model
with joined_data as (
    select * from {{ ref('dim_transformed') }}
)

-- converting yes/no columns to have values 0 and 1
select
    joined_data.*,
    case when joined_data."REFILE" = 'Y' then 1 else 0 end as "REFILE_NUMERIC",
    case when joined_data."REQUIRED_TRAINING" = 'Y' then 1 else 0 end as "REQUIRED_TRAINING_NUMERIC",
    case when joined_data."REQUIRED_EXPERIENCE" = 'Y' then 1 else 0 end as "REQUIRED_EXPERIENCE_NUMERIC",
    case when joined_data."FOREIGN_WORKER_CURR_EMPLOYED" = 'Y' then 1 else 0 end as "FOREIGN_WORKER_CURR_EMPLOYED_NUMERIC"
from joined_data
