# Global Layoffs Data Cleaning & Exploratory Analysis (MySQL)

## Project Overview
This project focuses on cleaning and analysing a global layoffs dataset using MySQL.
The original dataset contained duplicate records, missing values, inconsistent text formatting, and incorrect data types that could distort analytical results.
The objective was to transform the raw dataset into a structured, reliable, and analysis-ready format and perform exploratory analysis to uncover trends and business insights.

## Dataset Description

The dataset contains information on company layoffs, including:

- Company name
- Location
- Industry
- Total laid off
- Percentage laid off
- Date
- Company stage
- Country
- Funds raised

## Tools Used
- MySQL
- SQL (Window Functions, CTEs, Aggregations, Joins, Data Type Conversion, String Functions)

## Phase 1: Data Cleaning
- Created a working copy of the raw dataset to preserve data integrity.
- Removed duplicate records using ROW_NUMBER() with PARTITION BY.
- Standardised text fields (e.g., industry labels, country formatting).
- Converted date column from TEXT format to DATE format using STR_TO_DATE().
- Handled missing values, including filling industry values using self-joins.
- Removed irrelevant records where key layoff metrics were missing.

## Phase 2: Exploratory Data Analysis (EDA)

The cleaned dataset was analysed to answer key business questions:
- Which companies had the highest total layoffs?
- Which industries were most affected?
- Which countries experienced the highest layoffs?
- What were the yearly layoff trends?
- Which companies ranked in the top 5 layoffs per year?
- What were the rolling monthly layoff trends?

## Key Insights
- Layoffs peaked significantly in 2022.
- The technology sector was the most impacted industry.
- The United States recorded the highest total layoffs.
- Several companies laid off 100% of their workforce.
- Monthly rolling totals show concentrated layoff waves during specific periods.

## Key Learning
This project strengthened my understanding of:

- The importance of structured data before analysis
- Controlled deduplication using window functions
- Trend analysis using SQL
- Preparing raw datasets for analytical reporting
- The impact of inconsistent data on business insights
- Preparing datasets for reliable exploratory analysis
