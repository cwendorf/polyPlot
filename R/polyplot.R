# polyPlot
## Modified version of Seier & Bonett's (2011) polyplot

.tcol <- function(color, percent = 30, name = NULL) {
  # Create transparent versions of colors
  rgb.val <- col2rgb(color)
  tcol <- rgb(rgb.val[1], rgb.val[2], rgb.val[3], max = 255, alpha = (percent) * 255 / 100, names = name)
  invisible(tcol)
}

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
