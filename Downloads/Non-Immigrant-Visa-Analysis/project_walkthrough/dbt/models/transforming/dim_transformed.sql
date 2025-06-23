-- loading the binning data with encoded state, country and a new column. These transformations were done using python

with transformed_data as (
    select * from {{ source('visa_project', 'state_country_encoded') }}
)

select * from transformed_data
