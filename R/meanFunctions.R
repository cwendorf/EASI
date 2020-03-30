# Estimation Approach to Statistical Inference
## Basic Functions for Means and Mean Differences

### Descriptive Functions

#### Describe Function for Mutiple Groups

descMeans <- descMean <- function(...) 
  UseMethod("descMeans")

descMeans.default <- function(...) {
  data <- data.frame(...)
  N <- sapply(data,length)
  M <- sapply(data,mean,na.rm=TRUE)
  SD <- sapply(data,sd,na.rm=TRUE)
  results <- cbind(N=N,M=M,SD=SD)
  return(results)
}

descMeans.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=descMeans,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  colnames(results) <- c("N","M","SD")
  return(results)
}

describeMeans <- describeMean <- function(...,main=NULL,digits=3) {
  results <- formatList(list(descMeans(...)),digits=digits)
  if(is.null(main)) {names(results) <- "Descriptive Statistics for the Data"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Functions

#### CI Function for Means

ciMeans <- ciMean <- function(...) 
  UseMethod("ciMeans")

ciMeans.wss <- ciMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  SE <- SD/sqrt(N)
  tcrit <- qt((1-conf.level)/2,N-1,lower.tail=FALSE)
  LL <- M-tcrit*SE
  UL <- M+tcrit*SE
  results <- data.frame(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  return(results)
}

ciMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

ciMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- ciMeans(DescStats,conf.level=conf.level)
  return(results)
}

estimateMeans <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciMeans(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Means"} else {names(results) <- main}
  return(results)
}

estimateMean <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciMeans(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Mean"} else {names(results) <- main}
  return(results)
}

#### CI Function for Mean Differences/Comparisons

ciDifference <- function(...) 
  UseMethod("ciDifference")
  
ciDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- MD-tcrit*SE
  UL <- MD+tcrit*SE
  results <- data.frame(Diff=MD,SE=SE,df=df,LL=LL,UL=UL)
  rownames(results) <- c("Comparison")
  return(results)
}

ciDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- ciDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

ciDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- descMeans(formula)
  class(CompStats) <- "bss"
  results <- ciDifference(CompStats,conf.level=conf.level)
  return(results)
}

estimateDifference <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciDifference(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Difference"} else {names(results) <- main}
  return(results)
}

#### CI Function for Mean Contrasts

ciContrast <- function(...) 
  UseMethod("ciContrast")

ciContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  df <- N-1
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  covstats <- cortocov(CorrStats,SD)
  Est <- (t(contrast)%*%M)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

ciContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- t(contrast)%*%M
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  tcrit <- qt((1-conf.level)/2,df,lower.tail=FALSE)
  LL <- Est-tcrit*SE
  UL <- Est+tcrit*SE
  results <- as.data.frame(t(c(Est,SE,df,LL,UL)))
  colnames(results) <- c("Est","SE","df","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

ciContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- ciContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

ciContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- ciContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

estimateContrast <- function(...,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(ciContrast(...,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Contrast"} else {names(results) <- main}
  return(results)
}

### Null Hypothesis Significance Test Functions

#### NHST Function for Means

nhstMeans <- nhstMean <- function(...) 
  UseMethod("nhstMeans")
  
nhstMeans.wss <- nhstMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SE <- DescStats[,"SD"]/sqrt(N)
  Diff <- M-mu
  t <- Diff/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=Diff,SE=SE,t=t,df=df,p=p)
  rownames(results) <- rownames(DescStats)  
  return(results)
}

nhstMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

nhstMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- nhstMeans(DescStats,mu=mu)
  return(results)
}

testMeans <- function(...,mu=0,main=NULL,digits=3) {
  results <- formatList(list(nhstMeans(...,mu=mu)),digits=digits)
  if(is.null(main)) {names(results) <- "Hypothesis Tests for the Means"} else {names(results) <- main}
  return(results)
}

testMean <- function(...,mu=0,main=NULL,digits=3) {
  results <- formatList(list(nhstMeans(...,mu=mu)),digits=digits)
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Mean"} else {names(results) <- main}
  return(results)
}

#### NHST Function for Mean Differences/Comparisons

nhstDifference <- function(...) 
  UseMethod("nhstDifference")
  
