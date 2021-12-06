library(tidyverse)
library(readxl)

Population_Data <- read_xlsx("PSA-Population-Data.xlsx")

Poverty_Data <- read_xlsx("PSA-Poverty-Data.xlsx")

BLGF_Data <- tibble()
for (fy in str_c(2020:2009)) {
	BLGF_Data <- bind_rows(BLGF_Data, read_xlsx("BLGF-Fiscal-Data.xlsx", sheet = fy) %>%
						   	mutate(Year = parse_date(fy, "%Y")))
}
rm(fy)


