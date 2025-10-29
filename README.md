# Data-Driven Business Insights from Electric Vehicle Sales Across India Using MySQL

**Project Title:** Data-Driven Business Insights from Electric Vehicle (EV) Sales Across India Using MySQL

---

## ⚡ Project Overview

This project leverages **advanced SQL techniques** to analyze and visualize **electric vehicle (EV) sales data** across multiple states in **India**, enabling actionable **business intelligence** for strategic decision-making.

A comprehensive **data warehouse** was built to support **descriptive**, **comparative**, and **time series analysis**, uncovering key trends in EV adoption, identifying growth opportunities across categories and classes, and benchmarking performance against industry targets.

Using **robust SQL queries**, this project explores critical business questions:

* How are EV sales distributed by state and category?
* Which vehicle classes show the fastest adoption rates?
* Where are low-penetration segments that could benefit from conversion campaigns?
* What seasonal patterns exist in EV sales growth?

The insights derived provide manufacturers, marketers, and policymakers with **granular, data-backed recommendations** to accelerate India’s transition to electric mobility and optimize strategies for competitive advantage.

---

## 🏆 Key Deliverables

* **Complete SQL Data Model:** Efficient schema design for high-volume EV sales data.
* **Custom SQL Queries:** 20+ business-oriented templates for instant insights.
* **Trend & Forecast Reports:** Time series, market share, and growth analyses.
* **Strategic Recommendations:** Data-driven opportunities for expansion and conversion.

---

## 💡 Impact & Skills Demonstrated

* ✅ Advanced SQL (MySQL) scripting and analytics for business intelligence.
* ✅ Real-world application of analytics for market research and EV adoption insights.
* ✅ Visual storytelling using data-driven dashboards (Power BI, Tableau, Excel).
* ✅ Strategic insight development for automotive and mobility professionals.

---

## ⚙️ Project Workflow

### 1. Data Cleaning & Validation

* Check for missing, inconsistent, or duplicate records using SQL.
* Use `DELETE`, `UPDATE`, and `ALTER` commands to clean and standardize.
* Example: Remove rows with invalid dates or blank mandatory fields.

### 2. Database Design

* Create normalized relational schema for:

  * `ev_sales` (vehicle details, sales, date)
  * `states` (region-level info)
  * `manufacturers` (brand details)
  * `categories` (2W, 3W, 4W, etc.)
  * `charging_infra` (optional expansion)

### 3. Advanced Data Analysis

* Use **window functions**, **subqueries**, **joins**, and **aggregations** to answer analytical questions.
* Perform **YoY growth analysis**, **state comparisons**, and **category-wise adoption** trends.
* Apply **moving averages** or **linear regression** (optional via Python) for forecasting future sales.

### 4. Visualization & Dashboards

* Export summarized SQL results to **Power BI**, **Tableau**, or **Excel**.
* Create visuals such as:

  * EV Sales by Year and State
  * Market Share by Category (2W, 3W, 4W)
  * YoY Growth and Adoption Trends
  * Top 10 Manufacturers by Total EV Sales

### 5. Business Recommendations

* Develop actionable insights based on data analysis:

  * Identify **high-opportunity classes** for EV conversion.
  * Highlight **states needing more marketing or policy support**.
  * Suggest **investment strategies** for emerging regions.

### 6. Documentation & Presentation

* Prepare your code, queries, visualizations, and insights into a structured report or presentation.
* Summarize challenges, learning outcomes, and recommendations for decision-makers.

---

## 📈 Key Insights (Example)

* **Maharashtra** and **Karnataka** lead in overall EV adoption by 2024.
* **Two-wheelers (2W)** dominate total EV sales, showing mass consumer adoption.
* **Commercial 3W** and **e-buses** exhibit high YoY growth, driven by urban transport policies.
* **North-Eastern states** show low penetration but emerging interest in small EVs.
* Seasonal peaks around **March** and **September** reflect fiscal and policy-driven demand surges.

---

## 🚀 How to Run the Project

1. Clone the repository:

   ```bash
   git clone https://github.com/<your-username>/EV-Sales-India-Analysis.git
   cd EV-Sales-India-Analysis
   ```

2. Import the dataset into your MySQL database.

3. Execute the SQL scripts in the following order:

   * `create_tables.sql`
   * `data_cleaning.sql`
   * `analysis_queries.sql`

4. Export results to Power BI or Tableau for visualization.

5. Open the Power BI dashboard (`EV_Sales_Insights.pbix`) for interactive exploration.

---

## 💼 Business Impact

* Enabled **data-backed market expansion** strategy for EV manufacturers.
* Supported **policy and subsidy decisions** by identifying underperforming regions.
* Improved **forecasting accuracy** for production and supply chain planning.
* Empowered **stakeholders** with real-time EV market intelligence.

---

## 🔮 Future Enhancements

* Integrate **Python or R** scripts for predictive modeling.
* Automate data ingestion using **ETL pipelines** (Airflow / Talend).
* Develop an **interactive dashboard** using **Streamlit**.
* Add **charging infrastructure** and **battery performance** datasets for deeper insight.

---

## 👤 Author

**Created by:** Ajay Borah
**GitHub:** [Ajayborah4142](https://github.com/Ajayborah4142)

---
