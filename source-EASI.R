# Purpose: Source R Functions from a GitHub Repository
# Updated: 2026-11-10

source.functions <- function(username, repo, branch = "main", folder = "R") {
  api_url <- paste0("https://api.github.com/repos/", username, "/", repo, "/contents/", folder, "?ref=", branch  )
  listing <- paste(readLines(api_url, warn = FALSE), collapse = "")
  files <- regmatches(listing, gregexpr('"name"[[:space:]]*:[[:space:]]*"[^"]+\\.R"', listing))[[1]]
  sizes <- regmatches(listing, gregexpr('"size"[[:space:]]*:[[:space:]]*[0-9]+', listing))[[1]]
  if (!length(files)) stop("No R source files were found in the repository folder.")
  names <- sub('.*"name"[[:space:]]*:[[:space:]]*"([^"]+)".*', "\\1", files)
  for (file in names) source(paste0("https://raw.githubusercontent.com/", username, "/", repo, "/", branch, "/", folder, "/", file))
  message(sprintf("Sourced %d R files (%.1f KB).", length(names), sum(as.numeric(sub(".*:", "", sizes))) / 1024))
}

# Call for this Repo
source.functions("cwendorf", "EASI")
