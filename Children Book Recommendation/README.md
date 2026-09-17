# Book Genie: A Children's Book Recommendation System

**Developed for the CSE 6242 course during my M.S. in Analytics program at the Georgia Institute of Technology, alongside Daniel Barrale, Mari Villalta, Lemlem Zikarge, and Valeria Lara.**

## Table of Contents
- [📌 Problem Definition](#problem)
- [🚀 Proposed Methodology & Data Pipeline](#methodology)
- [🧠 Machine Learning Models](#models)
- [💻 Interactive Dashboard & UI](#dashboard)
- [📊 Evaluation & Results](#evaluation)
- [🔮 Limitations & Future Work](#limitations)

## <a id="problem"></a>📌 Problem Definition

## 📌 Problem Definition
Despite reading comprehension being foundational to future success, approximately 40% of students in the US cannot read at a basic level. While there are many book recommendation systems available, they present two major flaws when applied to younger audiences:
* Most applications are geared toward adults and lack features that accurately address a child's reading capabilities.
* Existing recommendation models rely heavily on storing and analyzing historical user data, which introduces significant privacy concerns for children's applications.

To address this, we built **Book Genie**, a privacy-first recommendation system that uses metadata, sentiment analysis, and Flesch-Kincaid metrics to suggest books matching a child's reading level and interests without storing user data. 

---

## 🚀 Proposed Methodology & Data Pipeline
Our approach bypasses the cold-start problem and data dependency limitations of traditional collaborative filtering by utilizing content-based similarity and natural language processing.

* **Data Sourcing:** We aggregated three compressed JSON datasets containing user reviews and book characteristics (like length and description) under the Children genre from the UCSD McAuley Lab Goodreads data.
* **Natural Language Processing & Sentiment Analysis:** After cleaning the text, we performed NLP on the review descriptions. We calculated a compound sentiment score for each review and aggregated these to the book level to provide an average sentiment score.
* **Readability Engineering:** To determine text difficulty, we calculated Flesch-Kincaid Grade Level and Reading Ease metrics. Because standard readability formulas often overestimate levels based on the sophisticated "selling" language used in book descriptions, we implemented a mathematical recalibration function. This function mapped raw scores back to realistic target audiences ranging from Kindergarten to High School.
* **Popularity Scoring:** We calculated a Bayesian style popularity score to penalize books with a low "ratings_count," pulling them toward the global mean to prevent obscure books from falsely appearing at the top of recommendations. We also performed a log transformation on the text reviews count to address right-skewedness.

---

## 🧠 Machine Learning Models
To predict book difficulty and categorize textual themes, we leveraged both classification and clustering algorithms.

* **Difficulty Prediction Models:** 
  * We initially trained a Logistic Regression baseline model to predict difficulty by learning weighted feature contributions. The linear scores for each class were converted into probabilities using the softmax function, taking the highest predicted probability as the final difficulty prediction. 
  * To achieve stronger predictive performance, we trained a Random Forest ensemble model utilizing Randomized SearchCV for hyperparameter tuning to find the most accurate tree depths and estimators.
* **Thematic Clustering:** 
  * After removing stop words, we applied Term Frequency-Inverse Document Frequency (TF-IDF) to evaluate word frequency across book descriptions. 
  * Using K-means clustering, we discovered five hidden themes: Adventure & Story, Fairy Tales & Magic, Classic Picture Books, School & Friends, and Bears & Holiday. 
  * We applied Principal Component Analysis (PCA) to compress high-dimensional text data into two coordinates for 2D visualization.
* **Four-Tier Scoring Algorithm:** Recommendations are generated using a blend of content similarity (60%), popularity (15%), sentiment match (10%), and school match (15%). We utilized a linear kernel to compute content similarity based on titles and descriptions.

---

## 💻 Interactive Dashboard & UI
Book Genie features an intentionally child-friendly design utilizing bright colors, playful elements, and large clickable areas to accommodate developing motor skills.

* **Dynamic Filtering:** Users can filter by popularity, reading level, and theme, or query specific keywords using the search bar. 
* **Recommendation Interface:** The main table displays the title, description, grade level, difficulty, popularity, and an interactive Match Score. The Match Score dynamically recalculates in real-time as users adjust filter parameters like the 1-8 reading ease scale or review counts.
* **Visualizations:** Clicking on a book populates a horizontal bar chart comparing its reading ease against others in its theme, as well as a scatter plot plotting the book by average rating and reading ease. 

---

## 📊 Evaluation & Results
Both models were trained using an 80/20 data split. 
* **Model Accuracy:** The Logistic Regression model achieved 96% accuracy, slightly outperforming the Random Forest model which reached 95% accuracy. 
* **Retrieval Metrics:** Evaluated against 400 sample books, the model proved highly accurate at ranking relevant books, achieving a Precision@10 of 0.956 and an NDCG@10 of 0.952.
* **User Testing:** An 11-person user study rated the application favorably, scoring 3.91 out of 5 for engagement and 3.82 out of 5 for interface intuitiveness. Qualitative feedback praised the Match Score feature but suggested further simplifying the charts for younger audiences.

---

## 🔮 Limitations & Future Work
Because the current readability scores rely on book descriptions rather than actual story text, they cannot detect thematic maturity or account for sophisticated blurbs written by adults. Future iterations will focus on full-text analysis and longitudinal studies to better understand the long-term impact on reading engagement.
