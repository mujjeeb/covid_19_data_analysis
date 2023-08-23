# Data Analysis on Covid 19 data for the year 2019 and 2020

## Project Overview

This project does an analysis on Covid 19 data for the year 2019 and 2020. It utilizes PostgreSQL PG4 Admin for the creation and execution of SQL queries. There's an SQL file that has all queries to answer a few questions on the data and an output file with screenshot of the outputs in  PG4 Admin. 
I have also included a notebook file that is used to procure and the load the data to a PostgreSQL database.



The Data Engineering Job Vacancies ETL Pipeline aims to automate the process of gathering relevant job vacancy data from a RapidAPI service, performing data transformations, and storing the processed data in a PostgreSQL database. The structured data is enriched with extracted skills from the job descriptions, providing valuable insights into the sought-after skills in the job market.

## How it Works

1. **Data Extraction**: The python script extracts data from <a href="https://docs.google.com/spreadsheets/d/13IrO_Aalrv-sH1VAYpmnSs8UJOw-RaZd73sGr_0UNV0/edit?usp=sharing" target="_blank">Link</a>.

2. **Data Transformation**: The extracted data is then transformed to match the pre-established database in PG4 Admin.

3. **Data Loading**: The structured  data is securely loaded into a dedicated PostgreSQL database table named "covid_19_data." The PostgreSQL database acts as a centralized repository for easy access and analysis.


## Requirements

- Python 3.x
- PG4 Admin
- Pandas
- SQLAlchemy
- PostgreSQL

## Usage

1. Start up PG4 Admin and then establish a database named 'covid_19_data' and create a table within it named 'covid_19_data' to house the dataset.

2. Set up the columns to match the data description below.
Colons can be used to align columns.

| Column       | Description         | Type |
| ------------- |:-------------:| -----:|
| SNo      | a unique serial number for the observation record| Integer |
| ObservationDate     | The date the observation was made     |   Date |
| Province | The province or state the observation was made     |    String |
| Country | The Country or region the observation was made   |    String|
| LastUpdate | The date and time the observation was last updated     |    String|
| Confirmed | The number confirmed cases that were observed   |    Integer|
| Deaths | The number Deaths that were observed     |    String|
| Recovered | The number recoveries  that were observed      |    Integer|



3. Create a connection to the created table by inputing your PG4 Admin password in the connection section of the python script.

4. Copy the queries in the SQL file  and then paste in the query tool for the table to uncover insights.


## Contribution and Feedback

Contributions are welcomed to help uncover more insights into the data and deepen my knowledge of Postgre SQL. Feel free traise issues, or provide feedback to help us improve the project.


## Github profile
https://github.com/mujjeeb



