# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## A Tool for Visualizing Distributional Statistics

[![Minimal R Version](https://img.shields.io/badge/R%3E%3D-3.6.2-blue?style=for-the-badge)](https://cran.r-project.org/)
[![GitHub Release](https://img.shields.io/github/v/release/cwendorf/polyPlot?style=for-the-badge)](https://github.com/cwendorf/polyPlot/releases/latest)
[![Project Status](https://img.shields.io/badge/Status-Inactive-orange?style=for-the-badge)](https://www.repostatus.org/#inactive)

### Overview

`polyPlot` is a small R package that offers a modified version of Seier and Bonett's (2011) polyplot, a visualization tool for various distributional summary statistics.

![A polyPlot plus a Histogram](./docs/figures/CoverImage.png)

### Installation

This package is not currently available on CRAN. It can be installed directly from GitHub:

``` r
if (!requireNamespace("remotes", quietly = TRUE)) install.packages("remotes")
remotes::install_github("cwendorf/polyPlot")
library(polyPlot)
```

If you prefer not to install the package, you can load the current functions directly:

```r
source("https://raw.githubusercontent.com/cwendorf/polyPlot/main/source-polyPlot.R")
```

### Usage

This package includes the following documentation:

- [Introduction](./docs/README.md): Overview of polyPlot and its capabilities.
- [Reference](./docs/man/README.md): Documentation for the package functions.
- [Articles](./docs/vignettes/README.md): Examples using polyPlot to explore data.

### Citation

Wendorf, C.A. (2022). *polyPlot: A tool for visualizing distributional statistics* [R Package]. [https://github.com/cwendorf/polyPlot](https://github.com/cwendorf/polyPlot)
