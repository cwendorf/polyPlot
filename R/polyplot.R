# polyPlot
## Modified version of Seier & Bonett's (2011) polyplot

# Create a transparent version of a color
#
# Converts a given color to an RGB value with specified transparency (alpha).
#
# @param color A color name or hex code.
# @param percent Numeric value between 0 and 100 indicating the transparency level (default is 30).
# @param name Optional name for the resulting color.
#
# @return A color string in RGB format with alpha transparency applied.
#
# @details
# The function converts the input color to its RGB components, then applies an alpha
# channel corresponding to the given transparency percentage. The resulting color can
# be used in plotting functions that support alpha transparency.
#
# @noRd
.tcol <- function(color, percent = 30, name = NULL) {
  # Create transparent versions of colors
  rgb.val <- col2rgb(color)
  tcol <- rgb(rgb.val[1], rgb.val[2], rgb.val[3], max = 255, alpha = (percent) * 255 / 100, names = name)
  invisible(tcol)
}

#' Modified PolyPlot Statistics
#'
#' Computes a structured summary of key statistics used in \code{\link{polyPlot}} visualizations. The function returns quartile-based, mean-based, z-score-based, and range-based statistics, each with associated spread measures.
#'
#' @param x A non-empty numeric vector of data values.
#' @param digits Integer; number of decimal places to round the statistics. Default is \code{2}.
#'
#' @details
#' The function returns a matrix with 4 rows and 4 columns, capturing four sets of descriptive statistics:
#' \describe{
#'   \item{\strong{Quartiles}}{First quartile (Q1), median, third quartile (Q3), and half the interquartile range (IQR/2).}
#'   \item{\strong{Means}}{Mean of the lower half, overall mean, mean of the upper half, and mean absolute deviation from the median.}
#'   \item{\strong{Z Scores}}{Mean minus one standard deviation, mean, mean plus one standard deviation, and the standard deviation.}
#'   \item{\strong{Range}}{Minimum, mid-range, maximum, and half the range.}
#' }
#'
#' Each row in the result corresponds to a statistical layer, and columns represent:
#' \itemize{
#'   \item \code{Lower}: lower bound of the range
#'   \item \code{Middle}: central value (e.g., median or mean)
#'   \item \code{Upper}: upper bound of the range
#'   \item \code{Spread}: the spread or dispersion metric associated with the layer
#' }
#'
#' @return A numeric matrix with row names: \code{"Quartiles"}, \code{"Means"}, \code{"Z Scores"}, \code{"Range"}, and column names: \code{"Lower"}, \code{"Middle"}, \code{"Upper"}, \code{"Spread"}.
#'
#' @examples
#' set.seed(123)
#' x <- rnorm(100)
#' polyStats(x)
#'
#' @seealso \code{\link{polyPlot}} for plotting these statistics visually.
#'
#' @export
polyStats <- function(x, digits = 2) {
  # Calculate polyplot statistics
  n <- length(x)
  n2 <- floor(n / 2)
  if (n %% 2 == 0) (n2m1 <- n2 + 1) else (n2m1 <- n2 + 2)
  sx <- sort(x)
  firsthalf <- sx[1:n2]
  secondhalf <- sx[n2m1:n]
  mi <- min(x)
  ma <- max(x)
  me <- (mi + ma) / 2
  range2 <- (ma - mi) / 2
  range <- c(mi, me, ma, range2)
  xmed <- median(x)
  cinco <- summary(x)
  q1 <- as.numeric(cinco[2])
  q3 <- as.numeric(cinco[5])
  iqr2 <- (q3 - q1) / 2
  quartiles <- c(q1, xmed, q3, iqr2)
  xmean <- mean(x)
  s <- sd(x)
  zn1 <- xmean - s
  zp1 <- xmean + s
  zscores <- c(zn1, xmean, zp1, s)
  mean1 <- mean(firsthalf)
  mean2 <- mean(secondhalf)
  delta <- (sum(abs(x - xmed))) / n
  means <- c(mean1, xmean, mean2, delta)
  results <- round(rbind(quartiles, means, zscores, range), digits)
  colnames(results) <- c("Lower", "Middle", "Upper", "Spread")
  rownames(results) <- c("Quartiles", "Means", "Z Scores", "Range")
  return(results)
}

