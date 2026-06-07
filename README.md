# NYC Rideshare Driver Economics Analysis
## Impact of NYC Congestion Pricing on Uber & Lyft Drivers | Q4 2024 vs Q1 2025

## Overview
This project analyzes the impact of NYC's congestion pricing policy (launched January 5, 2025) 
on Uber and Lyft driver earnings across New York City's five boroughs. Using real NYC TLC 
trip data, the analysis compares driver pay, passenger fares, and take rates before 
(Q4 2024) and after (Q1 2025) the policy launch — surfacing which drivers, boroughs, 
and platforms were most affected.

## Business Question
Did NYC's congestion pricing policy improve or worsen driver earnings, and which 
boroughs and platforms were most impacted?

## Key Findings
- Driver pay dropped 7.7% after congestion pricing despite only a 5.3% fare reduction — 
  drivers absorbed more of the cost burden than passengers
- Manhattan drivers face the lowest take rate of any borough at 70.1% after the policy, 
  despite passengers paying the highest fares
- Uber drivers were more adversely affected than Lyft — Uber's take rate fell 5.5 points 
  vs Lyft's near-flat change
- Every borough saw earnings per mile decline, with Manhattan experiencing the largest 
  drop (-11.3%)

## Data
Raw data sourced from NYC TLC High Volume For-Hire Vehicle Trip Records:
- Q4 2024: October, November, December 2024 (before congestion pricing)
- Q1 2025: January, February, March 2025 (after congestion pricing)
- Download: https://www.nyc.gov/site/tlc/about/tlc-trip-record-data.page
- ~20M rows per month, sampled to 500K rows per month for analysis
- Final cleaned dataset: ~3M rows stored in Google BigQuery

Run `data_preparation.ipynb` to reproduce the sampling, cleaning, and BigQuery upload.

## Tools & Stack
| Layer | Tool |
|-------|------|
| Data Preparation | Python (pandas, pyarrow) |
| Data Storage | Google BigQuery |
| SQL Analysis | BigQuery SQL |
| Visualization | Python (matplotlib, seaborn) |
| Dashboard | Looker Studio (connected to BigQuery) |

## Project Structure
├── data_preparation.ipynb  # Data sampling, cleaning, BigQuery upload
├── analysis.ipynb          # Python visualizations
├── taxi_zone_lookup.csv    # NYC TLC taxi zone to borough mapping
├── Analysis_Memo.pdf       # Full findings and recommendations
└── README.md

## Dashboard
https://datastudio.google.com/reporting/256b6229-edb3-4386-bc11-0f26d2ed109b 

## Analysis Memo
See `Analysis_Memo.pdf` for full findings, recommendations, and caveats.

## Resume Bullets
- Analyzed impact of NYC congestion pricing on 3M+ Uber/Lyft trips using 
  BigQuery SQL and Python, finding drivers absorbed a 7.7% pay reduction 
  vs a 5.3% passenger fare drop — identifying a structural earnings 
  disadvantage in Manhattan
- Built borough-level driver economics analysis revealing Manhattan's 
  take rate dropped to 70.1% post-congestion pricing despite highest 
  passenger fares, recommending a borough-specific driver pay adjustment
- Delivered interactive Looker Studio dashboard connected to BigQuery 
  tracking driver pay, take rate, and earnings per mile across NYC boroughs 
  and platforms with dynamic filtering
