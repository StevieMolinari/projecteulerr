library(magrittr)
library(stringr)

source("data-raw/data_constants.R")
source("data-raw/read_utils.R")

read_p008_data <- function(){
    html_lines = readLines(dataUrls["008"])
    start_ind = html_lines %>%
        stringr::str_which(
            "73167176531330624919225119674426574742355349194934"
        )
    stop_ind = html_lines %>%
        stringr::str_which(
            "71636269561882670428252483600823257530420752963450"
        )
    html_lines[start_ind:stop_ind] %>%
        stringr::str_sub(1, 50) %>% paste0(collapse = "")
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


