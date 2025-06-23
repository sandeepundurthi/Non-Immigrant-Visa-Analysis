# 🍽️ Restaurant Review Sentiment Analysis

This project performs sentiment analysis on restaurant reviews using Natural Language Processing (NLP) and multiple machine learning models. The best-performing model (SVM with 96% accuracy) is deployed using a Gradio web app for real-time predictions.

## 🧠 Features
- TF-IDF vectorization for text feature extraction
- Multiple ML models: Naive Bayes, Logistic Regression, SVM, Random Forest
- Model evaluation and comparison
- Lightweight Gradio web app for demo
- Clean folder structure for reproducibility

## 📁 Folder Structure

restaurant-review-sentiment/
├── data/                      # Raw dataset (CSV)
├── models/                   # Saved ML model and vectorizer
│   └── sentiment_model.pkl
├── notebook/                 # Training and evaluation notebook
│   └── sentiment_analysis.ipynb
├── app/
│   └── gradio_app.py         # Gradio interface
├── requirements.txt
└── README.md

## 🚀 Run Locally

```bash
git clone https://github.com/yourusername/restaurant-review-sentiment.git
cd restaurant-review-sentiment
pip install -r requirements.txt
python app/gradio_app.py
```

## 📊 Accuracy Results

| Model               | Accuracy |
|--------------------|----------|
| Naive Bayes        | 87.4%    |
| Logistic Regression| 92.0%    |
| SVM (selected)     | ⭐ 96.0% |
| Random Forest      | 91.7%    |