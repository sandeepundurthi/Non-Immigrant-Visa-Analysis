# Gateway to Opportunity: Non-Immigrant Visa Analysis & H-1B Prediction 🇺🇸

This project explores patterns in F1 (student) and H-1B (employment) visa applications, and builds a machine learning model to predict the outcome of an H-1B visa application based on demographic, educational, and employer data.

## 📌 Project Goals
- Analyze trends in F1 and H-1B visa issuance.
- Identify key features affecting H-1B visa decisions.
- Predict visa application outcomes using a Random Forest classifier.
- Address dataset imbalance using advanced resampling techniques like SMOTE.

## 📊 Dataset Overview
- 116,000+ H-1B visa records, 150+ features
- Sources: [travel.state.gov](https://travel.state.gov/), [US Dept. of Labor](https://www.dol.gov/), [US News](https://www.usnews.com/)
- Features include:
  - Employer info (state, size, year)
  - Candidate demographics (education, major, country)
  - Job-specific data (required experience, wage)

## 🧹 Data Preprocessing
- Reduced feature space from 150+ to ~18 relevant attributes
- Imputation, fuzzy string matching (via `fuzzywuzzy`), and binning of wages/employees
- One-hot encoding for state and country
- Engineered `MAJOR_MATCH` feature to compare job vs. candidate major

## ⚖️ Handling Class Imbalance
- Binary classification:
  - Certified (0)
  - Denied (1)
- Experiments with:
  - Upsampling, downsampling
  - Balanced Random Forest
  - SMOTE & SMOTENC (best performance)

## 🧠 Modeling
- Random Forest Classifier
- 8 experimental setups comparing resampling strategies
- Final model trained on SMOTENC-balanced data

## 📈 Results

| Experiment | Method | Precision | Recall | Accuracy |
|------------|--------|-----------|--------|----------|
| 8 (Best)   | SMOTENC | 0.97 | 0.97 | 0.97 |
| 7          | Manual Balancing | 0.74 | 0.72 | 0.74 |
| 1          | Imbalanced (baseline) | 0.39 | 0.07 | 0.98 (misleading) |

## 🔮 Future Work
- Include political/geopolitical factors
- Add time-series elements (monthly approval rates)
- Model impact of employer reputation and industry changes

## 🛠️ Tech Stack
- Python, Pandas, Scikit-learn, Imbalanced-learn
- Random Forest Classifier
- SMOTENC (for categorical SMOTE)
- BeautifulSoup, FuzzyWuzzy

## 📌 Author
**Sandeep Undurthi**  
Utah State University, Department of Computer Science  
[sandy.undurthi@gmail.com](mailto:sandy.undurthi@gmail.com)