nhstDifference.wss <- function(CompStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  MD <- M[2]-M[1]-mu
  SE <- SD/sqrt(N)
  SE <- sqrt(SE[1]^2+SE[2]^2-2*R*SE[1]*SE[2])
  df <- min(N)-1
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,t=t,df=df,p=p)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.bss <- function(CompStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- CompStats[1:2,]
  N <- CompStats[,"N"]
  M <- CompStats[,"M"]
  SD <- CompStats[,"SD"]
  MD <- M[2]-M[1]-mu
  SE <- sqrt( (SD[1]^2/N[1]) + (SD[2]^2/N[2]) )
  df <- ((SD[1]^2/N[1] + SD[2]^2/N[2])^2 )/( (SD[1]^2/N[1])^2/(N[1]-1) + (SD[2]^2/N[2])^2/(N[2]-1) )
  t <- MD/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- data.frame(Diff=MD,SE=SE,t=t,df=df,p=p)
  rownames(results) <- c("Comparison")
  return(results)
}

nhstDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- nhstDifference(CompStats,CorrStats,mu=mu)
  return(results)
}

nhstDifference.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- descMeans(formula)
  class(CompStats) <- "bss"
  results <- nhstDifference(CompStats,mu=mu)
  return(results)
}

testDifference <- function(...,mu=0,main=NULL,digits=3) {
  results <- formatList(list(nhstDifference(...,mu=mu)),digits=digits)
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Differece"} else {names(results) <- main}
  return(results)
}

#### NHST Function for Mean Contrasts

nhstContrast <- function(...) 
  UseMethod("nhstContrast")
  
nhstContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))
  t <- Est/SE
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,t,df,p)))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(results)
}

nhstContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  covstats <- cortocov(CorrStats,SD)
  SE <- sqrt(t(contrast)%*%covstats%*%contrast/N)
  t <- Est/SE
  df <- N-1
  p <- 2*(1 - pt(abs(t),df))
  results <- as.data.frame(t(c(Est,SE,t,df,p)))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  return(results)
}

nhstContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- nhstContrast(DescStats,CorrStats,contrast,mu=mu)
  return(results)
}

nhstContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- nhstContrast(DescStats,contrast,mu=mu)
  return(results)
}

testContrast <- function(...,mu=0,main=NULL,digits=3) {
  results <- formatList(list(nhstContrast(...,mu=mu)),digits=digits)
  if(is.null(main)) {names(results) <- "Hypothesis Test for the Contrast"} else {names(results) <- main}
  return(results)
}

### Standardized Mean Difference Functions

#### SMD Function for Means

smdMeans <- smdMean <- function(...) 
  UseMethod("smdMeans")
  
smdMeans.wss <- smdMeans.bss <- function(DescStats,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
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
  results <- data.frame(d=CD,"d.unb"=CDU,SE=SE,LL=LL,UL=UL)
  rownames(results) <- rownames(DescStats)
  return(results)
}

smdMeans.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

smdMeans.formula <- function(formula,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- smdMeans(DescStats,mu=mu,conf.level=conf.level)
  return(results)
}

standardizeMeans <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(smdMeans(...,mu=mu,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Intervals for the Standardized Means"} else {names(results) <- main}
  return(results)
}

standardizeMean <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(smdMeans(...,mu=mu,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Standardized Mean"} else {names(results) <- main}
  return(results)
}

#### SMD Function for Mean Differences/Comparisons

smdDifference <- function(...) 
  UseMethod("smdDifference")

smdDifference.wss <- function(DescStats,CorrStats,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- DescStats[1:2,]
  N <- min(CompStats[1:2,"N"])
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  rn <- rownames(CompStats)
  R <- CorrStats[rn[1],rn[2]]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  s <- sqrt((SD[1]^2 + SD[2]^2)/2)
  df <- N-1
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  vd <- v1+v2-2*R*SD[1]*SD[2]
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2+v2^2+2*R^2*v1*v2)/(8*df*s^4)+vd/(df*s^2))
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  CompStats <- DescStats[1:2,]
  N <- CompStats[1:2,"N"]
  M <- CompStats[1:2,"M"]
  SD <- CompStats[1:2,"SD"]
  z <- qnorm((1-conf.level)/2,lower.tail=FALSE)
  v1 <- SD[1]^2
  v2 <- SD[2]^2
  s <- sqrt((v1+v2)/2)
  Est <- (M[2]-M[1])/s
  SE <- sqrt(Est^2*(v1^2/(N[1]-1) + v2^2/(N[2]-1))/(8*s^4) + (v1/(N[1]-1) + v2/(N[2]-1))/s^2)
  LL <- Est-z*SE
  UL <- Est+z*SE
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Comparison")
  return(results)
}

