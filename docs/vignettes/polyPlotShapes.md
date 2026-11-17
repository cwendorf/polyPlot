# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## polyPlot Shapes

The examples below show how the polyplot represents positive and negative skew, as well as a bimodal distribution, alongside the underlying distribution. Histograms and density curves provide different views of distributional shape.

- [Positively Skewed Data](#positively-skewed-data)
- [Negatively Skewed Data](#negatively-skewed-data)
- [Bimodal Data](#bimodal-data)

------------------------------------------------------------------------

### Positively Skewed Data

For example, simulate some positively skewed data. Use `polyPlot` to show the statistical layers with a frequency histogram and a density curve.

``` r
Scores <- round(rbeta(100, 2, 5) * 20, 0)
polyPlot(Scores, type = "frequency", main = "PolyPlot and Histogram for Positively Skewed Data")
```

![](figures/Shapes-Positive-1.png)<!-- -->

``` r
polyPlot(Scores, type = "density", main = "PolyPlot and Density for Positively Skewed Data")
```

![](figures/Shapes-Positive-2.png)<!-- -->

### Negatively Skewed Data

As another example, simulate some negatively skewed data. Use `polyPlot` to show the statistical layers with a frequency histogram and a density curve.

``` r
Scores <- round(rbeta(100, 5, 2) * 20, 0)
polyPlot(Scores, type = "frequency", main = "PolyPlot and Histogram for Negatively Skewed Data")
```

![](figures/Shapes-Negative-1.png)<!-- -->

``` r
polyPlot(Scores, type = "density", main = "PolyPlot and Density for Negatively Skewed Data")
```

![](figures/Shapes-Negative-2.png)<!-- -->

### Bimodal Data

As a final example, simulate some bimodal data. The histogram and
density curve each provide a view of its two peaks.

``` r
Scores <- c(round(rnorm(50, 7, 1), 0), round(rnorm(50, 13, 1), 0))
polyPlot(Scores, type = "frequency", main = "PolyPlot and Histogram for Bimodal Data")
```

![](figures/Shapes-Bimodal-1.png)<!-- -->

``` r
polyPlot(Scores, type = "density", main = "PolyPlot and Density for Bimodal Data")
```

![](figures/Shapes-Bimodal-2.png)<!-- -->
