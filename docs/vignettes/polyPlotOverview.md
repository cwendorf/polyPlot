# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## polyPlot Overview

A standard polyPlot presents several summaries of a distribution as
separate rows. This overview shows how to create a basic plot and
interpret those rows.

- [Basic polyPlot](#basic-polyplot)
- [Numerical Summary](#numerical-summary)

------------------------------------------------------------------------

### Basic polyPlot

First, simulate a set of 100 scores from a normal distribution, then create a polyPlot.

``` r
Scores <- round(rnorm(100, 10, 2), 0)
polyPlot(Scores)
```

![](./figures/Overview-Default-1.png)<!-- -->

Generally speaking, each level/row provides a different category of measures of location and spread:

- First/Top: Provides the quartiles (and median as the center) of the distribution, with the interquartile range divided by 2 as the measure of spread
- Second: Provides the means of the halves (and the whole set as the center) of the distribution, with the mean absolute deviation from the median as the measure of spread
- Third: Provides the mean (as the center) of the distribution and points +/- one standard deviation from the mean (i.e, z scores of -1 and 1), with the standard deviation as the measure of spread
- Fourth/Bottom: Provides the range (and midrange as the center) of the distribution, with the range divided by 2 as the measure of spread

### Numerical Summary

Use `polyStats` to see the values represented in the plot. This is useful in cases where the user suppresses the values from the plot.

``` r
polyStats(Scores, digits = 3)
```

              Lower Middle Upper Spread
    Quartiles  9.00  10.00 11.00   1.00
    Means      8.94  10.14 11.34   1.20
    Z Scores   8.58  10.14 11.70   1.56
    Range      6.00   9.50 13.00   3.50
