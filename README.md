# R Dashboard Project
 R Graduate Dashboard

# Code Documentation

## Question 1:

* Column Specification
	* We have been given certain columns to work off of so we can select them using the statement:
	* 'graduate_df <- select(temp_df, Campus, StudyField, Branch, Role, EduLevel, ProgLang, Databases, Platform, WebFramework, Industry, AISearch, AITool, Employment)'
* Missing Value Treatment
	* Upon inspection we find no NULL values however there are blank values which is treated using: 
		* 'graduate_df[graduate_df == ''] <- NA'
	* We then remove the NULL valued rows with:
		* 'graduate_df <- na.omit(graduate_df)'
	* We also find erroneous data in the Branch column hence we remove the row with:
		* 'graduate_df <- graduate_df[graduate_df$Branch != 15,]'
* Standardize Categorical Columns
	* We then treat values that should represent the same thing with the mutate function and recode the values to equal the same value
	* We also find a column with extra data given where it is not needed which we treat by splitting the cell value and keeping the first item after the split
* Sub setting Data
	* We then sub set the data to only show the top 5 campus responses.
## Question 2:

* Top Tools
	* To get these plots we split the data in each column as specified by the separator ";", then we unnest the split data into rows which are counted to provide frequency counts for each tool mentioned. The plots are then drawn using Plotly to allow for interactive elements. The plots are saved separately to their own variable.
* Top Industries and Roles
	* For this we filter the data based on the Study Field for the industry plot and the role plot and count the frequency of each industry and role alike. We make use of Plotly Dot Plots here to visualize the differences between the study fields at the same time while offering interactive options.
* Employment Rates
	* As before we filter the data based on the study field and count the frequency of the employment status of respondents. We then make use of Plotly Pie Plots to show the findings in a useful manner.

We save these plots to an RDS file to be used in our dashboard app.
## Question 3:

* UI Components:
	* Dashboard Header
		* The title of the dashboard, "Graduate Insights"
	* Tabs:
		* Top Tools:
			* Contains the Tool Bar Plots
		* Top Industries:
			* Contains the Industries Dot Plot
		* Top Roles:
			* Contains the Roles Dot Plot
		* Employment Rates:
			* Contains the Employment Rates Pie Plots
		* Data:
			* Contains a Data Table of the data used for plotting with filtering options


* Server Logic
	* Reactive Data Filtering
		* Allows for filtering of data given user inputs
	* Radio Buttons
		* Allows user to select the chart they need, such as choosing between different tools for the tool plots and choosing between the Study Fields for the Employment Rates plots.
	* Plots and Tables
		* Rendering logic for interactive plots and tables

# User Guide:

## General Dashboard Usage:

1. Launch Dashboard Application
2. Explore Tabs
	* Top Tools - Take a look at the most used tool for the different categories.
	* Top Industries - See the amount of respondents that make up each Industry from different Study Fields.
	* Top Roles - See the amount of respondents that make up each Role from different Study Fields.
	* Employment Rates - See the employment rate for graduates from each Study Field.
	* Data - Filter the dataset to your liking to get further insights
	
3. Interact with plots by hovering over them to get further details. Zoom in on areas in Dot Plots to see the data discrepancies 

## Deploying Dashboard app

1. Prepare Files:
	* Ensure the repo is cloned properly and files are in the same directory/project.

2. Install Required Packages:
	* Ensure all packages used by the application is installed by running 'install.packages(c("shiny", "shinydashboard", "shinythemes", "plotly", "ggplot2", "DT", "dplyr", "tidyverse", "readr", "rsconnect"))'

3. Deploy To shinyapps.io
	* Run this command in R to deploy the app:
	* 'rsconnect::deployApp('path/to/app')'