options(stringsAsFactors = FALSE)
library(openxlsx)
# All data for 2017, manually downloaded from https://www.scopus.com/sources?dgcid=RN_AG_Sourced_300000264 on 10/22/2018
# `CiteScore_Metrics_2011-2017_Download_25May2018.xlsx` - CiteScore metrics
fileNameIn1  <- "data/CiteScore_Metrics_2011-2017_Download_25May2018.xlsx"
fileNameOut1 <- "tables/CiteScore_2017.csv"

mtx <- read.xlsx(fileNameIn1, sheet = "2017 All", startRow = 2) # 2017 metrics only
mtx <- mtx[, c("Title", "CiteScore")] # Select CiteScore only
mtx <- mtx[!duplicated(mtx), ] # Get unique entries
mtx$Title[mtx$Title == "Applied and Environmental Microbiology"] <- "Applied & Environmental Microbiology" # Rename an unmatched name

write.csv(mtx, fileNameOut1) # Save the results
