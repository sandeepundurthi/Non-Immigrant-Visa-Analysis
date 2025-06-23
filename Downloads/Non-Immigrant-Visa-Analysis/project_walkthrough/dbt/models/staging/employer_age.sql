-- calculating employer age based on the year of establishment

-- loading data from the education encoding model
with encoded_data as (
    select * from {{ ref('education_encoding') }}
)

-- calculating employer age as difference from 2024
select
    *,
    (2024 - "EMPLOYER_YEAR_COMMENCED_BUSINESS") as employer_age
from encoded_data
