# polyplot2
## Tutorial for PolyPlot2

source("http://raw.githubusercontent.com/cwendorf/polyplot2/main/source-polyplot2.R")

### The Basic PolyPlot

#### In order to demonstrate the finer points of a PolyPlot, the following code simulates 1000 scores from a positively skewed unimodal distribution and then calls `polyplot2` using the default options.

Scores <- c(rnorm(n=600,mean=100,sd=15),rnorm(n=200,mean=115,sd=20),rnorm(n=200,mean=130,sd=25))
polyplot2(Scores)

### Using the PolyPlot to Determine Shape

#### The following code demonstrates some of the available options for customizing the PolyPlot.Similarly, it demonstrates how the PolyPlot does a good job of approximating the shape of the underlying distribution.
par(mfrow=c(1,2))
polyplot2(Scores,histogram=TRUE,curve=FALSE,values=FALSE,main="PolyPlot2 plus Histogram",col="darkblue",bg="darkgoldenrod")
polyplot2(Scores,histogram=FALSE,curve=TRUE,values=FALSE,main="PolyPlot2 plus Density Curve",col="darkblue",bg="darkgoldenrod")
