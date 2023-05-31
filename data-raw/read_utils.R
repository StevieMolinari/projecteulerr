library(magrittr)
library(stringr)

split_format_words <- function(words){
    words %>%
        stringr::str_split(pattern = ",") %>%
        unlist() %>%
        stringr::str_replace_all('"', '')
}

read_lines_quietly <- function(url){
    readLines(con = url, warn = FALSE)
}

split_words_from_camel_case <- function(camelCaseWords){
    splitWords <- camelCaseWords %>%
        stringr::str_replace_all("([a-z])([A-Z])", "\\1 \\2")
    splitWords_lower <- str_to_lower(splitWords)
    return(paste(splitWords_lower, collapse = " "))
}

rename_columns <- function(df, colNames){
    colnames(df) = colNames
    return(df)
}

subset_lines_by_patterns <- function(lines, startPattern, stopPattern) {
    startInd = str_which(lines, startPattern)
    stopInd = str_which(lines, stopPattern)
    if(length(c(startPattern, stopPattern)) != 2){
        stop("Start and stop patterns don't return two hits")
    }
    lines[startInd:stopInd]
}

replace_values <- function(x, value, replacement){
    x[x == value] = replacement
    x
}

matrix_as_numeric <- function(matrix){
    matrix %>%
        as.numeric() %>%
        matrix(nrow = nrow(matrix), ncol = ncol(matrix))
}



