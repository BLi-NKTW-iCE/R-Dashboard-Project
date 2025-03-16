# Jaden Van der Berg - CT.2022.P7X9H6

library(tidyr)
library(dplyr)
library(ggplot2)
library(tidyverse)
library(plotly)

# Load in Data
final_grad_df <- readRDS("final_grad_data.rds")

# Question 2
# 2.1

# Programming Language Tool Section
# Count frequency of each Programming Language
top_ProgLang <- final_grad_df %>%
  mutate(ProgLang = strsplit(ProgLang, ";")) %>%
  unnest(ProgLang) %>%
  count(ProgLang) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for ProgLang
ProgLang_Tool_Plot <- top_ProgLang %>% arrange(desc(n)) %>% mutate(ProgLang=factor(ProgLang, levels=ProgLang))

ProgLang_Tool_Plot <- ProgLang_Tool_Plot %>%
  plot_ly(y = ~ProgLang, x = ~n, color = ~ProgLang, type = "bar")

ProgLang_Tool_Plot <- ProgLang_Tool_Plot %>% layout(title = list(text = "<b>Top Programming Languages Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b> Programming Language Used </b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "Programming Language")))

ProgLang_Tool_Plot

# Database Section
# Count the Frequency of Databases
top_Databases <- final_grad_df %>%
  mutate(Databases = strsplit(Databases, ";")) %>%
  unnest(Databases) %>%
  count(Databases) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for Databases
Database_Tool_Plot <- top_Databases %>% arrange(desc(n)) %>% mutate(Databases=factor(Databases, levels=Databases))

Database_Tool_Plot <- Database_Tool_Plot %>%
  plot_ly(y = ~Databases, x = ~n, color = ~Databases, type = "bar")

Database_Tool_Plot <- Database_Tool_Plot %>% layout(title = list(text = "<b>Top Databases Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b>Database Used</b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "Database")))

Database_Tool_Plot

# Platform Section
# Count Frequency of Platforms
top_Platform <- final_grad_df %>%
  mutate(Platform = strsplit(Platform, ";")) %>%
  unnest(Platform) %>%
  count(Platform) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for Cloud Platforms
Platform_Tool_Plot <- top_Platform %>% arrange(desc(n)) %>% mutate(Platform=factor(Platform, levels=Platform))

Platform_Tool_Plot <- Platform_Tool_Plot %>%
  plot_ly(y = ~Platform, x = ~n, color = ~Platform, type = "bar")

Platform_Tool_Plot <- Platform_Tool_Plot %>% layout(title = list(text = "<b>Top Cloud Platforms Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b>Cloud Platform Used</b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "Cloud Platform")))

Platform_Tool_Plot

# Web Framework Section
# Count Frequency of Web Frameworks
top_WebFramework <- final_grad_df %>%
  mutate(WebFramework = strsplit(WebFramework, ";")) %>%
  unnest(WebFramework) %>%
  count(WebFramework) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for Web Frameworks
WebFramework_Tool_Plot <- top_WebFramework %>% arrange(desc(n)) %>% mutate(WebFramework=factor(WebFramework, levels=WebFramework))

WebFramework_Tool_Plot <- WebFramework_Tool_Plot %>%
  plot_ly(y = ~WebFramework, x = ~n, color = ~WebFramework, type = "bar")

WebFramework_Tool_Plot <- WebFramework_Tool_Plot %>% layout(title = list(text = "<b>Top WebFrameworks Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b>Web Framework Used</b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "Web Framework")))

WebFramework_Tool_Plot

# AI Search Tool Section
# Count Frequency of AI Search tools used
top_AISearch <- final_grad_df %>%
  mutate(AISearch = strsplit(AISearch, ";")) %>%
  unnest(AISearch) %>%
  count(AISearch) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for AI Search Tools
AISearch_Tool_Plot <- top_AISearch %>% arrange(desc(n)) %>% mutate(AISearch=factor(AISearch, levels=AISearch))

AISearch_Tool_Plot <- AISearch_Tool_Plot %>%
  plot_ly(y = ~AISearch, x = ~n, color = ~AISearch, type = "bar")

AISearch_Tool_Plot <- AISearch_Tool_Plot %>% layout(title = list(text = "<b>Top AI Search Tool Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b>AI Search Tool Used</b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "AI Search Tool")))

AISearch_Tool_Plot

# AI Developer Tool Section
# Count Frequency of AI Developer Tool used
top_AITool <- final_grad_df %>%
  mutate(AITool = strsplit(AITool, ";")) %>%
  unnest(AITool) %>%
  count(AITool) %>%
  arrange(desc(n))

# Draw Plotly Bar Plot for AI Developer Tools
AIDevTool_Tool_Plot <- top_AITool %>% arrange(desc(n)) %>% mutate(AITool=factor(AITool, levels=AITool))

AIDevTool_Tool_Plot <- AIDevTool_Tool_Plot %>%
  plot_ly(y = ~AITool, x = ~n, color = ~AITool, type = "bar")

AIDevTool_Tool_Plot <- AIDevTool_Tool_Plot %>% layout(title = list(text = "<b>Top AI Developer Tool Used</b>", xanchor = "center", yanchor = "top"),
                                                    font = list(family = "Open Sans"),
                                                    yaxis = list(title = "<b>AI Developer Tool Used</b>"),
                                                    xaxis = list(title = "<b>Amount of Responses</b>"),
                                                    legend = list(title = list(text = "AI Developer Tool")))

AIDevTool_Tool_Plot


# 2.2
# For this I will make use of interactive dot plots to display the data together

# Counting frequency of industries per Study Field
# Data Science
top_Industry_DS <- final_grad_df %>%
  filter(StudyField == "Data Science") %>% 
  count(Industry) %>%
  arrange(desc(n))

# Computer Science
top_Industry_CS <- final_grad_df %>%
  filter(StudyField == "Computer Science") %>% 
  count(Industry) %>%
  arrange(desc(n))

# Information Technology
top_Industry_IT <- final_grad_df %>%
  filter(StudyField == "IT") %>% 
  count(Industry) %>%
  arrange(desc(n))

# Drawing Dot Plot
Industries_Plot <- plot_ly(x = ~top_Industry_DS$n, y = ~top_Industry_DS$Industry, name = "Data Science", type = 'scatter',
                        mode = "markers", marker = list(color = "#D45F5F", size = 10))

Industries_Plot <- Industries_Plot %>% add_trace(x = ~top_Industry_CS$n, y = ~top_Industry_CS$Industry, name = "Computer Science",type = 'scatter',
                                           mode = "markers", marker = list(color = "#4A6FD4", size = 10))

Industries_Plot <- Industries_Plot %>% add_trace(x = ~top_Industry_IT$n, y = ~top_Industry_IT$Industry, name = "Information Technology",type = 'scatter',
                                           mode = "markers", marker = list(color = "#50D492", size = 10))

Industries_Plot <- Industries_Plot %>% layout(
  title = list(text = "<b>Most Popular Industries For Graduates</b>", xanchor = "center", yanchor = "top"),
  font = list(family = "Open Sans"),
  yaxis = list(title = "<b>Industries</b>"),
  xaxis = list(title = "<b>Amount of Responses</b>"),
  legend = list(title = list(text = "Study Field")),
  margin = list(l = 100)
)

Industries_Plot


# 2.3
# I will make use of the same method for plotting 2.2 however it will be done over the Role column

# Counting frequency of industries per Study Field
# Data Science
top_Role_DS <- final_grad_df %>%
  filter(StudyField == "Data Science") %>% 
  count(Role) %>%
  arrange(desc(n))

# Computer Science
top_Role_CS <- final_grad_df %>%
  filter(StudyField == "Computer Science") %>% 
  count(Role) %>%
  arrange(desc(n))

# Information Technology
top_Role_IT <- final_grad_df %>%
  filter(StudyField == "IT") %>% 
  count(Role) %>%
  arrange(desc(n))

Roles_Plot <- plot_ly(x = ~top_Role_DS$n, y = ~top_Role_DS$Role, name = "Data Science", type = 'scatter',
                        mode = "markers", marker = list(color = "#D45F5F"))

Roles_Plot <- Roles_Plot %>% add_trace(x = ~top_Role_CS$n, y = ~top_Role_CS$Role, name = "Computer Science",type = 'scatter',
                                           mode = "markers", marker = list(color = "#4A6FD4"))

Roles_Plot <- Roles_Plot %>% add_trace(x = ~top_Role_IT$n, y = ~top_Role_IT$Role, name = "Information Technology",type = 'scatter',
                                           mode = "markers", marker = list(color = "#50D492"))

Roles_Plot <- Roles_Plot %>% layout(
  title = list(text = "<b>Top Job Roles For Graduates</b>", xanchor = "center", yanchor = "top"),
  font = list(family = "Open Sans"),
  yaxis = list(title = "<b>Job Role</b>"),
  xaxis = list(title = "<b>Amount of Responses</b>"),
  legend = list(title = list(text = "Study Field")),
  margin = list(l = 100)
)

Roles_Plot


# 2.4
# Frequency Counting method remains the same however to better visualize the difference in sizes for the different employment levels I will make use of pie charts

# Counting frequency of Employment values per Study Field
# Data Science
emp_Rate_DS <- final_grad_df %>%
  filter(StudyField == "Data Science") %>% 
  count(Employment) %>%
  arrange(desc(n))

# Computer Science
emp_Rate_CS <- final_grad_df %>%
  filter(StudyField == "Computer Science") %>% 
  count(Employment) %>%
  arrange(desc(n))

# Information Technology
emp_Rate_IT <- final_grad_df %>%
  filter(StudyField == "IT") %>% 
  count(Employment) %>%
  arrange(desc(n))

# Initializing color palette
colors <- c("#D45F5F", "#4A6FD4", "#50D492", "#FFFCAF")

# Creating Pie Chart for the Data Science Field
DS_EmpRate_fig <- plot_ly(emp_Rate_DS, labels = ~Employment, values = ~n, type = 'pie',
                          textposition = 'inside',
                          textinfo = "label+percent",
                          insidetextfont = list(color = '#000000'),
                          hoverinfo = "label+text+percent",
                          text = ~paste(n, "Respondents"),
                          marker = list(colors = colors, line = list(color = '#FFFFFF', width = 1)))

DS_EmpRate_fig <- DS_EmpRate_fig %>% layout(title = list(text = "<b>Employment Rate for Data Science Graduates</b>", xanchor = "center"),
                                            font = list(family = "Open Sans"),
                                            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            legend = list(title = list(text = "Employment Status")))

DS_EmpRate_fig

# Creating Pie Chart for the Computer Science Field
CS_EmpRate_fig <- plot_ly(emp_Rate_CS, labels = ~Employment, values = ~n, type = 'pie',
                          textposition = 'inside',
                          textinfo = "label+percent",
                          insidetextfont = list(color = '#000000'),
                          hoverinfo = "label+text+percent",
                          text = ~paste(n, "Respondents"),
                          marker = list(colors = colors, line = list(color = '#FFFFFF', width = 1)))

CS_EmpRate_fig <- CS_EmpRate_fig %>% layout(title = list(text = "<b>Employment Rate for Computer Science Graduates</b>", xanchor = "center"),
                                            font = list(family = "Open Sans"),
                                            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            legend = list(title = list(text = "Employment Status")))

CS_EmpRate_fig

# Creating Pie Chart for the Information Technology Field
IT_EmpRate_fig <- plot_ly(emp_Rate_IT, labels = ~Employment, values = ~n, type = 'pie',
                          textposition = 'inside',
                          textinfo = "label+percent",
                          insidetextfont = list(color = '#000000'),
                          hoverinfo = "label+text+percent",
                          text = ~paste(n, "Respondents"),
                          marker = list(colors = colors, line = list(color = '#FFFFFF', width = 1)))

IT_EmpRate_fig <- IT_EmpRate_fig %>% layout(title = list(text = "<b>Employment Rate for Information Technology Graduates</b>", xanchor = "center"),
                                            font = list(family = "Open Sans"),
                                            xaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            yaxis = list(showgrid = FALSE, zeroline = FALSE, showticklabels = FALSE),
                                            legend = list(title = list(text = "Employment Status")))

IT_EmpRate_fig


# Save Plots and frequency counts for use on Dashboard in plotting and Data Tables

saveRDS(list(ProgLang_Tool_Plot, Database_Tool_Plot, Platform_Tool_Plot, WebFramework_Tool_Plot, AISearch_Tool_Plot, AIDevTool_Tool_Plot, Industries_Plot, Roles_Plot, DS_EmpRate_fig, CS_EmpRate_fig, IT_EmpRate_fig,
             top_ProgLang, top_Databases, top_Platform, top_WebFramework, top_AISearch, top_AITool), "plots_and_data.rds")
