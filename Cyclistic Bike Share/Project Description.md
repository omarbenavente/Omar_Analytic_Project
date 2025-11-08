# Cyclist Data Project

## Project Overview
The goal of this project is to analyze bicycle usage patterns in Chicago based on time, location, membership type, and bike type. The dataset focuses on cyclist activity within the city of Chicago. I utilized Python and PostgreSQL for data cleaning and analysis, along with Tableau for data visualization. This project demonstrates my skills in data analytics, data visualization, and technical problem-solving.

# Data Source
Cyclistic Bike Share (Kaggle): https://www.kaggle.com/datasets/godofoutcasts/cyclistic-bike-share-2023

## Tools
- Python: Pandas, Gathering files, Data Cleaning
- SQL: Create tables, little more Data cleaning, Data Analysis
- Tableau: Data Visualization

## Steps for this project:
### 1. Gathering and Cleaning Data using Python:
- Handled missing values
- Converted columns to appropriate data types
- Removed rows where the start time occurred after the end time
- Added new columns for day, day of the week, month, and year
- Exported the cleaned dataset to a CSV file for use in SQL

### 2. SQL: more editing and Data Analysis
Using PostgreSQL as the database:
- Created a table called cyclist_data and imported the cleaned CSV file
- Generated a new table called cyclist containing all data from cyclist_data, plus a new column calculating the ride duration (in minutes)
- Filtered out rides shorter than 1 minute to ensure only valid trips were included
- Performed data analysis by formulating and answering 10 key questions about the dataset
- Exported the analyzed data to a CSV file for visualization in Tableau

### 3. Tableau: Data Visualization
- Imported the final CSV file from PostgreSQL
- Created multiple charts and graphs to visualize trends and insights
- Combined visuals into an interactive dashboard

