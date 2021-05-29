
<!-- README.md is generated from README.Rmd. Please edit that file -->

# pipenvr

<!-- badges: start -->

[![Project Status: WIP – Initial development is in progress, but there
has not yet been a stable, usable release suitable for the
public.](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![R build
status](https://github.com/drdsdaniel/pipenvr/workflows/R-CMD-check/badge.svg)](https://github.com/drdsdaniel/pipenvr/actions)
[![CRAN
status](https://www.r-pkg.org/badges/version/pipenvr)](https://CRAN.R-project.org/package=pipenvr)
[![Codecov test
coverage](https://codecov.io/gh/drdsdaniel/pipenvr/branch/master/graph/badge.svg)](https://codecov.io/gh/drdsdaniel/pipenvr?branch=master)
<!-- badges: end -->

The goal of pipenvr is to provide a compatibility layer between Python
package `pipenv` and R package `reticulate`.

## Installation

pipenvr is not yet in CRAN.

<!-- You can install the released version of pipenvr from [CRAN](https://CRAN.R-project.org) with: -->
<!-- ``` r -->
<!-- install.packages("pipenvr") -->
<!-- ``` -->

You can install the development version from
[GitHub](https://github.com/) with:

``` r
tryCatch(
  library(remotes),
  error = function(e){
    install.packages('remotes')
  }
)
remotes::install_github("drdsdaniel/pipenvr")
```

## Usage

See the package site [Get started]() section.

## Contributing

Have a feedback or want to contribute?

Please take a look at the [contributing
guidelines](https://drdsdaniel.github.io/pipenvr/CONTRIBUTING.html)
before filing an issue or pull request.

Please note that the pipenvr project is released with a [Contributor
Code of
Conduct](https://contributor-covenant.org/version/2/0/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
