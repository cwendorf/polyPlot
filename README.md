
# `polyPlot` 

## A Tool for Visualizing Distributional Statistics

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

`polyPlot` is a small R package that offers a modified version of Seier and Bonett's (2011) polyplot, a visualization tool for various distributional summary statistics.

![A polyPlot plus a Histogram](./docs/figures/CoverImage.png)

### Installation

This package is not currently on CRAN, but can be installed and loaded using these R commands:

``` r
if (!require(remotes)) install.packages("remotes")
remotes::install_github("cwendorf/polyPlot")
library(polyPlot)
```

If you do not wish a full install, the latest functions can be made available using this R command:

```r
source("http://raw.githubusercontent.com/cwendorf/polyPlot/main/source-polyPlot.R")
```

### Usage

This package contains a set of materials to demonstrate its use:

- [Introduction](./docs/README.md): Explanation of the basic and advanced polyPlot functions
- [Exploring Data](./docs/ExploringData.md): Examples of using polyPlot to explore nonnormal data

### Contact

- GitHub Issues: [https://github.com/cwendorf/polyPlot/issues](https://github.com/cwendorf/polyPlot/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://github.com/cwendorf](https://github.com/cwendorf)

### Citation

Wendorf, C.A. (2022). *polyPlot: A tool for visualizing distributional statistics* [R Package]. [https://github.com/cwendorf/polyPlot](https://github.com/cwendorf/polyPlot)
