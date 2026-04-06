# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## PolyPlot Visualization

### Description

Generates an enhanced polyplot for a numeric vector, overlaying key descriptive statistics (range, quartiles, mean/SD, trimmed mean/SD) and optionally displaying a histogram or density curve in the background.

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
- **`type`**: Character string specifying what to plot in the background. Options are: "none" (default) for no background plot, or "frequency" to add a histogram,
- **`main`**: Main title for the plot. If NULL, a default is generated based on type.
- **`xlab`**: Label for the x-axis. If NULL, the variable name is used.
- **`ylab`**: Label for the y-axis. If NULL, a default is used based on type.
- **`xlim`**: Numeric vector of length 2 for custom x-axis limits.
- **`ylim`**: Numeric vector of length 2 for custom y-axis limits.
- **`values`**: Logical; whether to display numerical values on the plot. Default is TRUE.
- **`col`**: Color used for the plot points, labels, and segments. Default is "black".
- **`bg`**: Background color for the histogram or density polygon. Default is "gray60".
- **`cex`**: Scaling factor for point symbols. Default is 1.2.
- **`digits`**: Number of decimal places to use when displaying numeric labels. Default is 2.

### Details

The plot overlays four statistical layers, each represented by a line and three key values:

- Range: Minimum, mean, and maximum.
- Quartiles: Q1, median, and Q3.
- Mean/SD: Mean and one standard deviation around it.
- Trimmed Mean/SD: Trimmed mean and one trimmed standard deviation.

Segments are drawn to connect the corresponding statistics across layers to emphasize shape and skewness. Background can include a histogram (frequency) or a density curve (density).

### Value

Invisibly returns NULL. Called for its side effect of producing a plot.

### Examples

```r
set.seed(42)
x <- rnorm(100)
polyPlot(x, type = "density", col = "blue", bg = "lightblue")
```
