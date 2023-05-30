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

# split_words_from_camel_case("theseAreSomeWords")
# split_words_from_camel_case("TheseAreSomeWords")
# split_words_from_camel_case("these")
# split_words_from_camel_case("thesearesomewords")
# split_words_from_camel_case("theseAreSomeWords OhNo")


rename_columns <- function(df, colNames){
    colnames(df) = colNames
    return(df)
}



