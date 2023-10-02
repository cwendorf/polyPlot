% File man/polyPlot.Rd
% Part of the polyplot2 package

\name{polyPlot}
\alias{polyPlot}
\title{polyPlot}
\description{Provides a modified PolyPlot}

\usage{
\method{polyPlot}{default}(x,type="none",main=NULL,xlab=NULL,ylab=NULL,xlim=NULL,ylim=NULL,values=TRUE,col="black",bg="gray60",cex=1.2,digits=2)
}

\arguments{
\item{x}{a (non-empty) numeric vector of data values}
\item{type}{option to plot frequency or density behind the plot}
\item{main}{a custom title for the plot}
\item{xlab}{a custom label for the x axis}
\item{ylab}{a custom label for the y axis}
\item{xlim}{custom limits for the x axis}
\item{ylim}{custom limits for the y axis}
\item{values}{whether the points and statistics should printed and labeled}
\item{col}{custom color for the points, segments, and labels}
\item{bg}{custom color for the underlying bars or curve}
\item{cex}{custom size for the plot symbols}
\item{digits}{number of decimal places for the labels}
}