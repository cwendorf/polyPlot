# polyPlot2
## Cover Image for polyPlot2

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/polyPlot2/main/source-polyPlot2.R")

### The Basic PolyPlot

Scores <- round(rnorm(100, 10, 2), 0)
polyPlot(Scores, type = "frequency", bg = "darkgoldenrod")
