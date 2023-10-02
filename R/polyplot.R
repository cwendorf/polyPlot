# polyPlot2
# The Original PolyPlot Code

## Seier E. & Bonett D.G. (2011).
## A polyplot for visualizing location, spread, skewness and kurtosis.
## The American Statistician, 65(4), pp. 258-261.

polyplot<- function(x) {
n<-length(x);n2=floor(n/2);if(n%%2==0) n2m1=n2+1 else n2m1=n2+2;
sx<-sort(x);n2m1=n2+1;first<-sx[1:n2];second<-sx[n2m1:n];
m1<-mean(first);m2<-mean(second);xmean<-mean(x);difm<-(m2-m1)/2;xmed<-median(x);
mi<-min(x);ma<-max(x);s<-sd(x);delta<-(sum(abs(x-xmed)))/n;
cinco<-summary(x);
q1<-as.numeric(cinco[2]);q3<-as.numeric(cinco[5]);
##par(mfcol=c(2,1))
layout(matrix(c(1,2)),heights=c(3,2), widths=c(1,1))
hist1<-hist(x,plot=TRUE, main= 'Histogram ',col= 'beige');nh=length(hist1$breaks);
xa=hist1$breaks[1];xb=hist1$breaks[nh];par(mar=c(2, 4,2, 4) + 0.1);
mm=max(abs(xa),abs(xb));fskew<-(sum((x-xmean)^3));
plot(x,x,'n',xlab=' ',ylab=' ',ylim=c(-0.7,3.6),xlim=c(xa-0.1*mm,xb+0.1*mm),
axes=FALSE, main = 'Polyplot');
axis(1,at=hist1$breaks);
if (fskew>=0) {segments(m1,2,xmean,2, lty='dashed');
}else{ segments(m1,2,xmean,2, lwd=2)};
if(fskew>=0) {segments(xmean,2, m2 ,2, lty='solid',lwd=2);
}else {segments(xmean,2, m2 ,2, lty='dashed')};
segments(m2,2,xmean+s,1, lty='dotted');segments(m1,2,xmean-s,1, lty='dotted');
segments(xmean-s,1, mi,0,lty='dotted');segments(xmean+s,1, ma,0,lty='dotted');
segments(q3,3,m2,2, lty='dotted');segments(q1,3,m1,2, lty='dotted');
if (fskew>=0)  {segments(xmean,1,xmean+s,1, lwd=2)
}else{ segments(xmean,1,xmean+s,1, lty='dashed')};
if (fskew>=0) {segments(xmean-s,1,xmean,1, lty='dashed')
}else{ segments(xmean-s,1,xmean,1, lwd=2)};
segments(mi,0,ma,0,, lwd=2);points(xmean,2,pch=19,col='black');
points(xmean,1,pch=19,col='black');points((mi+ma)/2,0,pch=3,col='black');
points(m1,2,pch=19, col='black');points(m2,2,pch=19, col='black');
points(xmed,3.1,pch=25,col='black',bg='black');
points(q1,3.1,pch=25,col='black',bg='black');
points(q3,3.1, pch=25,col='black',bg='black');points(mi,0,pch= 15 );
points(ma,0,pch= 15 );segments(xmed,3,xmean,2, lty='dotted');
segments(q1,3,q3,3, lwd=2); rmi=round(mi,4);rma=round(ma,4);
## PRINTING STATISTICS
iqr=q3-q1;riqr=round(iqr,2);rdelta=round(delta,2);
rs=round(s,2);R=ma-mi;rR=round(R,2);
rq1=round(q1,2);rq3=round(q3,2);rxmed=round(xmed,2);
fence2<-q3+(1.5*iqr); fence1<-q1-(1.5*iqr);
text(fence1,0, '('); text(fence2,0,')');
rxmean=round(xmean,2);
mtext('MAD',side=4,line=2,at=2,cex=0.8,las=1,adj=0);
mtext('IQR',side=4,line=2,at=3.5, cex=0.8, las=1,adj=0);
mtext('IQR/2',side=4,line=2,at=2.8, cex=0.8, las=1,adj=0);
mtext('SD',side=4,line=2,at=1.2, cex=0.8,las=1,adj=0);
mtext('R/2',side=4,line=2,at=0.4, cex=0.8,las=1,adj=0);
mtext('R',side=4,line=2,at=-0.4, cex=0.8,las=1,adj=0);
mtext(rdelta,side=4,line=1,at=2,cex=0.8,las=1, adj=1);
mtext(riqr,side=4,line=1,at=3.5, cex=0.8, las=1, adj=1);
mtext(riqr/2,side=4,line=1,at=2.8, cex=0.8, las=1, adj=1);
mtext(rs,side=4,line=1,at=1.2, cex=0.8,las=1, adj=1);
mtext(rR,side=4,line=1,at=-0.4, cex=0.8,las=1, adj=1);
mtext(round(rR/2,2),side=4,line=1,at=0.4, cex=0.8,las=1, adj=1);
mtext('Q1     ',side=2,line=2,at=3.5,cex=0.8,las=1,adj=1);
mtext('Q2     ',side=2,line=2,at=3,cex=0.8,las=1,adj=1);
mtext('Q3     ',side=2,line=2,at=2.5,cex=0.8,las=1,adj=1);
mtext('mean  ',side=2,line=2,at=1.5,cex=0.8,las=1,adj=1);
mtext('n       ',side=2,line=2,at=0.5,cex=0.8,las=1,adj=1);
mtext(rq1,side=2,line=1.5, at=3.5,cex=0.8,las=1,adj=0);
mtext(rxmed,side=2,line=1.5, at=3,cex=0.8,las=1,adj=0);
mtext(rq3,side=2,line=1.5, at=2.5,cex=0.8,las=1,adj=0);
mtext(rxmean,side=2,line=1.5, at=1.5,cex=0.8,las=1,adj=0);
mtext(n,side=2,line=1.5,at=0.5,cex=0.8,las=1,adj=0)
}