smdDifference.default <- function(...,mu=0,conf.level=.95,rope=NULL) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- smdDifference(CompStats,CorrStats,conf.level=conf.level)
  return(results)
}

smdDifference.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- smdDifference(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeDifference <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(smdDifference(...,mu=mu,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Standardized Difference"} else {names(results) <- main}
  return(results)
}

#### SMD Function for Mean Contrasts

smdContrast <- function(...) 
  UseMethod("smdContrast")

smdContrast.wss <- function(DescStats,CorrStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- min(DescStats[,"N"])
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
  R <- mean(CorrStats[upper.tri(CorrStats)])
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
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

smdContrast.bss <- function(DescStats,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  N <- DescStats[,"N"]
  M <- DescStats[,"M"]
  SD <- DescStats[,"SD"]
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
  results <- as.data.frame(t(c(Est,SE,LL,UL)))
  colnames(results) <- c("Est","SE","LL","UL")
  rownames(results) <- c("Contrast")
  return(results)
}

smdContrast.default <- function(...,contrast,mu=0,conf.level=.95,rope=NULL) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)
  results <- smdContrast(DescStats,CorrStats,contrast,conf.level=conf.level)
  return(results)
}

smdContrast.formula <- function(formula,contrast,mu=0,conf.level=.95,rope=NULL,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  results <- smdContrast(DescStats,contrast,conf.level=conf.level)
  return(results)
}

standardizeContrast <- function(...,mu=0,conf.level=.95,main=NULL,digits=3) {
  results <- formatList(list(smdContrast(...,mu=mu,conf.level=conf.level)),digits=digits)
  if(is.null(main)) {names(results) <- "Confidence Interval for the Standardized Contrast"} else {names(results) <- main}
  return(results)
}

### Confidence Interval Plot Functions

#### Plot Data

plotData <- function(...)
  UseMethod("plotData")

plotData.default <- function(...,add=FALSE,main=NULL,ylab="Outcome",xlab="",method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  ylimrange <- range(pretty(c(floor(min(data-2)),ceiling(max(data)+2))))
  xlimrange <- c(.5,ncol(data)+.5)
  mx <- ncol(data)+.15
  mn <- 1+.15
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Variables"}
  stripchart(data,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=0.08,col=col,pch=pch,cex.lab=1.3)
} 

plotData.formula <- function(formula,add=FALSE,main=NULL,ylab=NULL,xlab="",method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  y <- eval(formula[[2]])
  ylimrange <- range(pretty(c(floor(min(y-2)),ceiling(max(y)+2))))
  xlimrange <- c(.5,nlevels(x)+.5)
  par(bty="l",xaxs="i",yaxs="i")
  if(is.null(main)) {main="Data for the Groups"}
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  stripchart(formula,add=add,xlim=xlimrange,ylim=ylimrange,at=mn:mx,vertical=TRUE,method=method,main=main,ylab=ylab,xlab=xlab,jitter=0.08,col=col,pch=pch,cex.lab=1.3,...)
}

#### Add Data to Plot

addData <- function(...) 
  UseMethod("addData")

addData.default <- function(...,method="jitter",col="gray60",pch=16) {
  data <- data.frame(...)
  mx <- ncol(data)+.15
  mn <- 1+.15
  stripchart(data,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col)
}

addData.formula <- function(formula,method="jitter",col="gray60",pch=16,...) {
  x <- eval(formula[[3]])
  adjustX <- as.numeric(x)+.15
  mn <- min(adjustX,na.rm=TRUE)
  mx <- max(adjustX,na.rm=TRUE)
  stripchart(formula,add=TRUE,at=mn:mx,vertical=TRUE,method=method,jitter=0.08,pch=pch,col=col,...)
}

#### Basic Confidence Interval Plot Functions

cipMeans <- function(results,main,ylab,xlab,mu,rope,values,digits) {
  ylimrange <- range(pretty(c(floor(min(results[,"LL"]-.4)),ceiling(max(results[,"UL"])+.4))))
  plot(results[,"M"],xaxs="i",yaxs="i",xaxt="n",xlim=c(.5,nrow(results)+.5),ylim=ylimrange,xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,1:nrow(results),row.names(results))
  results <- formatFrame(results,digits=digits)
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  if(values) {
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"M"][i]),results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"LL"][i]),results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,as.numeric(results[,"UL"][i]),results[,"UL"][i],cex=.8,pos=2,offset=.5)}
  if(!is.null(mu)) {abline(h=mu,lty=2)}
  if(!is.null(rope)) {rect(0,rope[1],nrow(results)+1,rope[2],col=rgb(.5,.5,.5,.07),border=NA)}   
}

