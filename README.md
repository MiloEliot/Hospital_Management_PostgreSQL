# PostgreSQL Hospital Management Analysis

## 1. Introduction
The project demonstrates the usage of SQL in a Jupyter notebook. It highlights the use of common table expression, view statement, window function, customized function, constraint on data, regular expression and aggregation function. Additionally, it showcases the interaction with Python for data processing and visualization.

## 2. Database Setup
The Hospital Management dataset is downloaded from [Kaggle](https://www.kaggle.com/datasets/kanakbaghel/hospital-management-dataset/data?select=patients.csv). The import of csv tables and the establishment of relationships among tables are achieved by the following SQL script:
- [Build relational database](./sql/hospital_management_schema.sql)

## 3. Repository Structure
- `sql` - SQL script
- `output` - the database [schema](./output/hospital_management_schema.png)
- `Hospital_management_analysis.ipynb` - The Jupyter notebook demonstrates the integration of PostgreSQL with Python for data processing, analysis, and visualization.

