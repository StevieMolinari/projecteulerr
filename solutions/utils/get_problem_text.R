library(stringr)
htmlFormatters = c(
    "<p>", "</p>", "<br />",
    "<sup>", "</sup>", '<p class="center">',
    "<var>", "</var>", "</sub>"
)

get_problem_text <- function(problem){
    problemUrl = paste0("https://projecteuler.net/problem=", problem)
    problemHtmlLines = readLines(problemUrl)

    titleLineInd = str_which(problemHtmlLines, "<h2>")
    startEndMatrix = problemHtmlLines[titleLineInd] %>%
        str_locate(c("<h2>", "</h2>"))

    problemTitle = problemHtmlLines[titleLineInd] %>%
        str_sub(start = startEndMatrix[1, 2]+1, end = startEndMatrix[2, 1]-1)

    problemLineStart = str_which(problemHtmlLines, "class=\"problem_content\"") + 1
    problemLineEnd = str_which(problemHtmlLines, "<!--end_content-->") - 3
    problemLines = problemHtmlLines[problemLineStart:problemLineEnd] %>%
        str_replace_all(paste(htmlFormatters, collapse = "|"), "") %>%
        str_replace_all("<sub>", "_") %>%
        remove_empty_lines()

    cat(
        paste0("# Problem ", problem, ": ", problemTitle, "\n#\n"),
        paste("#",  problemLines, "\n#\n"),
        sep = ""
    )
}

remove_empty_lines <- function(lines){
    lines[str_trim(lines) != ""]
}

get_problem_text(44)

