# 🏡 Airbnb Data Warehouse & Analytics Dashboard

> End-to-End Business Intelligence project using **Python, Selenium, SQL
> Server, Data Warehouse, and Power BI**.

------------------------------------------------------------------------

## 📖 Project Overview

This project demonstrates a complete Business Intelligence workflow for
Airbnb listings. The project starts with data collection, continues
through data cleaning and ETL, loads the transformed data into a SQL
Server Data Warehouse using a Star Schema, and finishes with an
interactive Power BI dashboard.

## 🎯 Objectives

-   Collect Airbnb listings
-   Clean the data
-   Build ETL pipeline
-   Create a Star Schema Data Warehouse
-   Build an interactive Power BI Dashboard
-   Generate business insights

## 🛠 Tech Stack

  Tool         Purpose
  ------------ ------------------
  Python       ETL & Automation
  Selenium     Web Scraping
  Pandas       Data Cleaning
  SQL Server   Data Warehouse
  Power BI     Dashboard
  GitHub       Version Control

## 🗂 Workflow

``` text
Airbnb Website
    ↓
Selenium
    ↓
Cleaning
    ↓
ETL
    ↓
SQL Server DWH
    ↓
Power BI
    ↓
Business Insights
```

## 🌐 Data Collection

Filters: - Entire Home / Apartment - 2 Bedrooms or more

Collected fields: - Price - Rating - Cleanliness - Superhost -
Bedrooms - Capacity - Room Type - City - Day Type

## 🧹 Data Cleaning

-   Remove duplicates
-   Handle missing values
-   Rename columns
-   Convert data types
-   Standardize values

## 🔄 ETL

Extract → Transform → Load

## 🏛 Data Warehouse

Fact: - Gold_Fact_AirBnB

Dimensions: - Gold_Dim_Location - Gold_Dim_Room - Gold_Dim_DayType

## 📊 Dashboard Pages

### 🏠 Home

KPIs: - Total Listings - Average Price - Average Rating - Total
Superhosts

Visual: - Average Price by City

### 🌍 Location

-   Price by City
-   Rating by City
-   Geographic comparison

### 🛏 Room

-   Bedrooms
-   Capacity
-   Room Type analysis

### 👤 Hosts

-   Superhosts
-   Multi Listings

### 📅 Time

-   Weekday vs Weekend
-   Price trend

## 💡 Business Insights

-   Amsterdam has the highest average prices.
-   Superhosts generally receive higher ratings.
-   Weekend prices are higher than weekdays.
-   Cleanliness positively affects ratings.

## 📂 Project Structure

``` text
Airbnb-DWH
├── Data
├── ETL
├── SQL
├── PowerBI
├── Images
└── README.md
```

## 🚀 How to Run

1.  Run scraping scripts.
2.  Execute ETL.
3.  Load SQL Server database.
4.  Open Power BI report.

## 📸 Screenshots

Include: - Star Schema - Home - Location - Room - Hosts - Time

## 🔮 Future Improvements

-   Azure
-   Forecasting
-   Real-time refresh
-   Machine Learning

## ❤️ Built With

Python • Selenium • Pandas • SQL Server • Power BI
