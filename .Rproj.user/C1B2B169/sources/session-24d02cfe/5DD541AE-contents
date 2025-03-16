# Jaden Van der Berg - CT.2022.P7X9H6

library(tidyr)
library(dplyr)
library(tidyverse)

# Note df and table checks have been commented out to improve dashboard load times, they have however been used as detailed

# Load in data set and refine column selection
temp_df <- read.csv('graduate_survey.csv', sep = ',')

# 1.a)
# Selecting of columns specified in scenario
graduate_df <- select(temp_df, Campus, StudyField, Branch, Role, EduLevel, ProgLang, Databases, Platform, WebFramework, Industry, AISearch, AITool, Employment)

# Taking a look at the Dataframe to check the data
#view(graduate_df)

#summary(graduate_df)

# 1.b)
# Upon inspection there are no NULL values however there are blanks, and there is an error in the Branch column upon inspecting all columns using the table function
#view(table(graduate_df$Branch))

# Assigning blank columns to be read as Null
graduate_df[graduate_df == ''] <- NA

# Removal of Null columns
graduate_df <- na.omit(graduate_df)

# Checking if the NULL removal worked
#view(graduate_df)

# Upon inspection of all columns using table function we find erroneous data in the Branch column and remove the row containing it
graduate_df <- graduate_df[graduate_df$Branch != 15,]

# Checking if row removal worked
#view(table(graduate_df$Branch))

# 1.c)
# Here we change the names of Campuses referring to the same place and group the Cape Town campuses
graduate_df <- graduate_df %>% 
  mutate(Campus = recode(Campus, "Durban Campus" = "Durban Campus",
                         "Umhlanga Campus" = "Durban Campus",
                         "Mowbray Campus" = "Cape Town Campus",
                         "Tyger Valley Campus" = "Cape Town Campus",
                         "Nelspruit Campus" = "Nelspruit Campus",
                         "Mbombela Campus" = "Nelspruit Campus",
                         "Port Elizabeth Campus" = "Port Elizabeth Campus",
                         "Nelson Mandela Bay Campus" = "Port Elizabeth Campus"))


# splitting data to keep what is needed.
graduate_df <- graduate_df %>% 
  mutate(Employment = sapply(strsplit(Employment, ","), "[", 1))

# 1.d)
# Sub setting Data
campus_resp_amt <- graduate_df %>% count(Campus, sort = TRUE)

campus_top5 <- campus_resp_amt %>% slice(1:5) %>% pull(Campus)

final_grad_df <- graduate_df %>% filter(Campus %in% campus_top5)

# Output Final CSV data
write.csv(final_grad_df, "final_graduate_data.csv")

# save as RDS for use on shiny app
saveRDS(final_grad_df, "final_grad_data.rds")
