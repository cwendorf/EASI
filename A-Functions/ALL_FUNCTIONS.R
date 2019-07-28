
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# ALL FUNCTIONS (ESTIMATE, PLOT, TEST, AND EFFECT)
# TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R 

# Basic EASI Function

easi <- function(y,...){
  N <- length(y)
  M <- mean(y,na.rm=TRUE)
  SD <- sd(y,na.rm=TRUE)
  SE <- SD/sqrt(N)
  LL <- t.test(y,...)$conf.int[1]
  UL <- t.test(y,...)$conf.int[2]
  round(c(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
}

# EASI Function for Mutiple Groups and Variables

easiLevels <- function(...) 
  UseMethod("easiLevels")

easiLevels.default <- function(...,conf.level=.95){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- easi(data[,i],conf.level=conf.level)
  colnames(results) <- c("N","M","SD","SE","LL","UL")
  rownames(results) <- colnames(data)
  results
}

easiLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=easi,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  results
}

# EASI Function for Group and Variable Differences

easiDifference <- function(...) 
  UseMethod("easiDifference")

easiDifference.default <- function(x,y,...){
  model <- t.test(x,y,paired=TRUE,...)
  MD <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
}

easiDifference.formula <- function(formula,...){
  model <- t.test(formula,...)
  MD <- as.numeric(model$estimate[1]-model$estimate[2])
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
}

# EASI Function for a Single Group and Variable Contrast

easiContrast <- function(...) 
  UseMethod("easiContrast")

easiContrast.default <- function(...,contrast,conf.level=.95){
  data <- as.matrix(data.frame(...))
  model <- t.test(data %*% contrast,conf.level=conf.level)
  Est <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  df <- as.numeric(model$parameter)
  LL <- model$conf.int[1]
  UL <- model$conf.int[2]
  results <- round(cbind(Est=Est,SE=SE,df=df,LL=LL,UL=UL),3)
  rownames(results) <- c("Contrast")
  results
}

easiContrast.formula <- function(y,contrast,conf.level=.95,...) {
  sumstats=easiLevels(y)
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
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
  round(results,3)
}

# Wrappers for EASI Functions
# These call the functions and print with titles

estimateLevels <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS\n\n")
  print(easiLevels(...))
  cat("\n")
}

estimateDifference<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  print(easiDifference(...)) 
  cat("\n")  
}

estimateContrast<-function(...) {
  cat("\nCONFIDENCE INTERVAL FOR THE CONTRAST\n\n")
  print(easiContrast(...)) 
  cat("\n")  
}

# Confidence Interval Plots

plotLevels <- function(...) 
  UseMethod("plotLevels")

plotLevels.default <- function(...,conf.level=.95,mu=NULL){
  main="Confidence Intervals for the Levels"
  ylab="Outcome"
  xlab="Variables"
  results <- easiLevels(...,conf.level=conf.level)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results), row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}
}

plotLevels.formula <- function(formula,mu=NULL,...){
  main="Confidence Intervals for the Levels"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  results <- easiLevels(formula,...)
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  row.names(results) <- levels(x)
  plot(results[,"M"],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,"LL"])/2)*2,ceiling(max(results[,"UL"])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1, 1:nrow(results),row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,"LL"][i],results[,"UL"][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,"M"][i],results[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,"LL"][i],results[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,"UL"][i],results[,"UL"][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)}  
}

# Mean Difference Plots

plotDifference <- function(...) 
  UseMethod("plotDifference")

