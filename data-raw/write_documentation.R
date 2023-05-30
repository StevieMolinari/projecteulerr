source("data-raw/data_constants.R")

write_data_documentation <- function(problem){
    object = dataObjects[problem]
    objectWords = split_words_from_camel_case(object)
    datasetName = paste0("p", problem, "_", object)
    p_num = as.numeric(problem)
    if(is.null(dataDescriptions[[problem]])){
        description = paste0(
            "#' The ", objectWords, " (as a ", dataTypes[problem],
            ") provided in Project Euler problem ", p_num, "."
        )
    } else{
        description = dataDescriptions[[problem]]
    }

    c(
        paste("#' Problem", p_num, object),
        "#'",
        paste0(
            "#' The ", object, " provided in Project Euler problem ",
            p_num, "."
        ),
        paste0("#' @name ", datasetName),
        "#' @docType data",
        paste0("#' @format ## `", datasetName, "`"),
        description,
        paste0("#' @source <", dataUrls[problem], ">"),
        paste0('"', datasetName, '"'),
        ""
    )
}

# write_data_documentation("008")
