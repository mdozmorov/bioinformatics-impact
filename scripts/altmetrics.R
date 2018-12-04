options(stringsAsFactors = FALSE)
library(dplyr)
library(rAltmetric)
library(scholar)
library(corrgram)
library(anytime)
library(lubridate)
library(httr)
library(jsonlite)
library(rcrossref)

# FileNames
# Final
fileNameIn1 <- "tables/tables_altmetrics.csv"
fileNameIn2 <- "tables/CiteScore_2017.csv"
fileNameIn3 <- "tables/Eigenfactor_2015.csv"
fileNameOut <- "tables/Table_software_stats.csv"
# # First part
# fileNameIn1 <- "tables/tables_altmetrics1.csv"
# fileNameOut <- "tables/Table_software_stats1.csv"
# # Second part
# fileNameIn1 <- "tables/tables_altmetrics2.csv"
# fileNameOut <- "tables/Table_software_stats2.csv"

# Needed columns: DOI, GitHub URL
mtx <- read.csv(fileNameIn1)
mtx_citescore <- read.csv(fileNameIn2)
mtx_eigenfact <- read.csv(fileNameIn3)

# Get Altmetrics
alt <- rbind()
for (i in 1:length(mtx$DOI)) {
  a <- altmetrics(doi = mtx$DOI[i])
  # Collect selected statistics
  alt <- rbind(alt, c(mtx$GitHub[i], a$doi, a$journal, a$published_on %>% anydate() %>% year, a$score, cr_citation_count(doi = mtx$DOI[i])))
}
# Rename columns
colnames(alt) <- c("GitHub", "DOI", "Journal", "Year", "Altmetrics", "Citations")
alt[, "Journal"] <- sub(" (Online Edition)", "", alt[, "Journal"], fixed = TRUE)

# Get JIF
journals <- unique(alt[, "Journal"]) # Unique journals
# Get JIFs for the corresponding journals
jif <- rbind()
for (i in 1:length(journals)) {
  impact <- get_impactfactor(journals = journals[i], max.distance = 0.1)
  jif <- rbind(jif, impact)
}
jif$Journal <- journals # Replace journal names by the original names
jif <- jif[, c("Journal", "ImpactFactor")] # Keep only the needed columts

# Attach JIF
mtx_combined <- left_join(as.data.frame(alt), jif, by = c('Journal' = 'Journal'))
# Attach Citescore
mtx_combined  <- left_join(mtx_combined, mtx_citescore, by = c("Journal" = "Title"))
# mtx_combined  <- left_join(mtx_combined, mtx_eigenfact, by = c("Journal"))



# Get GitHub stats
source("scripts/utils.R")
url <- "https://api.github.com"
# Need `get_github_stats` from tables.Rmd
path <- sub("https://github.com/", "repos/", mtx_combined$GitHub)

mtx1 <- get_github_stats(url = url, path = path)

# Merge altmetrics and JIF with GitHub stats
mtx_combined <- left_join(mtx_combined, mtx1, by = c("GitHub" = "URL"))
# Rearrange columns and save
mtx_combined <- mtx_combined[, c("Name", "Description", "GitHub", "Stars", "Watchers", "Forks", "DOI", "Journal", "Year", "Altmetrics", "ImpactFactor", "CiteScore", "Citations")]
# Make numeric columns
mtx_combined[, c("Stars", "Watchers", "Forks", "Year", "Altmetrics", "ImpactFactor", "CiteScore", "Citations")] <- apply(mtx_combined[, c("Stars", "Watchers", "Forks", "Year", "Altmetrics", "ImpactFactor", "CiteScore", "Citations")], 2, as.numeric)
# Save the results
write.csv(mtx_combined[order(mtx_combined$Stars, decreasing = TRUE), ], fileNameOut, row.names = FALSE)




# mtx_combined <- mtx_combined[, c("score", "ImpactFactor", "Stars", "Watchers", "Forks")]
# colnames(mtx_combined) <- c("Altmetrics", "JIF", "Stars", "Watchers", "Forks")
# corrgram(mtx_combined, order = "PCA", upper.panel=panel.conf)
# 
# mtx_eig <- eigen(mtx_cor)$vectors[, 1:2]
# e1 <- mtx_eig[, 1]
# e2 <- mtx_eig[, 2]
# plot(e1, e2, col = 'white', xlim = range(e1, e2), ylim = range(e1, e2))
# text(e1, e2, rownames(mtx_cor), cex = 1)
# title("Eigenvector plot of software impact data")
# arrows(0, 0, e1, e2, cex=0.5, col = "red", length = 0.1)
# 
# corrgram(mtx_cor, order = TRUE, upper.panel = panel.cor, col.regions = colorRampPalette(c("red", "salmon", "white", "royalblue", "navy")))
