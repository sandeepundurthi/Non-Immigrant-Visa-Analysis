import pandas as pd
from sqlalchemy import create_engine
import time

# starting the timer
start_time = time.time()

# file paths and database connection
xlsx_file = "../data/perm_23_q4.xlsx"
db_url = "postgresql://postgres:password@localhost:5432/visa_project"
table_name = "raw_data"

# creating a sqlalchemy engine for postgresql
engine = create_engine(db_url)

try:
    # loading the entire excel file at once
    df = pd.read_excel(xlsx_file)

    # inserting the dataframe into the database
    df.to_sql(table_name, engine, if_exists="replace", index=False)
    print("data from source loaded successfully!")

except Exception as e:
    print(f"error loading data: {e}")

# printing elapsed time
print(f"data loaded successfully in {time.time() - start_time:.2f} seconds!")


