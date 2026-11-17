# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## polyPlot Overview

A standard polyPlot presents several summaries of a distribution as
separate rows. This overview shows how to create a basic plot and
interpret those rows.

- [Basic polyPlot](#basic-polyplot)
- [Interpretation](#interpretation)

------------------------------------------------------------------------

### Basic polyPlot

First, simulate a set of 100 scores from a normal distribution, then create a polyPlot.

``` r
Scores <- round(rnorm(100, 10, 2), 0)
polyPlot(Scores)
```

![](./figures/Overview-Default-1.png)<!-- -->

Use `polyStats` to see the values represented in the plot. This is useful when `values = FALSE` suppresses the row and numeric labels.

``` r
polyStats(Scores)
```

              Lower Middle Upper Spread
    Quartiles  9.00  10.50 12.00   1.50
    Means      9.00  10.44 11.88   1.44
    Sigmas     8.62  10.44 12.26   1.82
    Range      5.00   9.50 14.00   4.50

### Interpretation

Generally speaking, each level/row provides a different category of measures of location and spread:

- First/Top: Provides the quartiles (and median as the center) of the distribution, with the interquartile range divided by 2 as the measure of spread
- Second: Provides the means of the halves (and the whole set as the center) of the distribution, with the mean absolute deviation from the median as the measure of spread
- Third: Provides the mean (as the center) of the distribution and points +/- one standard deviation from the mean (i.e, z scores of -1 and 1), with the standard deviation as the measure of spread
- Fourth/Bottom: Provides the range (and midrange as the center) of the distribution, with the range divided by 2 as the measure of spread
