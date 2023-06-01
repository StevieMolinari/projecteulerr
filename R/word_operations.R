sum_letter_values <- function(
    word,
    letterVals = stats::setNames(1:26, LETTERS)
){
    check_sum_letter_values_arguments(word, letterVals)
    letters = stringr::str_split(word, "")[[1]]
    if(any(letters %notin% names(letterVals))){
        stop("Not all of letters in `word` are in `letterVals`.")
    }
    sum(letterVals[letters])
}

check_sum_letter_values_arguments <- function(word, letterVals){
    check_is_scalar(word, param = "word")
    check_is_character(word, param = "word")
    check_is_numeric(letterVals, param = "letterVals")
    if(is.null(names(letterVals))){
        stop("`letterVals` must be a named numeric.")
    }

}
