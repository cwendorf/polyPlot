# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## Modified PolyPlot Visualization

### Description

Generates an enhanced polyplot for a numeric vector, overlaying quartiles, means, sigmas, and range, and optionally displaying a histogram or density curve in the background.

### Usage

```r
polyPlot(
  x,
  type = "none",
  main = NULL,
  xlab = NULL,
  ylab = NULL,
  xlim = NULL,
  ylim = NULL,
  values = TRUE,
  col = "black",
  bg = "gray60",
  cex = 1.2,
  digits = 2
)
```

### Arguments

- **`x`**: A (non-empty) numeric vector of data values.
- **`type`**: Character string specifying what to plot in the background: `"none"` (default) for no background plot, `"frequency"` to add a histogram, or `"density"` to add a kernel density estimate.
- **`main`**: Main title for the plot. If NULL, a default is generated based on type.
- **`xlab`**: Label for the x-axis. If NULL, the variable name is used.
- **`ylab`**: Label for the y-axis. If NULL, a default is used based on type.
- **`xlim`**: Numeric vector of length 2 for custom x-axis limits.
- **`ylim`**: Numeric vector of length 2 for custom y-axis limits.
- **`values`**: Logical; whether to display row labels and numerical values on the plot. Default is TRUE.
- **`col`**: Color used for the plot points, labels, and segments. Default is "black".
- **`bg`**: Background color for the histogram or density polygon. Default is "gray60".
- **`cex`**: Scaling factor for point symbols. Default is 1.2.
- **`digits`**: Number of decimal places to use when displaying numeric labels. Default is 2.

### Details

The plot overlays the four rows returned by `polyStats`: **Quartiles**, **Means**, **Sigmas**, and **Range**. When `values = TRUE`, these row names are displayed beside their corresponding layers along with the numerical values. Segments connect corresponding statistics across layers to emphasize shape and skewness. Background can include a histogram (frequency) or a density curve (density).

### Value

Invisibly returns NULL. Called for its side effect of producing a plot.

### Examples

```r
set.seed(42)
x <- rnorm(100)
polyPlot(x, type = "density", col = "blue", bg = "lightblue")
```
