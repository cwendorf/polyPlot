# polyPlot2
## Advanced Tutorial for PolyPlot2

### Package Loading

source("http://raw.githubusercontent.com/cwendorf/polyPlot2/main/source-polyPlot2.R")

### The PolyPlot for Positively Skewed Data

Scores <- round(rbeta(100,2,5)*20,0)
polyStats(Scores,digits=3)
polyPlot(Scores,type="frequency",col="blue",bg="goldenrod",values=FALSE,main="PolyPlot and Histogram for Positively Skewed Data")

### The PolyPlot for Negatively Skewed Data

Scores <- round(rbeta(100,5,2)*20,0)
polyStats(Scores,digits=3)
polyPlot(Scores,type="density",col="blue",bg="goldenrod",values=FALSE,main="PolyPlot and Density for Negatively Skewed Data")

### The PolyPlot for Bimodal Data

Scores <- c(round(rnorm(50,7,1),0),round(rnorm(50,13,1),0))
polyPlot(Scores,type="frequency",col="blue",bg="goldenrod",values=TRUE,main="PolyPlot and Histogram for Bimodal Data")
polyPlot(Scores,type="density",col="blue",bg="goldenrod",values=TRUE,main="PolyPlot and Density for Bimodal Data")
