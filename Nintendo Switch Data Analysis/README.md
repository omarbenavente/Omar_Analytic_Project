# Nintendo Switch Games Data Analysis

## Overview

This project is based on all of Nintendo Switch games that was included from the month it was released which is 2017 to September 2022. It also contain developers, publishers, votes, genres, released dates, etc. that will provide intriguing insights about nintendo switch. For this project, I used Microsoft excel to do all of the Data Visualizations. This project will show my data cleaning pivot table and data visualization skills in excel.

You can see the dashboard in the excel file called "nintendo - switch-games.xslx"

# Data Source

Nintendo Switch Games Review: I used the data from Kaggle: https://www.kaggle.com/datasets/giovanni60310/nintendo-switch-games-reviews

## Tools
- Excel: Data Cleaning with Power Query, Pivot Tables, Data Visualization

## Steps for this Project

### 1. Gather and Clean the file
- Download the file from kaggle.
- Clean the data with Power Query. Converting "Release Date" from string to date by removing the extra string that will prevent it to be converted to date.
- Removing the extra space in the review columns since excel counts it as a string, not an integer. After removing the blank spaces, the column can be converted to numbers.
- All the null values from the publishers and developers, I replaced then with "Unknown"
- load the update file in power query.
- removing columns that is unnecesary or won't provide any useful information.

### 2. Data Visualization
- Insert pivot tables
- Performed a released date frequency. Ex: any patterns on which month has been released throughout every year?
- Publisher and Developers analysis
- Game popularity and best ratings
