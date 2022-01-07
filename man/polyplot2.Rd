% File man/polyplot2.Rd
% Part of the polyplot2 package

\name{polyplot2}
\alias{polyplot2}
\title{PolyPlot2}
\description{Provides a modified PolyPlot}

\usage{
\method{polyplot2}{default}(y,histogram=FALSE,curve=FALSE,main="PolyPlot2",xlab=NULL,xlim=NULL,ylim=NULL,values=TRUE,col="black",bg="gray60",cex=1.2,digits=2)
}

\arguments{
\item{y}{a (non-empty) numeric vector of data values}
\item{histogram}{whether a histogram should be underlayed behind the polyplot}
\item{curve}{whether a density curve should be underlayed behind the polyplot}
\item{main}{a custom title for the polyplot}
\item{xlab}{a custom label for the x axis}
\item{xlim}{custom limits for the x axis}
\item{ylim}{custom limits for the y axis}
\item{values}{whether the points and statistics should labeled and printed}
\item{col}{custom color for the polyplot points, segments, and labels}
\item{bg}{custom color for the underlying histogram and/or curve}
\item{cex}{custom size for the polyplot symbols}
\item{digits}{number of decimal places for the labels and statistics}
}