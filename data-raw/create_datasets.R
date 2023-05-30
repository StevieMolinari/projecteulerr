## writes data and writes documentation for Project Euler data

source("data-raw/read_problems.R")
source("data-raw/write_documentation.R")

dataNames = paste0("p", names(dataObjects), "_", dataObjects)
docLines = character()

for(problem in names(dataObjects)){
    dataName = paste0("p", problem, "_", dataObjects[problem])
    assign(dataName, get(paste0("read_p", problem, "_data"))())
    save(list = dataName, file = paste0("data/", dataName, ".rda"))
    docLines = c(docLines, write_data_documentation(problem))
}

writeLines(docLines, "R/dataset_documentation.R")










