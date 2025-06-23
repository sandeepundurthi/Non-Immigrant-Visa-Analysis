This folder contains the following notebooks :

    1. h1b_clean_for_prediction : This notebook has all the data cleaning and preprocessing steps to prepare the data so that it can be used for a classification problem.

    2. prediction.ipynb : This notebook has the results for using a random forest classifier on unbalanced data. It also has results for using random forest classifier on unbalanced data but using important features.

    3. prediction_resample_balanced.ipynb : This notebookhas  the results for using a random forest classifier on data where minority class is upsampled to create a balanced training set.

    4. prediction_resample_balanced_2.ipynb : This notebook has the results for using a random forest classifier on data where majority class is downsampled to create a balanced training set.

    5. prediction_balanced_rf.ipynb : This notebook has the results for using a balanced random forest classifier on unbalanced data. It also has same results for a balanced random classifier trained on important features.
    
    6. prediction_smote.ipynb : This notebook has the results for using data balanced by using SMOTE technique.