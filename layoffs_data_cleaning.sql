-- Data Cleaning
-- Step 1: Create working copy of raw data

CREATE TABLE layoffs_
LIKE layoffs;

INSERT layoffs_
SELECT *
FROM layoffs;

-- Step 2: Remove exact duplicates

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, industry, total_laid_off, percentage_laid_off, date) AS row_num
FROM layoffs_
;

WITH duplicate_cte AS
(SELECT *,
ROW_NUMBER() OVER(
PARTITION BY company, location, industry, total_laid_off, percentage_laid_off, date, stage, country, funds_raised_millions) AS row_num
FROM layoffs_
)
SELECT *
FROM duplicate_cte
WHERE row_num >1;

SELECT *
FROM layoffs_
WHERE company = 'Casper';


CREATE TABLE layoffs_2 AS
SELECT *,
ROW_NUMBER() OVER (
PARTITION BY company, location, industry, total_laid_off, 
percentage_laid_off, date, stage, country, funds_raised_millions
) AS row_num
FROM layoffs_;

SELECT *
FROM layoffs_2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM layoffs_2
WHERE row_num > 1;

SET SQL_SAFE_UPDATES = 1;

-- Step 3: Standardise text fields

SELECT *
FROM layoffs_2;

SELECT company, TRIM(company)
FROM layoffs_2;

UPDATE layoffs_2
SET company = TRIM(company);

SELECT DISTINCT industry
FROM layoffs_2
ORDER BY 1;

SELECT *
FROM layoffs_2
WHERE industry LIKE 'Crypto%' ;

UPDATE layoffs_2
SET industry = 'Crypto'
WHERE industry LIKE 'Crypto%' ;

SELECT DISTINCT location
FROM layoffs_2
ORDER BY 1 ;

SELECT DISTINCT country
FROM layoffs_2
ORDER BY 1 ;

SELECT DISTINCT country, TRIM(TRAILING '.' FROM country)
FROM layoffs_2
ORDER BY 1 ;

UPDATE layoffs_2
SET country = TRIM(TRAILING '.' FROM country)
WHERE country LIKE 'United States%' ;

-- Step 4: Convert date column to DATE format

SELECT  date,
STR_TO_DATE(date, '%m/%d/%Y')
FROM layoffs_2 ;

UPDATE layoffs_2
SET date = STR_TO_DATE(date, '%m/%d/%Y');

SELECT date
FROM layoffs_2 ;

ALTER TABLE layoffs_2
MODIFY COLUMN date DATE;

-- Step 5: Handle missing values

SELECT *
FROM layoffs_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

SELECT DISTINCT industry
FROM layoffs_2 ;

UPDATE layoffs_2
SET industry = NULL
WHERE industry = '' ;

SELECT *
FROM layoffs_2
WHERE industry IS NULL;

SELECT t1.company, t1.location, t1.industry, t2.industry
FROM layoffs_2 t1
JOIN layoffs_2 t2
ON t1.company = t2.company
AND t1.location = t2.location
WHERE t1.industry IS NULL 
AND t2.industry IS NOT NULL ;

UPDATE layoffs_2 t1
JOIN layoffs_2 t2
ON t1.company = t2.company
SET t1.industry = t2.industry
WHERE t1.industry IS NULL
AND t2.industry IS NOT NULL ;


-- Step 6: Remove irrelevant records

SELECT *
FROM layoffs_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

DELETE
FROM layoffs_2
WHERE total_laid_off IS NULL
AND percentage_laid_off IS NULL ;

ALTER TABLE layoffs_2
DROP COLUMN row_num ;

SELECT *
FROM layoffs_2;
