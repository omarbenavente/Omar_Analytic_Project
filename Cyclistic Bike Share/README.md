# Cyclist Data Project

## Project Overview
The Goal for this project is to provide insights on the usage of bicycles when it comes to time, location, members or types of bikes. This takes place in the city of Chicago. I use programming languages such as Python and PostgreSQL as wel as data visualization tools such as Tableau. This project shows my proficient skills such as data analytics, data visualization, and technical skills.  
# Data Source
Cyclistic Bike Share: I use the cyclistic data from Kaggle:
https://www.kaggle.com/datasets/evangower/cyclistic-bike-share

## Tools
- Python - Pandas, Gathering files, Data Cleaning
- SQL - Create tables, little more Data cleaning, Data Analysis
- Tableau - Data Visualization

## Steps for this project:
### 1. Gathering and Cleaning Files using Python:
- Dealing with missing values
- converting columns to its datatype
- removing rows on which the start time column is later than the end time column
- adding new row of day, day of week, month, and year
- export the data to csv in order to transport it to SQL

### 2. SQL: more editing and Data Analysis
I use PostgreSQL as my database type
- Creating a table called cyclist_data, then importing the csv file created from Python
- Created a new table called cyclist by using all the data from cyclist_data plus a new column with the length (in minutes) of the difference from the start time and end time
- filtering out the data with the length of the bike ride is more than 1 minute, to make sure we want data for bikers who actually biked.
- Asking and answering 10 questions (Data Analysis)
- export the data to csv so we can visualize it with tableau

### 3. Tableau: Data Visualization
- Importing the csv file from PostgrSQL
- Make some Graph, then creating dashboard 
