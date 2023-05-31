resourcesPath = "https://projecteuler.net/project/resources/"
problemPrefix = "https://projecteuler.net/problem="

dataUrls = c(
    "008" = paste0(problemPrefix, "8"),
    "011" = paste0(problemPrefix, "11"),
    "013" = paste0(problemPrefix, "13"),
    "018" = paste0(problemPrefix, "18"),
    "022" = paste0(resourcesPath, "p022_names.txt"),
    "042" = paste0(resourcesPath, "p042_words.txt"),
    "054" = paste0(resourcesPath, "p054_poker.txt")
)

dataObjects = c(
    "008" = "number",
    "011" = "grid",
    "013" = "numbers",
    "018" = "triangle",
    "022" = "names",
    "042" = "words",
    "054" = "pokerHands"
)

dataTypes = c(
    "008" = "character",
    "011" = "numeric matrix",
    "013" = "character vector",
    "018" = "numeric matrix",
    "022" = "character vector",
    "042" = "character vector",
    "054" = "charcter matrix"
)

dataDescriptions = list(
    "054" = c(
        "#' A character matrix with 1,000 rows and 10 columns. The first five columns contain the cards for the first player and the last five columns contain the cards for the second player:",
        "#' \\describe{",
        "#'   \\item{Pi_Cj}{the jth card for the ith player (e.g the `P1_C3` column contains the first player's 3rd cards)}",
        "#' }"
    )
)




