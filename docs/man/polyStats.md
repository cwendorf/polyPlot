# [`polyPlot`](https://github.com/cwendorf/polyPlot/)

## PolyPlot Statistics

### Description

Computes a structured summary of key statistics used in polyPlot visualizations. The function returns quartile-based, mean-based, z-score-based, and range-based statistics, each with associated spread measures.

### Usage

```r
polyStats(x, digits = 2)
```

### Arguments

- **`x`**: A non-empty numeric vector of data values.
- **`digits`**: Integer; number of decimal places to round the statistics. Default is 2.

### Details

The function returns a matrix with 4 rows and 4 columns, capturing four sets of descriptive statistics:

- Quartiles: First quartile (Q1), median, third quartile (Q3), and half the interquartile range (IQR/2).
- Means: Mean of the lower half, overall mean, mean of the upper half, and mean absolute deviation from the median.
- Z Scores: Mean minus one standard deviation, mean, mean plus one standard deviation, and the standard deviation.
- Range: Minimum, mid-range, maximum, and half the range.

Each row in the result corresponds to a statistical layer, and columns represent:

- Lower: lower bound of the range
- Middle: central value (e.g., median or mean)
- Upper: upper bound of the range
- Spread: the spread or dispersion metric associated with the layer

### Value

A numeric matrix with row names: "Quartiles", "Means", "Z Scores", "Range", and column names: "Lower", "Middle", "Upper", "Spread".

### Examples

```r
set.seed(123)
x <- rnorm(100)
polyStats(x)
```
