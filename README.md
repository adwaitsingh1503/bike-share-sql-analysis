# Bike Share Data Analysis Project

## 📌 Project Overview
This project performs an Exploratory Data Analysis (EDA) on a bike-sharing dataset using Google BigQuery SQL. The objective is to evaluate data quality, calculate trip statistics, analyze user behavior by membership tier, and identify usage trends such as peak hours and the most popular starting stations.

## 🗄️ Dataset Structure
The analysis is based on a relational database comprising three main tables:
* **`rides`**: Trip details including start/end times, distance, and station IDs.
* **`stations`**: Metadata for the bike docking stations, including station names.
* **`users`**: Demographics and membership levels of the riders.

---

## 🔍 Key Insights & Findings

### 1. Data Health & Anomalies
* **Missing Data:** Identified '0` null ride IDs, '0` null user IDs, and `0` missing timestamps.
* **Anomalies:** Found `[106]` trips with a duration of less than 2 minutes and `[1]` trips recording exactly 0.0 km in distance. *(Note: These likely represent faulty bikes being returned immediately or canceled trips).*

### 2. General Summary Statistics
* **Distance:** Rides range from `0` km to `19.37` km, with an average distance of `5.84` km.
* **Duration:** Ride durations range from `0` minutes to `96` minutes, with an average trip taking `28.74` minutes.

### 3. User Behavior by Membership Level
| Membership Level | Total Rides | Avg. Distance (km) | Avg. Duration (mins) |
| :--- | :--- | :--- | :--- |
| `Casual` | `10676` | `7.00` | `34.5` |
| `subscribers` | `4324` | `3.00` | `14.5` |

### 4. Temporal Trends: Peak Hours
The busiest times of day for bike rentals are:
1. **`15:00 PM`** - `1617` rides
2. **`16:00M PM`** - `1500` rides
3. **`7:00 AM`** - `1213` rides

### 5. Top 10 Most Popular Starting Stations
1. **`Jennifer Land St`** - `648` rides started here
2. **`Megan Manors St`** - `648` rides started here
3. **`King Harbors St`** - `634` rides started here
**(See full query output for the complete top 10 list).*

---

## 🛠️ Skills & SQL Concepts Demonstrated
* **Aggregations:** `COUNT()`, `MIN()`, `MAX()`, `AVG()`
* **Date/Time Functions:** `TIMESTAMP_DIFF()`, `EXTRACT()`
* **Conditional Logic:** `COUNTIF()`
* **Joins:** `JOIN` (combining facts and dimensions across three tables)
* **Grouping & Sorting:** `GROUP BY`, `ORDER BY`

## 🚀 How to Run the Queries
All queries used for this analysis are saved in the `.sql` files in this repository. To replicate the analysis:
1. Open Google BigQuery (or a compatible SQL engine).
2. Ensure you have access to the dataset (`sql-project-499706.sql_practice`).
3. Run the scripts to generate the same insights.
