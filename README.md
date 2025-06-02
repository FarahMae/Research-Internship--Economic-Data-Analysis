# 📊 Economic Freedom and GDP Analysis

[![Status](https://img.shields.io/badge/Status-Completed-brightgreen)]()  
[![Platform](https://img.shields.io/badge/Platform-R%20%7C%20Excel-blue)]()  
[![Data](https://img.shields.io/badge/Data%20Sources-World%20Bank%20%7C%20Heritage%20Foundation-yellow)]()

---

## 🔍 Overview

This project explores the statistical relationship between **GDP per capita** and multiple economic freedom indicators across 15 countries. The analysis was conducted using **Microsoft Excel** and **R Studio**, including regression models, visualizations, and data classification strategies to interpret global economic trends.

---

## 📁 Project Structure

| Part | Description |
|------|-------------|
| **Part 1** | Excel table: Raw and transformed data (categorical variables included) |
| **Part 2** | Scatter plots, correlation matrix, and R DOFILE (`.r`) |
| **Part 3** | Interpretation of regression results (max 150 words) |
| **Part 4** | Explanation of missing data handling |
| **Part 5** | Data categorization coding explanation |

---

## 📈 Key Results

| Indicator             | R² Value | Interpretation |
|-----------------------|----------|----------------|
| Economic Freedom      | 0.286    | Moderate positive correlation |
| Gini Index (Inequality) | 0.034  | Very weak correlation |
| Business Freedom      | 0.311    | Stronger indicator of prosperity |
| Trade Freedom         | 0.196    | Moderate boost to GDP |
| Corruption Index      | 0.417    | **Strongest predictor** of GDP |

**Multiple Regression R² = 0.453** – Combined indicators explain 45.3% of GDP variance.

---

## 📌 Interpretation (Part 3)

The results reveal definite connections between economic policy and national wealth. Nations that are more economically free have significantly greater GDP per capita (R² = 0.286), indicating that free markets and fewer regulations are preferable for economic prosperity.  
Gini Index (R² = 0.034) shows income inequality is not a main driver of GDP.  
Corruption Index (R² = 0.417) is the strongest predictor — cleaner governments attract investment.  
Business (0.311) and Trade Freedom (0.196) also show importance in driving prosperity.  
Statistical models in Excel and R confirm Liberty International’s model: **market-based policies and openness drive growth**.

---

## 🛠️ Missing Data Handling (Part 4)

Missing values were addressed using the following methods:

- **Substitution with national source**: Singapore’s Gini Index was retrieved from its official statistics agency.
- **Exclusion due to mismatch**: Venezuela’s GDP data (2014) was excluded due to being outdated versus 2024 indicators.
- Discussed options included average substitution, prediction models, multiple estimations, and row deletion to ensure integrity and transparency.

---

## 🧾 Data Coding & Categorization (Part 5)

**What was done**:
- Economic Freedom was grouped into:  
  - **High** (70+), **Medium** (50–69), **Low** (0–49)  
- GDP per Capita grouped by World Bank classification:  
  - **High** (> $30,000), **Middle** ($10,000–30,000), **Low** (< $10,000)

**Why**:
- Grouping simplifies comparison across countries and reveals trends more clearly.  
- Shows that **high freedom = high income** countries like Singapore and Germany, while low-freedom nations (e.g. Venezuela) perform worse.

---

## 🧪 Tools Used

- **Microsoft Excel** – Data transformation and regression
- **R Studio** – Advanced visualization and correlation matrix  
  - Libraries: `ggplot2`, `corrplot`, `gridExtra`

---
