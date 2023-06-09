library(magrittr)
library(stringr)

source("data-raw/data_constants.R")
source("data-raw/read_utils.R")

read_p008_data <- function(){
    dataUrls["008"] %>%
        readLines() %>%
        subset_lines_by_patterns(
            startPattern = "73167176531330624919",
            stopPattern = "71636269561882670428"
        ) %>%
        str_sub(1, 50) %>%
        paste0(collapse = "")
}

read_p011_data <- function(){
    dataUrls["011"] %>%
        readLines() %>%
        subset_lines_by_patterns(
            startPattern = "78 17",
            stopPattern = "01 70"
        ) %>%
        str_replace_all("<[^>]*>", "") %>%
        str_split_fixed(" ", n = 20) %>%
        matrix_as_numeric()
}

read_p013_data <- function(){
    dataUrls["013"] %>%
        readLines() %>%
        subset_lines_by_patterns(
            startPattern = "37107287533902102798",
            stopPattern = "53503534226472524250"
        ) %>%
        str_replace_all("<[^>]*>", "")
}

read_p018_data <- function(){
    dataUrls["018"] %>%
        readLines() %>%
        subset_lines_by_patterns(
            startPattern = "75<br>",
            stopPattern = "04 62 98"
        ) %>%
        str_replace_all("<[^>]*>", "") %>%
        str_split_fixed(" ", 15) %>%
        replace_values("", NA) %>%
        matrix_as_numeric()
}

read_p022_data <- function(){
    dataUrls["022"] %>%
        read_lines_quietly() %>%
        split_format_words()
}

read_p042_data <- function(){
    dataUrls["042"] %>%
        read_lines_quietly() %>%
        split_format_words()
}

read_p054_data <- function(){
    dataUrls["054"] %>%
        read_lines_quietly() %>%
        str_split_fixed(" ", n = 10) %>%
        rename_columns(
            c(paste0("P1_C", 1:5), paste0("P2_C", 1:5))
        )
}

read_p067_data <- function(){
    dataUrls["067"] %>%
        read_lines_quietly() %>%
        str_split_fixed(" ", n = 100) %>%
        replace_values("", NA) %>%
        matrix_as_numeric()
}

read_p079_data <- function(){
    dataUrls["079"] %>%
        read_lines_quietly() %>%
        as.numeric()
}

read_p081_data <- function(){
    dataUrls["081"] %>%
        read_lines_quietly() %>%
        str_split_fixed(",", n = 80) %>%
        matrix_as_numeric()
}

read_p082_data <- function(){
    dataUrls["082"] %>%
        read_lines_quietly() %>%
        str_split_fixed(",", n = 80) %>%
        matrix_as_numeric()
}

read_p083_data <- function(){
    dataUrls["083"] %>%
        read_lines_quietly() %>%
        str_split_fixed(",", n = 80) %>%
        matrix_as_numeric()
}

read_p089_data <- function(){
    dataUrls["089"] %>%
        read_lines_quietly()
}

read_p096_data <- function(){
    dataUrls["096"] %>%
        read_lines_quietly() %>%
        parse_raw_sudoku_grids()
}

read_p098_data <- function(){
    dataUrls["098"] %>%
        read_lines_quietly() %>%
        split_format_words()
}

