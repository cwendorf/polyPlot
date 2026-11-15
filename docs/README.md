# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## Introduction

`polyPlot` is a small R package that offers a modified version of Seier and Bonett's (2011) polyplot, a visualization tool for various distributional summary statistics.

- [Overview](#overview)
- [Resources](#resources)
- [References](#references)

---

### Overview

Distribution summaries can be difficult to compare when measures of center and spread are viewed separately. `polyPlot` layers several summaries over a histogram or density curve so their relationships are visible together. Each `polyPlot` brings together quartiles, split-half means, mean-and-standard-deviation bounds, and the range. `polyStats` returns the corresponding statistics in a structured matrix.

![A polyPlot plus a Histogram](./vignettes/figures/CoverImage.png)

              Lower Middle Upper Spread
    Quartiles  8.75  10.00 11.00   1.12
    Means      8.24   9.85 11.46   1.61
    Z Scores   7.79   9.85 11.91   2.06
    Range      5.00  10.00 15.00   5.00

### Resources

- [Reference](./man/README.md): Documentation for the package functions.
- [Articles](./vignettes/README.md): Guided examples and applications of polyPlot.

### References

Seier, E., & Bonett, D. G. (2011). A Polyplot for Visualizing Location, Spread, Skewness, and Kurtosis. _The American Statistician, 65_(4), 258–261. http://www.jstor.org/stable/23339553
