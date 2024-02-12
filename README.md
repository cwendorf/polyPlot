
# `polyPlot` 

## A Tool for Visualizing Distributional Statistics

[![minimal R version](https://img.shields.io/badge/R%3E%3D-3.6.2-6666ff.svg)](https://cran.r-project.org/)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

### Overview

**polyPlot** is a small R package that offers a modified version of Seier and Bonett's (2011) polyplot, a visualization tool for various distributional summary statistics.

<a href="https://github.com/cwendorf/polyPlot">
<p align="center"><kbd><img src="docs/figures/polyPlotCoverImage.png"></kbd></p>
</a>

### Installation

This package is not currently on CRAN, but can be installed and loaded using these R commands:

``` r
install.packages("remotes")
remotes::install_github("cwendorf/polyPlot")
library(polyPlot)
```

If you do not wish a full install, the latest functions can be made available using these R commands:

```r
source("http://raw.githubusercontent.com/cwendorf/polyPlot/main/source-polyPlot.R")
```

### Usage

The [Basic Tutorial for polyPlot](./docs/polyPlotBasic.md) provides:

- An explanation of the basic polyplot
- Methods for adding histograms and density curves to the polyplot

The [Advanced Tutorial for polyPlot](./docs/polyPlotAdvanced.md) provides:

- An explanation of additional features of the polyplot functions
- Examples of the polyplot for various distributional shapes

### Contact Me

- GitHub Issues: [https://github.com/cwendorf/polyPlot/issues](https://github.com/cwendorf/polyPlot/issues) 
- Author Email: [cwendorf@uwsp.edu](mailto:cwendorf@uwsp.edu)
- Author Homepage: [https://cwendorf.github.io](https://cwendorf.github.io)

### Citation

Wendorf, C.A. (2022). *polyPlot: A tool for visualizing distributional statistics* [R Package]. [https://github.com/cwendorf/polyPlot](https://github.com/cwendorf/polyPlot)
