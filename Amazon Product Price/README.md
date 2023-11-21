# Amazon Products Sales Dataset 2023

## Project Overview

This data analysis project aims to provide insights into Amazon Product Price Sales in 2023.  We'll be analyzing what price range is the most common on Amazon.  Furthermore, We'll look deeper into different brands and categories based on the rating and number of ratings, as well as figure out if the discount % helps with the overall rating of the product. 

## Data Sources

Amazon Product Sales: I used the amazon data files from Kaggle: https://www.kaggle.com/datasets/lokeshparab/amazon-products-dataset/data

## Tools

- Python - Pandas, Data Cleaning, Data Analysis, Data Visualization

## Steps for this Project

### 1. Retriving the files
- Import the python packages such as pandas, numpy, seaborn, matplotlib.pyplot, glob, etc.
- Collect files from Kaggles
- Merging all the files into one dataframe
### 2. Data Cleaning/Adding Columns
- Handling missing values
- Remove duplicates
- Taking out rupees money signs, convert string to int, and convert rupees to US dollar
- Adding the discount % off column
- Adding a new column that takes the difference of the actual price and discount price
- Add a new colum of the brand of the product.
### 3. Exploratory Data Analysis/Data Analysis/Data Visualization
- EDA involing exploring the amazon sales and answer question like, what are the top 5 most expensive item listed on Amazon?, most common price range listed?, popular brands?, etc.
- After answering these questions, most of the questions will be presented in Visualization format (Matplotlib.pyplot, iplot, and Seaborn)
### 4. Insights and Conclusion
After I finished analyzing and visualizing the dataset, I gave my insight on the results of the analysis that seemed important and answered the questions from the objective.

### Hope you enjoy reading my project
