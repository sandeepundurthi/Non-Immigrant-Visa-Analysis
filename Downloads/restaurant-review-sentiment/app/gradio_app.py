import gradio as gr
import pickle
import re

# Load model and vectorizer
with open("models/sentiment_model.pkl", "rb") as f:
    model, vectorizer = pickle.load(f)

def clean_text(text):
    text = text.lower()
    text = re.sub(r'[^a-z\s]', '', text)
    tokens = text.split()
    stopwords = {'the','a','an','and','or','in','on','at','of','this','is','to','with','for','it','was','we','had'}
    tokens = [t for t in tokens if t not in stopwords]
    return " ".join(tokens)

def predict_sentiment(text):
    cleaned = clean_text(text)
    vect = vectorizer.transform([cleaned])
    pred = model.predict(vect)[0]
    return "✅ Positive Review" if pred == 1 else "❌ Negative Review"

iface = gr.Interface(
    fn=predict_sentiment,
    inputs=gr.Textbox(lines=4, placeholder="Enter restaurant review..."),
    outputs="text",
    title="🍽️ Restaurant Review Sentiment Analyzer",
    description="Enter a restaurant review and get sentiment prediction (positive or negative)."
)

if __name__ == "__main__":
    iface.launch()