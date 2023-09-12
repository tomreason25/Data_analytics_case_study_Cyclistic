<h1> Cyclistic Case Study Google Analytics </h1>

Thomas Clarke
August 2023

<h2>Introduction</h2>

In this case study, I wish to illustrate the skills I have developed on the path to a career in data analytics. I will perform the role of a Junior Analyst at a bike share company Cyclistic, tasked with using internal company data to answer key business questions.

Quick links:

—SQL queries
Data Visualizations: Tableau 

<h3>Background</h3>

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geo-tracked and locked into a network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.

Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.

The goal of this analysis is to develop a marketing strategy aimed at converting Casual members into Annual members. I will analyze internal company data to identify who the 2 memberships differ.



<h2>Ask</h2>

<h3>Guiding questions:</h3>

How do annual members and casual riders use Cyclistic bikes differently?

<h3>Key Tasks:</h3>

This analysis is to identify the differences in bike use from Casual riders and Annual riders.

The focus is on converting users from Causal to Annual riders. 

What can we use from the data to increase membership upgrades?

<h2>Prepare</h2>

<h3>Data source</h3>

I will use Cyclistic internal data to identify trends in 2021, which can be downloaded here. 

The data has been made available by Motivate International Inc. under this license.

<h3>Data Organization</h3>

There are 12 CSV files for every month of 2021:

File naming convention: YYYYMM-divvy-tripdata

Information provided: ride id, bike type, start time, start station, end time, end station, start location, end location and membership type.



<h2>Process</h2>

The files were stored in a bucket in Google cloud storage and were imported to BiqQuery for exploration, cleaning and analysis.

<h3>Combining the data</h3>

SQL: <<link>>

12 CSV files are uploaded as tables in a new assigned data set 2021.

The 12 CSV files have been renamed to month abbreviations for easy reference.

The new combined file is named 2021_combined. The combined file has 5,595,063 row of data covering the entire year.

<h3>Data Exploration</h3>

Checking the data for any obvious issues:

- The data types for all columns
- Duplicates
- NULL values
- ride_id length
- Number of ride types
- Trips longer than a day
- Trips less than a minute
- Start station and id missing
- End station and id missing
- End coordinates missing
- Membership type

<h3>Types of Data</h3> 

















The start_station_id and end_station_id will be removed from the table as they do not assist in this analysis.



Data Cleaning

SQL Query: <<link>>

All rows with missing values have been deleted.

3 columns have been added:
ride_length
day_of_week
month

2 columns have been removed:
start_station_id
end_station_id


Trips less than a minute and more than a month have been deleted: 90127

Total rows removed 1068047, 19% of original sample.

Analysis

With all the data cleaned the next step is to break down the data into multiple relevant tables to query.

SQL <<LINK>>

The data visualizations were performed in tableau.







Summary

Members are using the service consistently during the week, primarily during commuting hours. They take similar journey lengths throughout the year and continue to use the service into the winter months, dipping finally in February. The service is used widely and fairly evenly throughout the cities main commercial areas.

Casuals are riding for longer and more frequently during the middle of the day. The closest average ride duration between the 2 user types is during morning commuting hours (6am-8am). The amount of Casual users drops significantly during the winter months, as well as the average ride duration. The main hub for traffic is the Streeter Dr & Grand Ave station located at the base of the pier.







Act

From the analyzed data there are a few recommendations for marketing strategies intended to convert casual users to members:

Marketing campaigns conducted in the spring and summer would reach the largest amount of casual users.
Average casual usage drops during morning rush hour, suggesting some are using the bikes to commute. Marketing campaigns should focus around the main commuter destinations incentivizing membership.



