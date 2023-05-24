library(stringr)
library(magrittr)

resource_path = "https://projecteuler.net/project/resources/"
problem_prefix = "https://projecteuler.net/problem="

data_urls = c(
    "8" = paste0(problem_prefix, "8"),
    "22" = paste0(resource_path, "p022_names.txt"),
    "42" = paste0(resource_path, "p042_words.txt"),
    "54" = paste0(resource_path, "p054_poker.txt")

)

test_problem_argument <- function(problem){
    stopifnot(
        is.numeric(problem),
        is.na(problem) |
            (problem > 0 & problem == round(problem))
    )
}

read_data <- function(problem=NA_integer_){
    test_problem_argument(problem = problem)
    if(problem %in% names(data_urls)){
        return(
            get(paste0("read_p", problem))()
        )
    } else if(!is.na(problem)){
        warning("no data found for problem ", problem, ".")
        return(NULL)
    } else{
        warning("couldn't find data.")
        return(NULL)
    }
}

split_format_words <- function(words){
    words %>%
        str_split(pattern = ",") %>%
        unlist() %>%
        str_replace_all('"', '')
}

read_p8 <- function(){
    html_lines = readLines(data_urls["8"])
    start_ind = html_lines %>%
        str_which("73167176531330624919225119674426574742355349194934")
    stop_ind = html_lines %>%
        str_which("71636269561882670428252483600823257530420752963450")
    html_lines[start_ind:stop_ind] %>%
        str_sub(1, 50) %>% paste0(collapse = "")
}


read_p22 <- function(){
    data_urls["22"] %>%
        readLines() %>%
        suppressWarnings() %>%
        split_format_words()
}

read_p42 <- function(){
    data_urls["42"] %>%
        readLines() %>%
        suppressWarnings() %>%
        split_format_words()
}


read_p54 <- function(){
    readLines(data_urls["54"])
}






