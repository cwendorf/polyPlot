# polyPlot
## Cover Image Examples

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/polyPlot2/main/source-polyPlot.R")

### The Basic PolyPlot

Scores <- round(rnorm(100, 10, 2), 0)
polyPlot(Scores, type = "frequency", bg = "darkgoldenrod")