plotDifference.default <- function(...){
  main="Confidence Intervals for the Comparison"
  ylab="Outcome"
  xlab="Variables"
  Vars <- easiLevels(...)[2:1,c(2,5,6)]
  Diff <- easiDifference(...)[c(1,4,5)]
  results <- rbind(Vars,Diff)
  Diff <- Diff+Vars[1,1]  
  graph <- rbind(Vars,Diff)
  rownames(graph)[3]="Diff"
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(graph))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"M"][i],graph[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"M"][3],results[,"M"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1,1],4.5,graph[1,1],code=3,length=0,lty=2)  
  arrows(2,graph[2,1],4.5,graph[2,1],code=3,length=0,lty=2)
  if(results[1,1]<results[2,1]) {td <- graph[1,1]-axTicks(4)[max(which(axTicks(4)<graph[1,1]))]}
  if(results[1,1]>=results[2,1]) {td <- graph[1,1]-axTicks(4)[min(which(axTicks(4)>graph[1,1]))]}  
  val <- axTicks(4)-graph[1,1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}

plotDifference.formula <- function(formula,...){
  main="Confidence Intervals for the Comparison"
  ylab=all.vars(formula)[1]
  xlab=all.vars(formula)[2]
  Groups <- easiLevels(formula,...)
  Groups <- Groups[2:1,c(2,5,6)]
  Diff <- easiDifference(formula,...)[c(1,4,5)]
  results <- rbind(Groups,Diff)
  Diff <- Diff+Groups[1]
  graph <- rbind(Groups,Diff)
  plot(c(1,2,3),graph[,1],xaxt="n",xlim=c(.4,3.6),ylim=c(floor(min(graph[,"LL"])/2)*2,ceiling(max(graph[,"UL"])/2)*2),pch=c(15,15,17),cex=1.5,xlab=xlab,ylab=ylab,main=main,las=1,cex.lab=1.3,bty="l")
  axis(1,at=c(1,2,3),labels=rownames(results))
  for (i in 1:3) lines(x=c(i,i), y=c(graph[,"LL"][i],graph[,"UL"][i]),lwd=2)
  for (i in 1:2) text(i,graph[,"M"][i],graph[,"M"][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:2) text(i,graph[,"LL"][i],graph[,"LL"][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:2) text(i,graph[,"UL"][i],graph[,"UL"][i],cex=.8,pos=2,offset=.5)
  text(3,graph[,"M"][3],results[,"M"][3],cex=.8,pos=4,offset=.5,font=2)
  text(3,graph[,"LL"][3],results[,"LL"][3],cex=.8,pos=4,offset=.5)  
  text(3,graph[,"UL"][3],results[,"UL"][3],cex=.8,pos=4,offset=.5)
  arrows(1,graph[1],4.5,graph[1],code=3,length=0,lty=2)  
  arrows(2,graph[2],4.5,graph[2],code=3,length=0,lty=2)
  if(graph[1]<graph[2]) {td <- graph[1]-axTicks(4)[max(which(axTicks(4)<graph[1]))]}
  if(graph[1]>=graph[2]) {td <- graph[1]-axTicks(4)[min(which(axTicks(4)>graph[1]))]}  
  val <- axTicks(4)-graph[1]+td
  loc <- axTicks(4)+td  
  axis(4,at=loc,labels=val,las=1)
  rect(2.5,-1e6,4.5,1e6,col=rgb(.5,.5,.5,.07),border=NA)
}


# Basic NHST Function

nhst <- function(y,...){
  model <- t.test(y,...)
  mu <- as.numeric(model$null.value)
  MD <- as.numeric(model$estimate-mu)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
}

# NHST Function for Mutiple Groups and Variables

nhstLevels <- function(...) 
  UseMethod("nhstLevels")

nhstLevels.default <- function(...,mu=0){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=5,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- nhst(data[,i],mu=mu)
  colnames(results) <- c("Diff","SE","t","df","p")
  rownames(results) <- colnames(data)
  results
}

nhstLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=nhst,...)
  rn <- results[,1]
  results <- results[[2]]
  rownames(results) <- rn
  results
}

# NHST Function for Group and Variable Differences

nhstDifference <- function(...) 
  UseMethod("nhstDifference")

nhstDifference.default <- function(x,y,...){
  model <- t.test(x,y,paired=TRUE,...)
  mu <- as.numeric(model$null.value) 
  MD <- as.numeric(model$estimate)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
}

