## Advanced Tutorial for PolyPlot2

The following code demonstrates some of the available options for customizing the PolyPlot. It also demonstrates how the PolyPlot does a good job of approximating the shape of the underlying distribution.

### The PolyPlot for Positively Skewed Data

Simulate some positively skewed data. Then use `polyStats` get the values separate from the `polyPlot` (which in this case features a frequency histogram).

```r
Scores <- round(rbeta(100,2,5)*20,0)
polyStats(Scores,digits=3)
```

```
##           Lower Middle  Upper Spread
## Quartiles 3.000   5.00  8.000  2.500
## Means     3.260   5.94  8.620  2.680
## Z Scores  2.668   5.94  9.212  3.272
## Range     1.000   8.50 16.000  7.500
```

```r
polyPlot(Scores,type="frequency",col="blue",bg="goldenrod",values=FALSE,main="PolyPlot and Histogram for Positively Skewed Data")
```

![](figures/Advanced-Positive-1.png)<!-- -->

### The PolyPlot for Negatively Skewed Data

Simulate some negatively skewed data. Then use `polyStats` get the values separate from the `polyPlot` (which in this case features a density curve).

```r
Scores <- round(rbeta(100,5,2)*20,0)
polyStats(Scores,digits=3)
```

```
##            Lower Middle  Upper Spread
## Quartiles 12.000  15.00 16.000  2.000
## Means     11.700  14.16 16.620  2.460
## Z Scores  11.089  14.16 17.231  3.071
## Range      6.000  13.00 20.000  7.000
```

```r
polyPlot(Scores,type="density",col="blue",bg="goldenrod",values=FALSE,main="PolyPlot and Density for Negatively Skewed Data")
```

![](figures/Advanced-Negative-1.png)<!-- -->

### The PolyPlot for Bimodal Data

Simulate some bimodal data. The values are presented on each `polyPlot` to show their utility in explaining the underlying data.

```r
Scores <- c(round(rnorm(50,7,1),0),round(rnorm(50,13,1),0))
polyPlot(Scores,type="frequency",col="blue",bg="goldenrod",values=TRUE,main="PolyPlot and Histogram for Bimodal Data")
```

![](figures/Advanced-Bimodal-1.png)<!-- -->

```r
polyPlot(Scores,type="density",col="blue",bg="goldenrod",values=TRUE,main="PolyPlot and Density for Bimodal Data")
```

![](figures/Advanced-Bimodal-2.png)<!-- -->
