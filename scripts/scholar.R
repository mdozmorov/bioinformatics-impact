install.packages("scholar")
library(scholar)

# compare_scholars Compare the citation records of multiple scholars
ids <- c("soABR8sAAAAJ", "wXj_PpsAAAAJ")
df <- compare_scholars(ids)
df

# compare_scholar_careers Compare the careers of multiple scholars
df <- compare_scholar_careers(ids)
df

# get_coauthors Gets the network of coauthors of a scholar
id <- c("soABR8sAAAAJ")
coauthor_network <- get_coauthors(id, n_coauthors = 5, n_deep = 1)
plot_coauthors(coauthor_network)

# get_impactfactor Get journal metrics
id <- get_publications("soABR8sAAAAJ")
id
impact <- get_impactfactor(journals= "Nature Genetics", max.distance = 0.1)
impact
