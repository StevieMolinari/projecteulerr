problemPrefix = "https://projecteuler.net/problem="
resourcesPath = "https://projecteuler.net/project/resources/"
documentsPath = "https://projecteuler.net/resources/documents/"

dataUrls = c(
    "008" = paste0(problemPrefix, "8"),
    "011" = paste0(problemPrefix, "11"),
    "013" = paste0(problemPrefix, "13"),
    "018" = paste0(problemPrefix, "18"),
    "022" = paste0(resourcesPath, "p022_names.txt"),
    "042" = paste0(resourcesPath, "p042_words.txt"),
    "054" = paste0(resourcesPath, "p054_poker.txt"),
    "067" = paste0(documentsPath, "0067_triangle.txt"),
    "079" = paste0(documentsPath, "0079_keylog.txt"),
    "081" = paste0(documentsPath, "0081_matrix.txt"),
    "082" = paste0(documentsPath, "0082_matrix.txt"),
    "083" = paste0(documentsPath, "0083_matrix.txt"),
    "089" = paste0(documentsPath, "0089_roman.txt"),
    "096" = paste0(resourcesPath, "p096_sudoku.txt"),
    "098" = paste0(documentsPath, "0098_words.txt")
)

dataObjects = c(
    "008" = "number",
    "011" = "grid",
    "013" = "numbers",
    "018" = "triangle",
    "022" = "names",
    "042" = "words",
    "054" = "pokerHands",
    "067" = "triangle",
    "079" = "keylog",
    "081" = "matrix",
    "082" = "matrix",
    "083" = "matrix",
    "089" = "romanNumerals",
    "096" = "sudokuGrids",
    "098" = "words"
)

dataTypes = c(
    "008" = "character",
    "011" = "numeric matrix",
    "013" = "character vector",
    "018" = "numeric matrix",
    "022" = "character vector",
    "042" = "character vector",
    "054" = "charcter matrix",
    "067" = "numeric matrix",
    "079" = "numeric vector",
    "081" = "numeric matrix",
    "082" = "numeric matrix",
    "083" = "numeric matrix",
    "089" = "character vector",
    "096" = "list of numeric matrices",
    "098" = "character vector"
)

dataDescriptions = list(
    "054" = c(
        "#' A character matrix with 1,000 rows and 10 columns. The first five columns contain the cards for the first player and the last five columns contain the cards for the second player:",
        "#' \\describe{",
        "#'   \\item{Pi_Cj}{the jth card for the ith player (e.g the `P1_C3` column contains the first player's 3rd cards)}",
        "#' }"
    )
)