cipDifference <- function(results,main,ylab,xlab,rope,values,digits) {
  graph <- results
  graph[3,] <- results[3,]+results[1,1]
  graphrope <- rope+as.vector(results[1,1])
  ylimrange <- range(pretty(c(floor(min(graph[,2]-.4)),ceiling(max(graph[,3])+.4))))
  par(mar=c(5,5,5,5))  
  plot(c(1,2,3),graph[,1],xaxt="n",yaxt="n",xaxs="i",yaxs="i",xlim=c(.4,3.6),ylim=ylimrange,pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="n")
  axis(1,.4:2.4,labels=FALSE,lwd.tick=0)
  axis(1,2.6:3.6,labels=FALSE,lwd.tick=0)
  axis(1,at=c(1,2),labels=rownames(graph)[1:2])
  axis(1,at=3,labels=rownames(graph)[3])
  axis(2)
  axis(2,at=ylimrange,labels=FALSE,lwd.tick=0)
  results <- formatFrame(results,digits=digits)
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,2][i],graph[,3][i]),lwd=2)
  if(values) {
  for (i in 1:2) text(i,graph[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,1][3],results[,1][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,2][3],results[,2][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,3][3],results[,3][3],cex=.8,pos=4,offset=.5)}
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  mtext("Mean Difference",side=4,las=3,cex=1.3,line=3)
  if(!is.null(rope)) {rect(2.6,graphrope[1],3.6,graphrope[2],col=rgb(.5,.5,.5,.07),border=NA)} 
}

#### Plot Function for Confidence Intervals of the Means

plotMeans <- plotMean <- function(...) 
  UseMethod("plotMeans")

plotMeans.wss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  results <- ciMeans(DescStats,conf.level=conf.level)
  if(is.null(main)) {
    if(nrow(results)>1) {main="Confidence Intervals for the Means"} else {main="Confidence Interval for the Mean"}
    }
  cipMeans(results,main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
  if(nrow(results)>1) {for (i in 1:(nrow(results)-1)) arrows(i,results[i,"M"],i+1,results[i+1,"M"],code=3,length=0,lty=1)}
}

plotMeans.bss <- function(DescStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=NULL,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence Intervals for the Means"}
  results <- ciMeans(DescStats,conf.level=conf.level)
  cipMeans(results,main=main,ylab=ylab,xlab=xlab,mu=mu,rope=rope,values=values,digits=digits)
}

plotMeans.default <- function(...,main=NULL,ylab="Outcome",xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  plotMeans(DescStats,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,mu=mu,rope=rope,values=values,digits=digits)
}

plotMeans.formula <- function(formula,main=NULL,ylab=NULL,xlab="",mu=NULL,rope=NULL,conf.level=.95,values=TRUE,digits=3,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}
  plotMeans(DescStats,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,mu=mu,rope=rope,values=values,digits=digits)
}

#### Plot Function for Confidence Intervals of Mean Differences/Comparisons

plotDifference <- function(...) 
  UseMethod("plotDifference")
  
