# Problem 22: Names scores
#
# Using names.txt, a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order. Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
#
# For example, when the list is sorted into alphabetical order, COLIN, which is worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
#
# What is the total of all the name scores in the file?

library(projecteulerr)

letterDict = setNames(1:26, LETTERS)
get_name_score <- function(name){
    sum(letterDict[str_split(name, "")[[1]]])
}
names_p22 = read_data(problem = 22) %>% sort()
nNames = length(names_p22)
sum(sapply(names_p22, get_name_score) * 1:nNames)

