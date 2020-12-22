library(cesR)
library(labelled)
library(tidyverse)
###Survey data###
#call2019 CES online survey
get_ces("ces2019_web")

#convert values to factor type
ces2019_web <- to_factor(ces2019_web)
head(ces2019_web)

#Just keep some of the variables
select_data <- ces2019_web %>% select(cps19_gender, cps19_province, 
                                cps19_education, cps19_votechoice, 
                                cps19_citizenship)
#filter only on the people who are candian citizen
filter_data <- select_data %>% filter(cps19_citizenship =="Canadian citizen")

#Drop NAs(31564 out of 36480, 86% data kept)
survey_data <- na.omit(filter_data)


###Census data###
census <- read_csv("gss.csv")
educ_count <- c("Total - Highest certificate, diploma or degree (2016 counts)",
                "No certificate, diploma or degree (2016 counts)",
                "Secondary (high) school diploma or equivalency certificate (2016 counts)",
                "Trades certificate or diploma other than Certificate of Apprenticeship or Certificate of Qualification (2016 counts)",
                "College, CEGEP or other non-university certificate or diploma (2016 counts)",
                "University certificate or diploma below bachelor level (2016 counts)")



?citation
?biliography