# polyPlot2
## Basic Tutorial for PolyPlot2

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/polyPlot2/main/source-polyPlot2.R")

### The PolyPlot

Scores <- round(rnorm(100, 10, 2), 0)
polyPlot(Scores)

### Adding Background Plots

polyPlot(Scores, type = "frequency")
polyPlot(Scores, type = "density")
