-- selecting relevant columns from the raw data table

-- loading raw data from the database using the source
with raw_data as (
    select * from {{ source('visa_project', 'raw_data') }}
)

-- selecting the required columns for the analysis
select 
    "CASE_NUMBER",
    "CASE_STATUS",
    "REFILE",
    "EMPLOYER_NAME",
    "EMPLOYER_STATE_PROVINCE",
    "NAICS_CODE",
    "MINIMUM_EDUCATION",
    "MAJOR_FIELD_OF_STUDY",
    "REQUIRED_TRAINING",
    "PW_WAGE",
    "REQUIRED_TRAINING_MONTHS",
    "REQUIRED_EXPERIENCE",
    "REQUIRED_EXPERIENCE_MONTHS",
    "COUNTRY_OF_CITIZENSHIP",
    "FOREIGN_WORKER_INFO_MAJOR",
    "FOREIGN_WORKER_CURR_EMPLOYED",
    "EMPLOYER_YEAR_COMMENCED_BUSINESS",
    "EMPLOYER_NUM_EMPLOYEES"
from raw_data
