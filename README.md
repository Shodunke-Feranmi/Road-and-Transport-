# Nigeria Road Traffic Accidents Analysis (2020–2024) (SQL)
 
A MySQL analysis of a national road traffic accident dataset spanning 2020 to 2024, covering casualties, state-level risk, seasonal patterns, and high-incident states.
 
---
 
## 📌 Project Overview
 
This project analyzes a single combined table of road traffic accident records across Nigerian states from 2020 to 2024, tracking people involved, casualties, deaths, injuries, and case severity, broken down by state, year, and quarter.
 
| Table | Grain |
|---|---|
| `road and transport 2020 to 2024 combined` | One row per state-period record (people involved, casualties, killed, injured, fatal/serious/minor cases, total cases, year, quarter) |
 
## 🎯 Business Problem
 
Road safety authorities need to know where accidents are most severe, when they spike during the year, and which states carry disproportionate risk, so intervention resources (enforcement, infrastructure, awareness campaigns) can be targeted rather than spread evenly.
 
## 📊 Project Objectives
 
- Measure total people involved, casualties, deaths, and injuries from 2020 to 2024
- Identify the states with the most people involved, the most deaths, and the most cases
- Break down injury severity (fatal, serious, minor) by state
- Track yearly and quarterly trends to find seasonal accident patterns
- Classify states into casualty risk tiers (Low, Mid, High) and isolate high-case states for deeper review

 
## 🛠️ Tools & Technologies
 
- **MySQL Workbench**
  - Aggregation (`SUM`, `AVG`, `CEIL`) grouped by state, year, and quarter
  - `CASE WHEN` logic to bucket states into casualty risk tiers
  - Temporary tables to isolate high-case states
  - Common Table Expressions (`WITH`) to join the filtered high-case states back to the full dataset
## 📈 Key Findings
 
- **342,607 people involved** in road transport accidents across Nigeria from 2020 to 2024, resulting in **179,562 total casualties**.
- **25,462 people killed** and **154,137 people injured** across **52,745 total cases**, covering 37 states.
- **Kaduna** (28,721), **Ogun** (29,175), and the **FCT** (29,111) have the most people involved, well ahead of the national spread; **Bayelsa** (903) has by far the fewest.
- **Kaduna has the most deaths** (2,641 killed), followed by **Ogun** (1,723) and **Niger** (1,662).
- The **FCT has the most recorded cases** (5,779), followed by **Ogun** (4,558) and **Nasarawa** (3,482).
- **Kaduna also has the most fatal-severity cases** (1,193), consistent with it topping both people involved and deaths.
- **2022 was the worst year** by people involved (89,143) and by average deaths per record (43.62); **2020, 2023, and 2024 are comparatively lower.**

## 💡 Business Insights
 
1. **Risk is concentrated in a predictable cluster of states.** Kaduna, Ogun, and the FCT lead on nearly every measure (people involved, deaths, and cases), and together with Niger, Nasarawa, Oyo, and Bauchi make up all 7 HIGH-casualty-tier states. Road safety resources would have the biggest impact concentrated in this group rather than spread nationally.
2. **Kaduna stands out as the single highest-risk state.** It has the most deaths, the most fatal-severity cases, and the second-highest people involved, making it the clearest priority for intervention, whether through enforcement, infrastructure, or awareness campaigns.
3. **2022 was a clear outlier year**, both in volume (89,143 people involved, the highest of the five years) and severity (43.62 average deaths, also the highest). Understanding what changed that year, whether reporting improved, travel increased post-pandemic, or enforcement lapsed, would clarify whether this is a trend to worry about or a one-off.
4. **Severity and volume mostly move together, but not always.** The FCT has the most recorded cases yet ranks lower than Kaduna on eaths, suggesting cases there tend to be less severe on average, while Kaduna's smaller case count still produces the highest death toll, a genuine severity gap worth investigating (road type, speed limits, or emergency response time).
## ⚠️ Notes on the Script
 
- **Column name typo:** the source table is named `road and tranpsort 2020 to 2024 combined` ("tranpsort"), which is used consistently throughout, so queries will run correctly as long as the misspelling is kept, but it's worth renaming the table for anyone building on this later.
- **Casualty tier logic has a gap:** `WHEN sum(...) <= 4000 THEN 'LOW'` and `WHEN sum(...) BETWEEN 4000 AND 8000 THEN 'MID'` overlap at exactly 4000, which will always resolve to 'LOW' since `CASE` evaluates conditions in order, but is worth tightening (e.g., `> 4000 AND <= 8000`) to avoid ambiguity.
- **A repeated query appears twice** (`SELECT STATE, 'PEOPLE INVOLVED' ... GROUP BY STATE, 'PEOPLE INVOLVED'`), once near the top of the State Analysis section and again at the very end of the script.
- **The final CTE (`CTE_RTF`) selects every column from both the full table and the temporary table** after joining on STATE, which will produce duplicate columns and a very wide result; consider selecting only the columns actually needed.
## 📚 Skills Demonstrated
 
- Aggregate analysis across state, year, and quarter dimensions
- Conditional bucketing with `CASE WHEN` for risk tiering
- Temporary tables for filtered subsets
- Common Table Expressions for joining filtered and full datasets
- Structuring a public-safety dataset into a clear analysis narrative
## 👤 Author
 
**Shodunke Feranmi**
[LinkedIn](https://linkedin.com/in/your-profile) · [GitHub](https://github.comShodunke-Feranmi)