nhstDifference.formula <- function(formula,...){
  model <- t.test(formula,...)
  mu <- as.numeric(model$null.value)
  MD <- as.numeric(model$estimate[1]-model$estimate[2]-mu)
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
}

# NHST Function for a Single Group and Variable Contrast

nhstContrast <- function(...) 
  UseMethod("nhstContrast")

nhstContrast.default <- function(...,contrast,conf.level=.95,mu=0){
  data <- as.matrix(data.frame(...))
  model <- t.test(data %*% contrast,conf.level=conf.level,mu=mu)
  Est <- as.numeric(model$estimate)-mu
  SE <- as.numeric(model$stderr)
  t <- as.numeric(model$statistic)
  df <- as.numeric(model$parameter)
  p <- as.numeric(model$p.value)
  results <- round(cbind(Est=Est,SE=SE,t=t,df=df,p=p),3)
  rownames(results) <- c("Contrast")
  results
}

nhstContrast.formula <- function(y,contrast,conf.level=.95,mu=0,...) {
  sumstats=easiLevels(y)
  N=sumstats[,"N"]
  M=sumstats[,"M"]
  SD=sumstats[,"SD"]
  Est <- (t(contrast)%*%M)-mu
  k <- length(M)
  v <- diag(SD^2)%*%(solve(diag(N)))
  SE <- sqrt(t(contrast)%*%v%*%contrast)
  t <- Est/SE
  df <- (SE^4)/sum(((contrast^4)*(SD^4)/(N^2*(N-1))))  
  p <- 2*pt(-abs(t),df)
  results <- t(c(Est,SE,t,df,p))
  colnames(results) <- c("Est","SE","t","df","p")
  rownames(results) <- c("Contrast")
  round(results,3)
}

# Wrappers for NHST Functions
# These call the functions and print with titles

testLevels <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS\n\n")
  print(nhstLevels(...))
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


# Basic SMD Function

smd <- function(y,conf.level=.95,mu=0,...){
  Var <- easi(y,...)
  n <- as.numeric(Var[1])
  m <- as.numeric(Var[2])
  sd <- as.numeric(Var[3])
  md <- m-mu
  cohend <- md/sd
  eta <- n-1
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(n)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
}

# SMD Function for Mutiple Groups and Variables

smdLevels <- function(...) 
  UseMethod("smdLevels")

smdLevels.default <- function(...,conf.level=.95,mu=0){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=4,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- smd(data[,i],conf.level=conf.level,mu=mu)
  colnames(results) <- c("d","g","LL","UL")
  rownames(results) <- colnames(df)
  results
}

smdLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=smd,...)
  colnames(results) <- c("Group","")
  rownames(results) <- results[,1]
  results[2]
}

# SMD Function for Group and Variable Differences

smdDifference <- function(...) 
  UseMethod("smdDifference")  

smdDifference.default <- function(...,conf.level=.95){
  Vars <- easiLevels(...)
  ns  <- as.numeric(Vars[1:2,1])
  mns <- as.numeric(Vars[1:2,2])
  sds <- as.numeric(Vars[1:2,3])
  ntilde <- 1/mean(1/ns) 
  md <- (mns[1]-mns[2])
  sdp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
  cohend <- md/sdp
  eta <- ns[1]+ns[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  r <- cor(...)
  lambda <- hedgesg*sqrt(ntilde/(2*(1-r)))
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
}

smdDifference.formula <- function(formula,conf.level=.95,...){
  Groups <- easiLevels(formula,...)
  ns <- as.numeric(Groups[1:2,1])
  mns <- as.numeric(Groups[1:2,2])
  sds <- as.numeric(Groups[1:2,3])
  ntilde <- 1/mean(1/ns) 
  md <- (mns[1]-mns[2])
  sdp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
  cohend <- md/sdp
  eta <- ns[1]+ns[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(ntilde/2)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
}

# Wrappers for SMD Functions
# These call the functions and print with titles

effectLevels <- function(...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS\n\n")
  print(smdLevels(...))
  cat("\n")
}

effectDifference <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}
