## Global Layoffs Data Cleaning & Trend Analysis (MySQL)
## Project Overview
This project focuses on cleaning and analysing a global layoffs dataset using MySQL. The original dataset contained duplicate records, missing values, inconsistent text formatting, and incorrect data types that could distort analytical results.

The objective was to:
- Transform the raw dataset into a structured, reliable, analysis-ready format
- Perform exploratory and trend analysis
- Generate business-focused insights using advanced SQL techniques
- Dataset Description

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
The dataset covers 2021–2023, with 2023 containing partial-year data.

## Tools Used
- MySQL
- SQL (Window Functions, CTEs, Aggregations, Joins, Date Functions, String Functions)

## Phase 1: Data Cleaning

The following steps were performed to ensure data reliability:
- Created a working copy of the raw dataset to preserve data integrity
- Removed duplicate records using ROW_NUMBER() with PARTITION BY
- Standardised text fields (industry labels, country formatting, trimmed company names)
- Converted date column from TEXT to DATE format using STR_TO_DATE()
- Handled missing values, including filling missing industry values using self-joins
- Removed irrelevant records where key layoff metrics were missing
- Dropped helper columns after cleaning
This ensured the dataset was structured and ready for analytical processing.

## Phase 2: Exploratory & Trend Analysis

The cleaned dataset was analysed to answer both descriptive and strategic business questions.

## Volume & Distribution Analysis
- Which companies had the highest total layoffs?
- Which industries were most affected?
- Which countries experienced the highest layoffs?
- Which companies ranked in the top 5 layoffs per year?
- What were the rolling monthly layoff trends?

Techniques used:
- GROUP BY aggregations
- YEAR() and DATE_FORMAT() functions
- DENSE_RANK() window function
- SUM() OVER() rolling totals

## Year-over-Year (YoY) Trend Analysis

To measure momentum and directional change, yearly totals were analysed using the LAG() window function to calculate year-over-year differences.
This allowed identification of:
- Layoff acceleration between 2021 and 2022
- Directional movement rather than just absolute totals

Note: 2023 contains partial-year data and was interpreted cautiously in trend comparisons.

## Industry Contribution Analysis

Industry totals were analysed to determine proportional contribution to overall layoffs.
Using window functions, each industry's share of total layoffs was calculated as a percentage, providing concentration insights across sectors.

## Stage & Funding Analysis

Layoffs were analysed by company stage to evaluate structural differences in workforce reductions.
Average layoffs and average funds raised were compared across stages to identify patterns between company maturity and layoff behaviour.

## Repeated Layoff Behaviour

Companies with multiple layoff events were identified to understand restructuring persistence over time.
This highlights firms undergoing prolonged operational adjustments rather than isolated events.

## Layoff Intensity (Severity) Analysis

Beyond total headcount reductions, workforce reduction severity was analysed using percentage-based filtering.
Companies with percentage_laid_off ≥ 50% were classified as severe layoff events.

This analysis identified:

- Industries with the highest number of severe workforce reductions
- Countries experiencing concentrated high-intensity layoffs
- The overall proportion of severe layoff events within the dataset
This shifts the focus from volume to organisational distress intensity.

## Key Insights

- Layoffs increased significantly from 2021 to 2022, indicating market contraction.
- The consumer industry accounted for the largest share of workforce reductions.
- The United States recorded the highest total layoffs.
- A measurable proportion of events involved 50%+ workforce reductions, signalling severe restructuring.
- Several companies exhibited repeated layoff behaviour, suggesting sustained operational pressure.
- Monthly rolling trends reveal concentrated waves of layoffs during specific periods.

## Data Limitations
- 2023 contains partial-year data and should not be interpreted as a full-year comparison.
- Some records contain missing headcount values, so percentage-based severity analysis was used where appropriate.
- Missing date values were excluded from trend calculations to maintain accuracy.

## Key Learning

This project strengthened my understanding of:
- Structured data preparation before analysis
- Controlled deduplication using window functions
- Year-over-year trend analysis using LAG()
- Ranking and rolling calculations with window functions
- Measuring both volume and intensity of business events

Recognising and documenting dataset limitations

Translating SQL output into business insight
