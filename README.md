
<!-- README.md is generated from README.Rmd. Please edit that file -->

# projecteulerr

<!-- badges: start -->
<!-- badges: end -->

Hey there! This nifty package is tailor-made for Project Euler, the
ultimate playground where math meets programming. Eager to flex your
math muscles or sprinkle some programming pixie dust on your
calculations? You’re in the right place!

We’re not here to solve problems for you but to toss you the tools to
craft your own solutions. Think of this package as your toolkit for
those math-programming adventures. From essential functions to
intriguing data sets, it’s all here!

Are you’re feeling a bit lost? Are craving a little inspiration?? Check
out our “This may be useful for…” corner in the function docs.

Our algorithms? They’re the ‘friendly neighborhood’ kind. We’ve picked
simplicity over speed, so even if you’re new to this, you’ll catch on
quick. And for the extra-curious, we’ve got chatty function docs and fun
vignettes spilling the beans on how these algorithms tick.

And yes, we’ve got extra vignettes for the recurring stars of our show,
like efficient modular arithmetic. So buckle up, and get ready to take
your math and programming skills on a joyride!

## Installation

You can install the development version of projecteulerr from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("StevieMolinari/projecteulerr")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(projecteulerr)
## basic example code
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this. You could also
use GitHub Actions to re-render `README.Rmd` every time you push. An
example workflow can be found here:
<https://github.com/r-lib/actions/tree/v1/examples>.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.
