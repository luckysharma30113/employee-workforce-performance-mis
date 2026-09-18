# Employee Workforce & Performance MIS Dashboard

## Project Overview

The Employee Workforce & Performance MIS Dashboard is an end-to-end
data analytics project designed to analyze employee workforce,
attendance, performance, productivity, salary, and leave patterns.

The project uses Python for data cleaning, SQL Server for data analysis,
and Power BI for interactive dashboard reporting.

---

## Business Objective

The objective of this project is to provide management with a centralized
view of workforce and employee performance data.

The dashboard helps analyze:

- Employee workforce distribution
- Department and location-wise headcount
- Salary patterns
- Employee attendance
- Working and overtime hours
- Employee performance
- Productivity
- Leave patterns
- Top-performing employees

---

## Tools & Technologies

- Python
- Pandas
- SQL Server
- Power BI
- DAX
- Jupyter Notebook

---

## Dataset

The project contains four datasets:

1. Employees
2. Attendance
3. Performance
4. Leaves

The raw datasets were cleaned and prepared before analysis.

---

## Project Workflow

Raw Data
   ↓
Python Data Cleaning
   ↓
Cleaned CSV Files
   ↓
SQL Server
   ↓
SQL Analysis
   ↓
Power BI Data Model
   ↓
DAX Measures
   ↓
Interactive MIS Dashboard

---

## Python Data Cleaning

Python and Pandas were used for:

- Data inspection
- Missing value detection
- Duplicate removal
- Data type conversion
- Date transformation
- Inconsistent value correction
- Outlier handling
- Feature creation
- Exporting cleaned datasets

---

## SQL Analysis

SQL Server was used to perform analysis such as:

- Department-wise employee count
- Location-wise employee count
- Average salary by department
- Top 10 highest-paid employees
- Salary range by department
- Joining year-wise hiring
- Attendance percentage
- Average working hours
- Overtime analysis
- Employee attendance analysis
- Employee performance analysis
- Top performers
- Low performers
- Department-wise leave analysis

---

## Power BI Dashboard

The Power BI dashboard contains:

### KPI Cards

- Total Employees
- Average Salary
- Attendance %
- Average Performance
- Average Productivity
- Total Leave Days

### Visualizations

- Employees by Department
- Attendance % by Department
- Employee Distribution by Location
- Average Performance by Department
- Monthly Attendance Trend
- Leave Days by Department
- Top 10 Employees by Performance

### Filters

- Department
- Location
- Joining Year
- Month

---

## Key Business Questions

The dashboard helps answer questions such as:

- How many employees are present across departments?
- Which departments have higher attendance?
- How is the workforce distributed by location?
- Which departments have higher average performance?
- What are the monthly attendance trends?
- Which departments have higher leave days?
- Who are the top-performing employees?
- How does salary vary across departments?

---

## Project Structure

Employee_MIS_Project/

├── data/

│   ├── raw/

│   └── cleaned/

├── python/

│   ├── 01_employees_cleaning.ipynb

│   ├── 02_attendance_cleaning.ipynb

│   ├── 03_performance_cleaning.ipynb

│   └── 04_leaves_cleaning.ipynb

├── sql/

│   └── employee_mis_analysis.sql

├── powerbi/

└── README.md

---

## Skills Demonstrated

- Data Cleaning
- Exploratory Data Analysis
- Python / Pandas
- SQL
- Data Aggregation
- Joins
- Data Modeling
- DAX
- Power BI
- Dashboard Development
- Business Reporting
- MIS Reporting
- Data Visualization

---

## Conclusion

This project demonstrates an end-to-end analytics workflow from raw
employee data to an interactive management information system dashboard.

It combines data cleaning, SQL analysis, business reporting, and
visualization to support workforce and employee performance analysis.
