# Predicting Monthly Unit Sales with XGBoost

## Project Overview

This project uses machine learning to predict monthly product unit sales using historical sales data. The objective is to develop a forecasting model that can support inventory planning, demand forecasting, and business decision-making.

The project compares a baseline forecasting approach, Linear Regression, and XGBoost to determine which approach provides the most accurate predictions.

## Business Problem

Accurate sales forecasting helps businesses anticipate future demand, improve inventory planning, reduce stockouts and excess inventory, and support operational decision-making.

The goal of this project is to predict future monthly unit sales using historical sales patterns and time-based features.

## Dataset

The dataset contains monthly product sales information from January 2023 through August 2026.

Key fields include:

* `product_id`
* `month`
* `units_sold`
* `revenue`

The modeling target is monthly `units_sold`.

## Tools & Technologies

* Python
* Pandas
* NumPy
* Matplotlib
* Scikit-learn
* XGBoost
* MySQL
* Jupyter Notebook
* SQL

## Data Preparation

The data preparation process included:

* Converting monthly date fields into a consistent date format
* Aggregating sales data by month
* Handling incomplete/partial periods
* Creating time-based features
* Creating lag features
* Creating rolling average features
* Preparing training and validation datasets

## Exploratory Data Analysis

The exploratory analysis examined monthly sales trends and seasonal patterns to understand historical demand behavior.

Key visualizations include:

* Monthly sales trends
* Actual vs. predicted sales
* Feature importance
* Forecasted future sales

## Feature Engineering

The XGBoost model used several time-series and historical sales features, including:

* `year`
* `month_number`
* `units_lag_1`
* `units_lag_3`
* `units_lag_6`
* `units_lag_12`
* `rolling_3m_units`
* `rolling_6m_units`
* `rolling_12m_units`

These features capture recent sales behavior, longer-term trends, and seasonal patterns.

## Model Development

Four approaches were evaluated:

1. Baseline Model
2. Linear Regression
3. Prophet
4. XGBoost

The data was split chronologically to prevent future information from being used to predict the past.

### Training Period

January 2023 – December 2025

### Validation Period

January 2026 – July 2026

### Forecast Horizon

August 2026 – December 2026

## Model Performance

| Model | MAE | RMSE | MAPE |
|---|---:|---:|---:|
| Baseline | 114.71 | 143.07 | 4.26% |
| Linear Regression | 312.24 | 327.28 | 11.58% |
| **XGBoost** | **57.46** | **71.13** | **2.14%** |

| Model	                  MAE	        RMSE      MAPE (%)
| -----------------   | -----------   | ------------ | --------- 
| 	Baseline	        | 114.71	      |   143.07     | 	4.26
| 	Linear Regression |	312.24	      |   327.28     |	11.58
| 	Prophet           |	118.48	      |   125.79     |	4.39
| 	**XGBoost**	      | **57.46**	    |   **71.13**	 |  **2.14**


XGBoost produced the strongest validation performance, achieving the lowest MAE, RMSE, and MAPE among the evaluated models.

## XGBoost Model

The final XGBoost model used the following parameters:

```text
n_estimators = 300
learning_rate = 0.05
max_depth = 4
subsample = 0.8
colsample_bytree = 0.8
objective = reg:squarederror
random_state = 42
```

## Feature Importance

The most influential features included:

1. Rolling 3-month unit sales
2. Month number
3. Rolling 6-month unit sales
4. Rolling 12-month unit sales
5. 12-month sales lag

These results indicate that recent sales behavior, seasonal timing, and historical year-over-year demand patterns were important drivers of the model's predictions.

## Business Insights

The model demonstrates that historical sales patterns can be used to improve monthly demand forecasting.

The forecasts can potentially support:

* Inventory planning
* Demand planning
* Supply chain decisions
* Sales planning
* Resource allocation
* Identification of seasonal demand patterns

## Future Improvements

Potential improvements include:

* Hyperparameter tuning using time-series cross-validation
* Testing additional machine learning models
* Incorporating product-level forecasting
* Adding pricing and promotional variables
* Incorporating holidays and seasonal events
* Adding external business drivers
* Developing automated forecasting pipelines

## Project Structure

***text
predicting-monthly-unit-sales-xgboost/
│
├── README.md
├── Predicting_Monthly_Unit_Sales_XGBoost.ipynb
├── data/
├── sql/
├── images/
└── requirements.txt
