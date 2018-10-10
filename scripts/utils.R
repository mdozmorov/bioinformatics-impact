# https://github.com/r-lib/httr/blob/master/vignettes/api-packages.Rmd
github_api <- function(path) {
  url <- modify_url("https://api.github.com", path = path)
  GET(url)
}
rate_limit <- function() {
  raw.result <- github_api("/rate_limit")
  this.raw.content <- rawToChar(raw.result$content)
  this.content <- fromJSON(this.raw.content)
  this.content$resources$core$reset <- as.POSIXct(this.content$resources$core$reset, origin = "1970-01-01")
  this.content$resources$search$reset <- as.POSIXct(this.content$resources$search$reset, origin = "1970-01-01")
  this.content$resources$graphql$reset <- as.POSIXct(this.content$resources$graphql$reset, origin = "1970-01-01")
  this.content$rate$reset <- as.POSIXct(this.content$rate$reset, origin = "1970-01-01")
  this.content %>% as.data.frame()
}
# rate_limit()
# Sys.setenv(GITHUB_PAT = "99e34009ad2ce6357f88b7e3cd7d206822a75b4e")

get_github_stats <- function(url = url, path = path) {
  res <- rbind()
  for (p in path) {
    raw.result <- GET(url = url, path = p) # GitHub API repo: 99e34009ad2ce6357f88b7e3cd7d206822a75b4e
    this.raw.content <- rawToChar(raw.result$content)
    this.content <- fromJSON(this.raw.content)
    res <- rbind(res, c(this.content$name, ifelse(is.null(this.content$description), "", this.content$description), paste0("https://github.com/", this.content$full_name), this.content$stargazers_count, this.content$subscribers_count, this.content$forks_count))
    Sys.sleep(1)
  }
  res <- as.data.frame(res)
  colnames(res) <- c("Name", "Description", "URL", "Stars", "Watchers", "Forks")
  # Make stats numeric
  res$Stars     <- as.numeric(res$Stars)
  res$Watchers  <- as.numeric(res$Watchers)
  res$Forks     <- as.numeric(res$Forks)
  # Remove non-ascii characters from the description
  res$Description <- sapply(res$Description, function(x) gsub("[^[:alnum:][:blank:]?&/\\-]", "", x)) %>% unname
  # Sort by the number of stars
  res <- res[order(res$Stars, decreasing = TRUE), ]
  rownames(res) <- NULL
  return(res)
}