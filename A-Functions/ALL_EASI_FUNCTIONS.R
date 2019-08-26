# Estimation Approach to Statistical Inference (EASI)
## Basic Functions for Means and Mean Differences
### TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R 

### Describe Functions

#### Describe Function for Mutiple Groups and Variables

describeLevels <- function(...) 
  UseMethod("describeLevels")

describeLevels.default <- function(...){
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- round(cbind(N=N,M=M,SD=SD),3)
  return(results)
}

describeLevels.formula <- function(formula,...){
  results <- aggregate(formula,FUN=describeLevels,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

#### Correlate/Covary Function for Mutiple Variables

correlateLevels <- function(...) 
  UseMethod("correlateLevels")

correlateLevels.default <- function(...){
  data <- data.frame(...)
  results <- cor(data)
  return(results)
}

cor2cov <- function(corrstats,SD) {
  sdsquare <- SD %*% t(SD)
  covstats <- sdsquare * corrstats
  return(covstats)
}

### Declare and Fill Blanks in Matrix

declareCorrMatrix <- function(...){
  clist=c(...)
  nr=length(clist)
  results=matrix(data=NA,nr,nr)
  rownames(results)=clist
  colnames(results)=clist
  return(results)
}

fillCorrMatrix <- function(mat){
  nr <- nrow(mat)
  nc <- ncol(mat)
  rn <- rownames(mat)
  cn <- colnames(mat)
  results <- matrix(data=NA,nr,nc)
  rownames(results) <- rn
  colnames(results) <- cn
  for( i in 1:nr ){
  for( j in 1:nc ){
	if(!is.na(mat[rn[i],cn[j]])) {
		if(mat[rn[i],cn[j]] == results[cn[j],rn[i]] | is.na(results[cn[j],rn[i]])){
			results[cn[j],rn[i]] <- mat[rn[i],cn[j]]
			results[rn[i],cn[j]] <- mat[rn[i],cn[j]]
		}
		else {return("error")}
	}
  }
  }
  diag(results) <- 1.000
  return(results)
}
### Confidence Interval Functions

#### CI Function for Means of Levels

ciMeans <- function(...) 
  UseMethod("ciMeans")

ciMeans.wss <- ciMeans.bss <- function(sumstats,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- round(cbind(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

ciMeans.default <- function(...,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- ciMeans(sumstats,conf.level=conf.level)
  return(results)
}

ciMeans.formula <- function(formula,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- ciMeans(sumstats,conf.level=conf.level)
  return(results)
}

#### CI Function for Mean Differences/Comparison of Levels 

ciDifference <- function(...) 
  UseMethod("ciDifference")
  
ciDifference.wss <- function(compstats,corrstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.bss <- function(compstats,conf.level=.95,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- round(cbind(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- ciDifference(compstats,corrstats,conf.level=conf.level)
  return(results)
}

ciDifference.formula <- function(formula,conf.level=.95,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- ciDifference(compstats,conf.level=conf.level)
  return(results)
}

#### CI Function for a Mean Contrast of Levels

ciContrast <- function(...) 
  UseMethod("ciContrast")

ciContrast.wss <- function(sumstats,corrstats,contrast,conf.level=.95) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cor2cov(corrstats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.bss <- function(sumstats,contrast,conf.level=.95,...) {
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- t(c(Est,SE,df,LL,UL))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

ciContrast.default <- function(...,contrast,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- ciContrast(sumstats,corrstats,contrast,conf.level=conf.level)
  return(results)
}

ciContrast.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- ciContrast(sumstats,contrast,conf.level=conf.level)
  return(results)
}

### Wrappers for CI Functions

estimateMeans <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE MEANS\n\n")
  print(ciMeans(...))
  cat("\n")
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(ciDifference(...)) 
  cat("\n")  
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(ciContrast(...)) 
  cat("\n")  
}

### Confidence Interval Plot Functions

#### Basic Plot Functions

cipMeans <- function(results,main,ylab,xlab,mu){
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

cipDifference <- function(results,main,ylab,xlab){
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,2])/2)*2,ceiling(max(graph[,3])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(graph))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2)
  for (i in 1:2) text(i,graph[,1][i],graph[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,2][i],graph[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,3][i],graph[,3][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,1][3],results[,1][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,2][3],results[,2][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,3][3],results[,3][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

#### Plot Function for Confidence Intervals for the Means of Levels

plotMeans <- function(...) 
  UseMethod("plotMeans")

plotMeans.default <- function(...,conf.level=.95,mu=NULL){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(...,conf.level=conf.level)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}

plotMeans.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- ciMeans(formula,...)[,c(2,5,6)]
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  cipMeans(results,main,ylab,xlab,mu)
}
 
plotMeans.wss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Variables"
  results <- ciMeans(sumstats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}

plotMeans.bss <- function(sumstats,mu=NULL,...){
  main="Confidence Intervals for the Means"
  ylab="Outcome"
  xlab="Groups"
  results <- ciMeans(sumstats,...)[,c(2,5,6)]
  cipMeans(results,main,ylab,xlab,mu)
}


#### Plot Function for Confidence Intervals of a Mean Difference/Comparison of Levels

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(compstats,corrstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Groups <- ciMeans(compstats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(compstats,corrstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.bss <- function(compstats,...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Groups"
  Groups <- ciMeans(compstats,...)[2:1,c(2,5,6)]
  Diff <- ciDifference(compstats,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars <- ciMeans(...)[2:1,c(2,5,6)]
  Diff <- ciDifference(...)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups <- ciMeans(formula,...)
  Groups <- Groups[2:1,c(2,5,6)]
  Diff <- ciDifference(formula,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main,ylab,xlab)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.bss <- function(sumstats,contrast,...){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Groups"
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(sumstats,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(sumstats,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(sumstats,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")
  cipDifference(results,main,ylab,xlab)
}

plotContrast.default <- function(...,contrast){
  main="Confidence Intervals for the Contrast"
  ylab="Outcome"
  xlab="Variables"
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- ciContrast(...,contrast=convar1)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- ciContrast(...,contrast=convar2)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- ciContrast(...,contrast=contrast)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")
  cipDifference(results,main,ylab,xlab)  
}

plotContrast.formula <- function(formula,contrast,...){
  main="Confidence Intervals for the Contrast"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(formula,contrast=congrp1,...)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(formula,contrast=congrp2,...)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(formula,contrast=contrast,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast") 
  cipDifference(results,main,ylab,xlab)
}

#### NHST Function for Means of Levels

nhstMeans <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(sumstats,mu=0,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SE <- sumstats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=Diff,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstMeans.default <- function(...,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- nhstMeans(sumstats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstMeans(sumstats,mu=mu)
  return(results)
}

##### NHST Function for Mean Differences/Comparison of Levels

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(compstats,corrstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  MD <- M[1]-M[2]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)  
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.bss <- function(compstats,mu=0,...){
  compstats <- compstats[1:2,]
  N <- compstats[,"N"]
  M <- compstats[,"M"]
  SD <- compstats[,"SD"]
  MD <- M[1]-M[2]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- round(cbind(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.default <- function(x,y,mu=0){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- nhstDifference(compstats,corrstats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,...){
  compstats <- describeLevels(formula)
  class(compstats) <- "bss"
  results <- nhstDifference(compstats,mu=mu)
  return(results)
}

#### NHST Function for a Mean Contrast of Levels

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(sumstats,contrast,mu=0,...) {
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.wss <- function(sumstats,corrstats,contrast,mu=0,...) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  Est <- (t(contrast)%*%M)
  covstats <- cor2cov(corrstats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

nhstContrast.default <- function(...,contrast,mu=0){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- nhstContrast(sumstats,corrstats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- nhstContrast(sumstats,contrast,mu=mu)
  return(results)
}

### Wrappers for NHST Functions

testMeans <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE MEANS\n\n")
  print(nhstMeans(...))
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  print(nhstDifference(...)) 
  cat("\n")
}

testContrast<-function(...) {
  cat("\nHYPOTHESIS TEST FOR THE CONTRAST\n\n")
  print(nhstContrast(...)) 
  cat("\n")  
}

### Standardized Mean Difference Functions

#### SMD Function for Means of Levels

smdMeans <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(sumstats,mu=0,conf.level=.95,...){
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  SE <- SD/sqrt(N)  
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  alpha <- 1-conf.level
  CD <- Diff/SD
  CDU <- (1-3/(4*df-1))*CD
  SE <- sqrt((df+2)/(N^2)+((CD^2)/(2*(df+2))))
  k <- exp(((log(2)-log(df))/2)+lgamma((df+1)/2)-lgamma(df/2))
  m <- t*k
  v <- 1+(t^2)*(1-k^2)
  w <- (2*m^3)-((2*df-1)/df)*(t^2*m)
  skew <- abs(w/sqrt(v)^3)
  sdz <- sqrt(v)
  llz <- qnorm(1-alpha/2,lower.tail=FALSE)
  ulz <- qnorm(1-alpha/2)
  ll1 <- m+sdz*llz
  ul1 <- m+sdz*ulz
  c <- w/(4*v)
  q <- v/(2*c^2)
  a <- m-(q*c)
  llp <- 2*(qgamma(alpha/2,q/2,rate=1))
  ulp <- 2*(qgamma(1-alpha/2,q/2,rate=1))
  ll2 <- ifelse(t>0,a+c*llp,a+c*ulp)
  ul2 <- ifelse(t>0,a+c*ulp,a+c*llp)
  LL <- ifelse(skew<.001,ll1*sqrt(1/N),ll2*sqrt(1/N))
  UL <- ifelse(skew<.001,ul1*sqrt(1/N),ul2*sqrt(1/N))
  results <- round(cbind(d=CD,"d(unb)"=CDU,df=df,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

smdMeans.default <- function(...,mu=0,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  results <- smdMeans(sumstats,mu=mu,conf.level=conf.level)
  return(results)
}

smdMeans.formula <- function(formula,mu=0,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdMeans(sumstats,mu=mu,conf.level=conf.level)
  return(results)
}

#### SMD Function for Mean Differences/Comparison of Levels

smdDifference <- function(...) 
  UseMethod("smdDifference")

smdDifference.wss <- function(sumstats,corrstats,conf.level=.95,...){
  compstats <- sumstats[1:2,]
  N <- min(compstats[1:2,"N"])
  M <- compstats[1:2,"M"]
  SD <- compstats[1:2,"SD"]
  rn <- rownames(compstats)
  R <- corrstats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.bss <- function(sumstats,contrast,conf.level=.95,...) {
  compstats <- sumstats[1:2,]
  N <- compstats[1:2,"N"]
  M <- compstats[1:2,"M"]
  SD <- compstats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[1]-M[2])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(round(results,3))
}

smdDifference.default <- function(x,y,conf.level=.95,...){
  compstats <- describeLevels(x,y)
  class(compstats) <- "wss"
  corrstats <- correlateLevels(x,y)
  results <- smdDifference(compstats,corrstats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdDifference(sumstats,contrast,conf.level=conf.level)
  return(results)
}

#### SMD Function for a Mean Contrast of Levels

smdContrast <- function(...) 
  UseMethod("smdContrast")

smdContrast.wss <- function(sumstats,corrstats,contrast,conf.level=.95,...) {
  N <- min(sumstats[,"N"])
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  R <- mean(corrstats[upper.tri(corrstats)])
  df <- N-1
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  a <- length(M)
  s <- sqrt(sum(SD^2)/a)
  Est <- (t(contrast)%*%M)/s
  v1 <- Est^2/(2*a^2*s^4*df)
  v2 <- sum(SD^4)
  v3 <- R^2*t(SD^2)%*%SD^2 
  v4 <- sum(contrast^2*SD^2)
  v5 <- R*t(contrast*SD)%*%(contrast*SD)
  SE <- sqrt(v1*(v2+v3)+(v4-v5)/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.bss <- function(sumstats,contrast,conf.level=.95,...) {
  N <- sumstats[,"N"]
  M <- sumstats[,"M"]
  SD <- sumstats[,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v <- SD^2
  a <- length(M)
  s <- sqrt(sum(v)/a)
  Est <- (t(contrast)%*%M)/s
  a1 <- Est^2/(a^2*s^4)
  a2 <- a1*sum((v^2/(2*(N-1))))
  a3 <- sum((contrast^2*v/(N-1)))/s^2
  SE <- sqrt(a2+a3)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- t(c(Est,SE,LL,UL))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(round(results,3))
}

smdContrast.default <- function(...,contrast,conf.level=.95){
  sumstats <- describeLevels(...)
  class(sumstats) <- "wss"
  corrstats <- correlateLevels(...)
  results <- smdContrast(sumstats,corrstats,contrast,conf.level=conf.level)
  return(results)
}

smdContrast.formula <- function(formula,contrast,conf.level=.95,...){
  sumstats <- describeLevels(formula)
  class(sumstats) <- "bss"
  results <- smdContrast(sumstats,contrast,conf.level=conf.level)
  return(results)
}

### Wrappers for SMD Functions

standardizeMeans <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE STANDARDIZED MEANS\n\n")
  print(smdMeans(...))
  cat("\n")
}

standardizeDifference <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}

standardizeContrast <- function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE STANDARDIZED CONTRAST\n\n")
  print(smdContrast(...))
  cat("\n")  
}
