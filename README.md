
<!-- README.md is generated from README.Rmd. Please edit that file -->

# d3.format

> Interface to [d3.format](https://github.com/d3/d3-format) JavaScript
> library to format numbers for human consumption. The goal is to use
> the same way to format numbers in different htmlwidget packages such
> as [highcharter](https://github.com/jbkunst/highcharter),
> [apexcharter](https://github.com/dreamRs/apexcharter),
> [highcharter](https://github.com/jbkunst/highcharter) and more.

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

## Installation

You can install the development version from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("dreamRs/d3.format")
```

## Example

Format numbers like in d3 :

``` r
library(d3.format)

# thousand separator
d3_format(",")(1e9)
#> [1] "1,000,000,000"

# Percentage
d3_format("%")(0.12)
#> [1] "12.000000%"

# SI prefix
d3_format(".1s")(c(1e-3, 0, 1e3, 1e6, 1e9, 1e12))
#> [1] "1m" "0"  "1k" "1M" "1G" "1T"

# Currency
d3_format("$")(100)
#> [1] "$100"

# Fixed width and centered
d3_format("^20")(42)
#> [1] "         42         "
```

More examples [here](https://observablehq.com/@d3/d3-format).
