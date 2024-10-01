# SQL Database Design and Implementation: Melbourne Dark Web Crime Syndicate

## Overview
This project demonstrates the design and implementation of a spatial database to assist the Australian Security Intelligence Organization (ASIO) in identifying and analyzing key logger placements across Melbourne. It uses PostgreSQL with PostGIS extensions to perform spatial queries such as point-in-polygon and nearest polygon analysis.

## Project Structure
- **SQL Scripts**: Contains the SQL files for creating tables, inserting data, and running spatial queries.
- **Python Scripts**: Used to generate random geographic points representing potential key logger locations.
- **Google Earth Visualizations**: KML files visualized in Google Earth show polygon intersections and potential key logger zones.

## How to Use
1. Clone the repository: `git clone https://github.com/Icenerox23/SQL-Database-Dark-Web-Crime-Syndicate.git`
2. Set up PostgreSQL and PostGIS.
3. Run the SQL scripts located in the `sql/` directory to create tables and insert data.
4. Use the Python script to generate random points.
5. Run spatial queries to analyze the data and generate KML files for visualization.