#' Modified PolyPlot Visualization
#'
#' Generates an enhanced polyplot for a numeric vector, overlaying key descriptive statistics (range, quartiles, mean/SD, trimmed mean/SD) and optionally displaying a histogram or density curve in the background.
#'
#' @param x A (non-empty) numeric vector of data values.
#' @param type Character string specifying what to plot in the background. Options are:
#' \itemize{
#'   \item \code{"none"} (default): no background plot,
#'   \item \code{"frequency"}: adds a histogram,
#*   \item \code{"density"}: adds a kernel density estimate.
#' }
#' @param main Main title for the plot. If \code{NULL}, a default is generated based on \code{type}.
#' @param xlab Label for the x-axis. If \code{NULL}, the variable name is used.
#' @param ylab Label for the y-axis. If \code{NULL}, a default is used based on \code{type}.
#' @param xlim Numeric vector of length 2 for custom x-axis limits.
#' @param ylim Numeric vector of length 2 for custom y-axis limits.
#' @param values Logical; whether to display numerical values on the plot. Default is \code{TRUE}.
#' @param col Color used for the plot points, labels, and segments. Default is \code{"black"}.
#' @param bg Background color for the histogram or density polygon. Default is \code{"gray60"}.
#' @param cex Scaling factor for point symbols. Default is \code{1.2}.
#' @param digits Number of decimal places to use when displaying numeric labels. Default is \code{2}.
#'
#' @details
#' The plot overlays four statistical layers, each represented by a line and three key values:
#' \enumerate{
#'   \item \strong{Range}: Minimum, mean, and maximum.
#'   \item \strong{Quartiles}: Q1, median, and Q3.
#'   \item \strong{Mean/SD}: Mean and one standard deviation around it.
#'   \item \strong{Trimmed Mean/SD}: Trimmed mean and one trimmed standard deviation.
#' }
#' Segments are drawn to connect the corresponding statistics across layers to emphasize shape and skewness. Background can include a histogram (frequency) or a density curve (density).
#'
#' @return Invisibly returns \code{NULL}. Called for its side effect of producing a plot.
#'
#' @seealso \code{\link{polyStats}} for the underlying statistics used in plotting.
#'
#' @examples
#' set.seed(42)
#' x <- rnorm(100)
#' polyPlot(x, type = "density", col = "blue", bg = "lightblue")
#'
#' @export
polyPlot <- function(x, type = "none", main = NULL, xlab = NULL, ylab = NULL, xlim = NULL, ylim = NULL, values = TRUE, col = "black", bg = "gray60", cex = 1.2, digits = 2) {
  # Get polyplot statistics
  stats <- polyStats(x)
  # Create basic and background plots
  dens <- density(x)
  if (is.null(xlim)) {
    xlim <- c(floor(min(dens$x)), ceiling(max(dens$x)))
  }
  if (type == "frequency") {
    a <- hist(x, plot = FALSE)
    maxy <- max(a$counts)
    histborder <- bg
    histbg <- .tcol(bg, 10)
  } else {
    maxy <- max(dens$y)
    histborder <- "white"
    histbg <- "white"
  }
  if (is.null(ylim)) {
    ylim <- c(0, maxy)
  }
  if (is.null(xlab)) {
    xlab <- substitute(x)
  }
  par(mar = c(5, 5, 3, 2))
  hist(x, prob = FALSE, plot = TRUE, axes = FALSE, col = histbg, border = histborder, xlab = xlab, ylab = NULL, xlim = xlim, ylim = ylim, main = NULL)
  axis(1)
  if (type == "none") {
    if (is.null(main)) main <- "PolyPlot"
  }
  if (type == "frequency") {
    axis(2)
    if (is.null(ylab)) ylab <- "Frequency"
    if (is.null(main)) main <- "PolyPlot plus Frequency Histogram"
  }
  if (type == "density") {
    axis(2)
    if (is.null(ylab)) ylab <- "Density"
    if (is.null(main)) main <- "PolyPlot plus Density Curve"
    polygon(dens, col = .tcol(bg, 10), border = bg)
  }
  title(main = main, ylab = ylab)
  # Plot poly points and segments
  yy4 <- maxy / 48
  yy3 <- yy4 * 13
  yy2 <- yy4 * 25
  yy1 <- yy4 * 37
  xmean <- mean(x)
  fskew <- sum((x - xmean)^3)
  points(stats[1, 1:3], c(yy1, yy1, yy1), pch = 25, col = col, bg = col, cex = cex)
  segments(stats[1, 1], yy1, stats[1, 3], yy1, lwd = 2, col = col)
  points(stats[2, 1:3], c(yy2, yy2, yy2), pch = 19, col = col, cex = cex)
  segments(stats[2, 1], yy2, stats[2, 3], yy2, lty = "dashed", col = col)
  if (fskew >= 0) {
    segments(stats[2, 2], yy2, stats[2, 3], yy2, lty = "solid", lwd = 2, col = col)
  } else {
    segments(stats[2, 1], yy2, stats[2, 2], yy2, lty = "solid", lwd = 2, col = col)
  }
  points(stats[3, 2], yy3, pch = 19, col = col, cex = cex)
  segments(stats[3, 1], yy3, stats[3, 3], yy3, lty = "dashed", col = col)
  if (fskew >= 0) {
    segments(stats[3, 2], yy3, stats[3, 3], yy3, lty = "solid", lwd = 2, col = col)
  } else {
    segments(stats[3, 1], yy3, stats[3, 2], yy3, lty = "solid", lwd = 2, col = col)
  }
  points(stats[4, 1:3], c(yy4, yy4, yy4), pch = 15, col = col, cex = cex)
  segments(stats[4, 1], yy4, stats[4, 3], yy4, lwd = 2, col = col)
  # Plot poly connectors
  segments(stats[1, 1], yy1, stats[2, 1], yy2, lty = "dotted", col = col)
  segments(stats[1, 3], yy1, stats[2, 3], yy2, lty = "dotted", col = col)
  segments(stats[2, 1], yy2, stats[3, 1], yy3, lty = "dotted", col = col)
  segments(stats[2, 3], yy2, stats[3, 3], yy3, lty = "dotted", col = col)
  segments(stats[3, 1], yy3, stats[4, 1], yy4, lty = "dotted", col = col)
  segments(stats[3, 3], yy3, stats[4, 3], yy4, lty = "dotted", col = col)
  segments(stats[1, 2], yy1, stats[2, 2], yy2, lty = "dotted", col = col)
  segments(stats[2, 2], yy2, stats[3, 2], yy3, lty = "dotted", col = col)
  segments(stats[3, 2], yy3, stats[4, 2], yy4, lty = "dotted", col = col)
  # Add statistics to the plot
  if (values) {
    labels1 <- round(stats[1, 1:3], digits)
    text(labels1, yy1, labels1, cex = .8, pos = 3, col = col, font = 2, offset = 1)
    labels2 <- round(stats[2, 1:3], digits)
    text(labels2, yy2, labels2, cex = .8, pos = 3, col = col, font = 2, offset = 1)
    labels3 <- round(stats[3, 1:3], digits)
    text(labels3, yy3, labels3, cex = .8, pos = 3, col = col, font = 2, offset = 1)
    labels4 <- round(stats[4, 1:3], digits)
    text(labels4, yy4, labels4, cex = .8, pos = 3, col = col, font = 2, offset = 1)
  }
}