plotDifference.wss <- function(CompStats,CorrStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence Intervals for the Comparison"}
  Vars <- ciMeans(CompStats,conf.level=conf.level)[1:2,c(2,5,6)]
  colnames(Vars) <- c("Est","LL","UL")
  Diff <- ciDifference(CompStats,CorrStats,conf.level=conf.level)[c(1,4,5)]
  colnames(Diff) <- c("Est","LL","UL")
  results <- rbind(Vars,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotDifference.bss <- function(CompStats,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence Intervals for the comparison"}
  Groups <- ciMeans(CompStats,conf.level=conf.level)[1:2,c(2,5,6)]
  colnames(Groups) <- c("Est","LL","UL")
  Diff <- ciDifference(CompStats,conf.level=conf.level)[c(1,4,5)]
  colnames(Diff) <- c("Est","LL","UL")
  results <- rbind(Groups,Diff)
  rownames(results)[3]="Comparison"
  cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
}

plotDifference.default <- function(...,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  CompStats <- descMeans(...)
  class(CompStats) <- "wss"
  CorrStats <- descCorrelation(...)
  plotDifference(CompStats,CorrStats,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

plotDifference.formula <- function(formula,main=NULL,ylab=NULL,xlab="",conf.level=.95,rope=NULL,lables=NULL,values=TRUE,digits=3,...) {
  CompStats <- descMeans(formula)
  class(CompStats) <- "bss"
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  plotDifference(CompStats,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

#### Plot Function for Confidence Interval of a Mean Contrast of Levels

plotContrast <- function(...) 
  UseMethod("plotContrast")

plotContrast.wss <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
  convar1 <- ifelse(contrast<0,0,contrast)
  resvar1 <- ciContrast(...,contrast=convar1,conf.level=conf.level)
  convar2 <- ifelse(contrast>0,0,abs(contrast))
  resvar2 <- ciContrast(...,contrast=convar2,conf.level=conf.level)
  Vars <- rbind(resvar1,resvar2)
  Vars <- Vars[2:1,c(1,4,5)]  
  Diff <- ciContrast(...,contrast=contrast,conf.level=conf.level)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
  arrows(1,results[1,1],2,results[2,1],code=3,length=0,lty=1)
}

plotContrast.bss <- function(DescStats,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3,...) {
  if(is.null(main)) {main="Confidence Intervals for the Contrast"}
  congrp1 <- ifelse(contrast<0,0,contrast)
  resgrp1 <- ciContrast(DescStats,contrast=congrp1,conf.level=conf.level)
  congrp2 <- ifelse(contrast>0,0,abs(contrast))
  resgrp2 <- ciContrast(DescStats,contrast=congrp2,conf.level=conf.level)
  Groups <- rbind(resgrp1,resgrp2)
  Groups <- Groups[2:1,c(1,4,5)]
  Diff <- ciContrast(DescStats,contrast=contrast,conf.level=conf.level)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  if(is.null(labels)) {rownames(results) <- c("Neg Weighted","Pos Weighted","Contrast")} else {rownames(results) <- c(labels,"Contrast")}
  cipDifference(results,main=main,ylab=ylab,xlab=xlab,rope=rope,values=values,digits=digits)
}

plotContrast.default <- function(...,contrast,main=NULL,ylab="Outcome",xlab="",conf.level=.95,mu=0,rope=NULL,labels=NULL,values=TRUE,digits=3) {
  DescStats <- descMeans(...)
  class(DescStats) <- "wss"
  CorrStats <- descCorrelation(...)
  plotContrast(DescStats,CorrStats,contrast=contrast,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

plotContrast.formula <- function(formula,contrast,main=NULL,ylab=NULL,xlab="",conf.level=.95,rope=NULL,labels=NULL,values=TRUE,digits=3,...) {
  DescStats <- descMeans(formula)
  class(DescStats) <- "bss"
  if(is.null(ylab)) {ylab=all.vars(formula)[1]}  
  plotContrast(DescStats,contrast=contrast,main=main,ylab=ylab,xlab=xlab,conf.level=conf.level,rope=rope,labels=labels,values=values,digits=digits)
}

### Meta-Wrappers for Functions

#### Meta-Wrapper for Mean Functions

allMeans <- function(...) {
  output <- list(
  ciMeans=ciMeans(...),
  nhstMeans=nhstMeans(...),
  smdMeans=smdMeans(...))
  return(output)
}

analyzeMeans <- function(...,main=NULL,digits=3) {
  results <- formatList(allMeans(...),digits=digits)
  names(results) <- c("Confidence Intervals for the Means","Hypothesis Tests for the Means","Confidence Intervals for the Standardized Means")
  print(results)
  plotMeans(...,main=main,digits=digits)
}

#### Meta-Wrapper for Mean Difference/Comparison Functions

allDifference <- function(...) {
  output <- list(
  ciDifference=ciDifference(...),
  nhstDifference=nhstDifference(...),
  smdDifference=smdDifference(...))
  return(output)
}

analyzeDifference <- function(...,main=NULL,digits=3) {
  results <- formatList(allDifference(...),digits=digits)
  names(results) <- c("Confidence Interval for the Difference","Hypothesis Test for the Difference","Confidence Interval for the Standardized Difference")
  print(results)
  plotDifference(...,main=main,digits=digits)
}

#### Meta-Wrapper for Mean Contrast Functions

allContrast <- function(...) {
  output <- list(
  ciContrast=ciContrast(...),
  nhstContrast=nhstContrast(...),
  smdContrast=smdContrast(...))
  return(output)
}

analyzeContrast <- function(...,main=NULL,digits=3) {
  results <- formatList(allContrast(...),digits=digits)
  names(results) <- c("Confidence Interval for the Contrast","Hypothesis Test for the Contrast","Confidence Interval for the Standardized Contrast")
  print(results)
  plotContrast(...,main=main,digits=digits)
}
