# polyplot2
## Modified version of Seier & Bonett's (2011) polyplot

polyplot2 <- function(x,histogram=FALSE,curve=FALSE,main="PolyPlot2",xlab=NULL,xlim=NULL,ylim=NULL,values=TRUE,col="black",bg="gray60",cex=1.2,digits=2) {
# Determine plot limits
  dens <- density(x);
  if (is.null(xlim)) {xlim=c(floor(min(dens$x)),ceiling(max(dens$x)))};
  if (histogram) {a <- invisible(hist(x,plot=FALSE)); maxdens <- max(a$counts)}
  else {maxdens <- max(dens$y)};
  if (is.null(ylim)) {ylim <- c(0,maxdens*1.1)};
# Create basic and background plots
  par(mar=c(5,5,4,5))
  if(is.null(xlab)) {xlab <- substitute(x)};
  if (!histogram) {histborder="white"; histbg="white"} else {histborder=bg; histbg=tcol(bg,10)};
  if (histogram) {prob=FALSE} else {prob=TRUE}
  hist1 <- hist(x,prob=prob,plot=TRUE,axes=FALSE,col=histbg,border=histborder,xlab=xlab,ylab=NULL,xlim=xlim,ylim=ylim,main=main);
  axis(1,at=hist1$mids); 
  if (histogram) {axis(2); mtext("Frequency",side=2,line=3)};
  if (curve) {axis(2); mtext("Density",side=2,line=3); polygon(dens,col=tcol(bg,10),border=bg)};
# Calculate polyplot statistics
  mode <- hist1$mids[which.max(hist1$counts)]
  if (histogram) {ymode <- max(hist1$counts)} else {ymode <- hist1$density[which.max(hist1$counts)]};
  y1 <- ymode/4; y2 <- y1*2; y3 <- y1*3; y4 <- y1*4;
  n <- length(x); n2 <- floor(n/2); if(n%%2==0) (n2m1 <- n2+1) else (n2m1 <- n2+2);
  sx <- sort(x); n2m1 <- n2+1; first <- sx[1:n2]; second <- sx[n2m1:n];
  m1 <- mean(first); m2 <- mean(second); xmean <- mean(x); 
  xmed <- median(x); mi <- min(x); ma <- max(x); s <- sd(x); delta <- (sum(abs(x-xmed)))/n;
  cinco <- summary(x); q1 <- as.numeric(cinco[2]); q3 <- as.numeric(cinco[5]); iqr <- q3-q1;
  fskew <- (sum((x-xmean)^3));
  # fence1 <- q1-(1.5*iqr); fence2 <- q3+(1.5*iqr);
  # points(c(fence1,fence2),c(0,0),pch=124,col=col,cex=cex)
# Plot poly points and segments
  points(c(mi,(mi+ma)/2,ma),c(0,0,0),pch=15,col=col,cex=cex);
  segments(mi,0,ma,0,lwd=2,col=col);
  points(xmean,y1,pch=19,col=col,cex=cex);
  if (fskew>=0) {segments(xmean,y1,xmean+s,y1,lwd=2,col=col)} else {segments(xmean,y1,xmean+s,y1,lty='dashed',col=col)};
  if (fskew>=0) {segments(xmean-s,y1,xmean,y1,lty='dashed',col=col)} else {segments(xmean-s,y1,xmean,y1,lwd=2,col=col)};
  points(c(m1,xmean,m2),c(y2,y2,y2),pch=19,col=col,cex=cex)
  if (fskew>=0) {segments(m1,y2,xmean,y2,lty='dashed',col=col)} else {segments(m1,y2,xmean,y2,lwd=2,col=col)};
  if (fskew>=0) {segments(xmean,y2,m2,y2,lty='solid',lwd=2,col=col)} else {segments(xmean,y2,m2,y2,lty='dashed',col=col)};
  points(c(q1,xmed,q3),c(y3,y3,y3),pch=25,col=col,bg=col,cex=cex)
  segments(q1,y3,q3,y3,lwd=2,col=col);
  points(mode,y4,pch=18,col=col,bg=col,cex=cex+.5);
  segments(mode,y4,xmed,y3,,lty='dotted',col=col);
  segments(xmed,y3,xmean,y2,lty='dotted',col=col); 
  segments(xmean,y2,xmean,y1,lty='dotted',col=col);
  segments(xmean,y1,(mi+ma)/2,0,lty='dotted',col=col);
  segments(xmean-s,y1,mi,0,lty='dotted',col=col); segments(xmean+s,y1, ma,0,lty='dotted',col=col);
  segments(m1,y2,xmean-s,y1,lty='dotted',col=col); segments(m2,y2,xmean+s,y1,lty='dotted',col=col);
  segments(q1,y3,m1,y2,lty='dotted',col=col); segments(q3,y3,m2,y2,lty='dotted',col=col);
  segments(mode,y4,q1,y3,lty='dotted',col=col); segments(mode,y4,q3,y3,lty='dotted',col=col);
# Add poly statistics to the plot
  if (values) {
  labels0 <- round(c(mi,(mi+ma)/2,ma),digits); rR2 <- round((ma-mi)/2,digits);
  text(labels0,0,labels0,cex=.8,pos=3,col=col,font=2,offset=1);
  mtext('R/2',side=4,at=0,cex=0.8,las=1,col=col,font=2); mtext(rR2,side=4,at=0,cex=0.8,las=1,col=col,font=2,padj=-1.65);
  labels1 <- round(c(xmean-s,xmean,xmean+s),digits); rs <- round(s,digits); 
  text(labels1,y1,labels1,cex=.8,pos=3,col=col,font=2,offset=1);
  mtext('SD',side=4,at=y1,cex=0.8,las=1,col=col,font=2); mtext(rs,side=4,at=y1,cex=0.8,las=1,col=col,font=2,padj=-1.65);
  labels2 <- round(c(m1,xmean,m2),digits); rdelta <- round(delta,digits);
  text(labels2,y2,labels2,cex=.8,pos=3,col=col,font=2,offset=1);
  mtext('MAD',side=4,at=y2,cex=0.8,las=1,col=col,font=2); mtext(rdelta,side=4,at=y2,cex=0.8,las=1,col=col,font=2,padj=-1.65);
  labels3 <- round(c(q1,xmed,q3),digits); riqr2 <- round(iqr/2,digits);
  text(labels3,y3,labels3,cex=.8,pos=3,col=col,font=2,offset=1)
  mtext('IQR/2',side=4,at=y3,cex=0.8,las=1,col=col,font=2); mtext(riqr2,side=4,at=y3,cex=0.8,las=1,col=col,font=2,padj=-1.65);
  labels4 <- round(mode,digits);
  text(labels4,y4,labels4,cex=.8,pos=3,col=col,font=2,offset=1);
  mtext('N',side=4,at=y4,cex=0.8,las=1,col=col,font=2); mtext(n,side=4,at=y4,cex=0.8,las=1,col=col,font=2,padj=-1.65);
}}

tcol <- function(color,percent=30,name=NULL) {
# Create transparent versions of colors
  rgb.val <- col2rgb(color)
  t.col <- rgb(rgb.val[1],rgb.val[2],rgb.val[3],max=255,alpha=(percent)*255/100,names=name)
  invisible(t.col)
}
