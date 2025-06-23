# Non - Immigrant Visa Analysis and End-to-End H-1B Visa prediction using dbt (Data Build Tool) and Python 

For an interactive insight on Non Immigrant Visa Issuances, visit [My Tableau Profile](https://public.tableau.com/views/US-NonImmigrantVisas/NonImmigrantVisaIssuancesByNationality-FY24?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link) . 

This repository contains all the work and experiments carried out to build a robust prediction model, The [Gateway to Opportunity PDF](./Gateway_to_Opportunity__An_Overview_of_Non_Immigrant_Visas.pdf)
file contains the details about the experiments.**All folders and files outside of the `project_walkthrough` folder are part of the initial experiments conducted to decide on a suitable classification method.** If you are interested in the actual workflow and final implementation, please refer to the `project_walkthrough` folder.

## Project Walkthrough Folder Structure
The `project_walkthrough` folder contains the finalized workflow, organized in the following structure:

### Root Files
- **directory_structure.txt**: Contains a detailed structure of the project.

### Data Folder
- **perm_23_q4.xlsx**: The raw dataset used for data processing and transformation.

### DBT Folder
The DBT folder contains the configurations and SQL models used for data transformations.

#### Subfolders:
- **analyses**: Contains analysis scripts (currently empty).
- **logs**: Logs generated during the dbt runs.
- **macros**: Contains reusable macros for data transformations.
- **models**: SQL models for staging and transforming the data.
  - **staging**: Intermediate transformations.
    - **binning.sql**: Binning data.
    - **education_encoding.sql**: Encoding educational information.
    - **employer_age.sql**: Calculating employer age.
    - **feature_selection.sql**: Selecting relevant features.
  - **transforming**: Final transformations.
    - **convert_yes_no.sql**: Converts binary columns from yes/no to 1/0.
    - **dim_transformed.sql**: Combines binning and transformed data.
    - **target_class.sql**: Defines the target class for classification.
- **seeds**: Contains seed files for dbt (currently empty).
- **snapshots**: Used for capturing data at a specific point in time (currently empty).
- **target**: Stores compiled models and artifacts generated after dbt runs.
- **tests**: Contains test cases for validating dbt transformations.

### Logs Folder
- **dbt.log**: Logs from dbt runs for debugging and monitoring.

### Notebooks Folder
- **EDA_transformation.ipynb**: Exploratory data analysis and initial transformations.
- **prediction.ipynb**: Predictive analysis and model evaluation.

### Scripts Folder
- **load_xlsx_to_postgres.py**: Script to load data from Excel to PostgreSQL.
- **state_country_transform.ipynb**: Additional transformations for state and country data.



### Classification Results and Insights

The classification model was trained using **SMOTE sampling** to handle class imbalance and a **Random Forest Classifier** for prediction. The model was evaluated using precision, recall, and F1-score metrics. Here are the key takeaways:

#### Classification Report (SMOTE + Random Forest)


| Metric       | Class 0 | Class 1 | Accuracy | Macro Avg | Weighted Avg |
|-------------|--------|--------|---------|----------|--------------|
| Precision   | 0.93   | 0.96   |         | 0.95     | 0.95         |
| Recall      | **0.96**   | 0.93  |         | 0.95    | 0.95        |
| F1-Score    | 0.95   | 0.95  |         | 0.95     | 0.95         |
| Support     | 18514  | 18631  | 37145   | 37145    | 37145        |

**Accuracy:** 95%


1. **High Accuracy:**  
   - The model achieved an accuracy of **97.48%**, indicating that it correctly classified the majority of instances.

2. **Balanced Performance Across Classes:**  
   - Both classes (0 and 1) demonstrated similarly high performance metrics:
     - **Class 0:** Precision = 0.93, Recall = 0.96, F1-score = 0.95 
     - **Class 1:** Precision = 0.96, Recall = 0.93, F1-score = 0.95  
   - This balanced performance suggests that the model does not favor one class over the other, indicating that SMOTE sampling effectively addressed the class imbalance.

3. **Macro and Weighted Averages:**  
   - Both the **macro average** and **weighted average** of precision, recall, and F1-score are 0.97, confirming consistent performance across classes. 

4. **Generalization and Robustness:**  
   - The high accuracy and balanced metrics indicate that the model generalizes well to new data without significant bias towards any particular class.  

In summary, the combination of SMOTE sampling and the Random Forest Classifier resulted in a robust model with high accuracy and balanced classification performance.


## To carry out the same project, 
1. Clone the repository and navigate to the project_walkthrough folder.
2. Load the data using the `load_xlsx_to_postgres.py` script.
3. Run the dbt models to perform data transformations.
4. Open the notebooks for EDA and predictions.

For any questions or further clarifications, improvements and contributions, feel free to reach out!

