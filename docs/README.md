# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## Introduction

`polyPlot` is a small R package that offers a modified version of Seier and Bonett's (2011) polyplot, a visualization tool for various distributional summary statistics.

- [Overview](#overview)
- [Resources](#resources)
- [References](#references)

---

### Overview

Distribution summaries can be difficult to compare when measures of center and spread are viewed separately. A polyplot combines multiple measures of locaation and spread into a single visualization. But just as importantly, `polyPlot` layers these summaries over a histogram or density curve so their relationships are visible together. `polyStats` returns the corresponding statistics in a structured matrix.

![](./vignettes/figures/CoverImage.png)<!-- -->

Further explanation of the math behind the PolyPlot is available in Seier and Bonett (2011).

### Resources

- [Reference](./man/README.md): Documentation for the package functions.
- [Articles](./vignettes/README.md): Guided examples and applications of polyPlot.

### References

Seier, E., & Bonett, D. G. (2011). A polyplot for visualizing location, spread, skewness, and kurtosis. _The American Statistician, 65_(4), 258–261. http://www.jstor.org/stable/23339553
