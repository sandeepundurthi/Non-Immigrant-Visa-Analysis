-- encoding education levels to numerical values

-- loading data from the feature selection model
with selected_data as (
    select * from {{ ref('feature_selection') }}
)

-- applying encoding for education levels
select
    *,
    case 
        when "MINIMUM_EDUCATION" = 'High School' then 1
        when "MINIMUM_EDUCATION" = 'Associate''s' then 2
        when "MINIMUM_EDUCATION" = 'Other' then 3
        when "MINIMUM_EDUCATION" = 'Bachelor''s' then 4
        when "MINIMUM_EDUCATION" = 'Master''s' then 5
        when "MINIMUM_EDUCATION" = 'Doctorate' then 6
        else null
    end as education_level_encoded
from selected_data
