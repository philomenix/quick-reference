library(stringr)

paths <- list.files(recursive = TRUE) %>% 
  .[str_detect(., "pages\\/")] %>% 
  .[str_detect(., "\\.html")]

names <- paths %>% 
  str_remove("pages\\/") %>% 
  str_remove("\\.html") %>% 
  str_replace_all("\\-", " ") %>% 
  str_to_title()

root <- "./"

md <- paste0("[", names, "](", root, paths, ")") %>% 
  sort()

writeLines(md, "./toc/toc.md", sep = "\n")