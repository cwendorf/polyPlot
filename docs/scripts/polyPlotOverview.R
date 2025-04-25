# polyPlot
## polyPlot Overview

source("http://raw.githubusercontent.com/cwendorf/ployPlot/main/source-polyPlot.R")

### The Basic PolyPlot

Scores <- round(rnorm(100, 10, 2), 0)
polyStats(Scores, digits = 3)
polyPlot(Scores)

### Adding Features to the Plot

polyPlot(Scores, values = FALSE, type = "frequency", main = "PolyPlot and Histogram")
polyPlot(Scores, values = FALSE, type = "density", main = "PolyPlot and Density")
polyPlot(Scores, type = "density", col = "blue", bg = "goldenrod", values = TRUE, main = "PolyPlot and Density")
