
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# ALL EXTENDED FUNCTIONS (ESTIMATE, PLOT, TEST, AND EFFECT)
# TO INSTALL, SIMPLY COPY AND PASTE CONTENTS OF THIS ENTIRE FILE INTO R 

# EASI Function for Pairwise Group and Variable Comparisons

easiPairwise <- function(...) 
  UseMethod("easiPairwise")

easiPairwise.default <- function(...,conf.level=.95){
  data <- data.frame(...)
  nr <- dim(data)[2]
  rn <- colnames(data)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	varx <- get(rn[i])
	vary <- get(rn[j])
	model <- t.test(varx,vary,paired=TRUE,conf.level=conf.level)
	MD <- as.numeric(model$estimate)
	SE <- as.numeric(model$stderr)
	df <- as.numeric(model$parameter)
	LL <- model$conf.int[1]
	UL <- model$conf.int[2]
    results[comp,] <- c(MD,SE,df,LL,UL)
  	comp <-comp+1
  }
  }
  round(results,3)
}

easiPairwise.formula <- function(formula,...){
  varx <- eval(formula[[3]])
  vary <- eval(formula[[2]])
  nr <- nlevels(varx)
  rn <- levels(varx)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","df","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	Comparison <- factor(varx,c(rn[i],rn[j]))
	model <- t.test(vary~Comparison,...)
    MD <- as.numeric(model$estimate)[1]-as.numeric(model$estimate)[2]
    SE <- as.numeric(model$stderr)
    df <- as.numeric(model$parameter)
    LL <- model$conf.int[1]
    UL <- model$conf.int[2]
    results[comp,] <- c(MD,SE,df,LL,UL)
	comp <- comp+1
  }
  }
  round(results,3)
}

# EASI Function for Group and Variable Contrasts

easiContrasts <- function(...) 
  UseMethod("easiContrasts")

easiContrasts.default <- function(...,contrasts=contr.sum,conf.level=.95){
  data <- data.frame(...)
  columns <- dim(data)[2]
  dataLong <- reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects <- as.factor(dataLong$Subjects)
  dataLong$Variable <- as.factor(dataLong$Variable)
  vlevels <- nlevels(dataLong$Variable)
  contrasts(dataLong$Variable) <- contrasts
  contrasts(dataLong$Subjects) <- contr.sum
  model <- aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first <- summary(lm(model))[[4]][1:vlevels,1:2]
  second <- confint(lm(model),level=conf.level)[1:vlevels,1:2]
  results <- round(cbind(first,second),3)
  colnames(results) <- c("Est","SE","LL","UL")
  results
}

easiContrasts.formula <- function(formula,contrasts=contr.sum,conf.level=.95,...){
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  contrasts(x) <- contrasts
  model <- lm(y~x,...)
  results <- round(cbind(summary(model)[[4]][,1:2],confint(model,level=conf.level)),3)
  colnames(results) <- c("Est","SE","LL","UL")
  results
}

# Wrappers for EASI Functions
# These call the functions and print with titles

estimatePairwise <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS\n\n")
  print(easiPairwise(...)) 
  cat("\n")  
}
  
estimateContrasts <- function(...) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  print(easiContrasts(...)) 
  cat("\n")  
}

# Pairwise Plots

plotPairwise <- function(...) 
  UseMethod("plotPairwise")

plotPairwise.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(...)[,c(1,4,5)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

plotPairwise.formula <- function(formula,conf.level=.95,mu=NA,...) {
  main="Confidence Intervals for the Pairwise Comparisons"
  ylab="Mean Difference"
  xlab="Pairwise Comparisons"
  results <- easiPairwise(formula,...)[,c(1,4,5)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i), y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

# Contrast Plots

plotContrasts <- function(...) 
  UseMethod("plotContrasts")

plotContrasts.default <- function(...,mu=NULL) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results <- easiContrasts(...)[,c(1,3,4)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

plotContrasts.formula <- function(formula,mu=NULL,...) {
  main="Confidence Intervals for the Contrasts"
  ylab="Mean Difference"
  xlab="Contrasts"
  results <- easiContrasts(formula,...)[,c(1,3,4)]
  plot(results[,1],xaxt='n',xlim=c(.5,nrow(results)+.5),ylim=c(floor(min(results[,2])/2)*2,ceiling(max(results[,3])/2)*2),xlab=xlab,cex.lab=1.3,ylab=ylab,main=main,las=1,cex=1.5,pch=15,bty="l")
  axis(1,at=1:length(results[,1]),labels=row.names(results))
  for (i in 1:nrow(results)) lines(x=c(i,i),y=c(results[,2][i],results[,3][i]),lwd=2)
  for (i in 1:nrow(results)) text(i,results[,1][i],results[,1][i],cex=.8,pos=2,offset=.5,font=2)
  for (i in 1:nrow(results)) text(i,results[,2][i],results[,2][i],cex=.8,pos=2,offset=.5)  
  for (i in 1:nrow(results)) text(i,results[,3][i],results[,3][i],cex=.8,pos=2,offset=.5)
  if (!is.null(mu)) {abline(h=mu,lty=2)} 
}

# NHST Function for Pairwise Comparisons

nhstPairwise <- function(...) 
  UseMethod("nhstPairwise")

nhstPairwise.default <- function(...,conf.level=.95,mu=0){
  data <- data.frame(...)
  nr <- dim(data)[2]
  rn <- colnames(data)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	varx <- get(rn[i])
	vary <- get(rn[j])
	model <- t.test(varx,vary,paired=TRUE,conf.level=conf.level,mu=mu)
	MD <- as.numeric(model$estimate)
	SE <- as.numeric(model$stderr)
	t <- as.numeric(model$statistic)
	df <- as.numeric(model$parameter)
	p <- as.numeric(model$p.value)
    results[comp,] <- c(MD,SE,t,df,p)
  	comp <- comp+1
  }
  }
  round(results,3)
}

nhstPairwise.formula <- function(formula,...){
  varx <- eval(formula[[3]])
  vary <- eval(formula[[2]])
  nr <- nlevels(varx)
  rn <- levels(varx)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results) <- c("Diff","SE","t","df","p")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	Comparison <- factor(varx,c(rn[i],rn[j]))
	model <- t.test(vary~Comparison,...)
	mu <- as.numeric(model$null.value)
	MD <- as.numeric(model$estimate[1]-model$estimate[2]-mu)		
    SE <- as.numeric(model$stderr)
	t <- as.numeric(model$statistic)
	df <- as.numeric(model$parameter)
	p <- as.numeric(model$p.value)
    results[comp,] <- c(MD,SE,t,df,p)
	comp <- comp+1
  }
  }
  round(results,3)
}

# NHST Function for Group and Variable Contrasts

nhstContrasts <- function(...) 
  UseMethod("nhstContrasts")

nhstContrasts.default <- function(...,contrasts=contr.sum){
  data <- data.frame(...)
  columns <- dim(data)[2]
  dataLong <- reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects <- as.factor(dataLong$Subjects)
  dataLong$Variable <- as.factor(dataLong$Variable)
  vlevels <- nlevels(dataLong$Variable)
  contrasts(dataLong$Variable) <- contrasts
  contrasts(dataLong$Subjects) <- contr.sum
  model <- aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first <- summary(lm(model))[[4]][1:vlevels,1:4]
  results <- round(first,3)
  colnames(results) <- c("Diff","SE","t","p")
  results
}

nhstContrasts.formula <- function(formula,contrasts=contr.sum,...){
  x <- eval(formula[[3]])
  y <- eval(formula[[2]])
  contrasts(x) <- contrasts
  model <- lm(y~x,...)
  results <- round(summary(model)[[4]][,],3)
  colnames(results) <- c("Diff","SE","t","p")
  results
}

# Wrappers for NHST Functions
# These call the functions and print with titles

testPairwise <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS\n\n")
  print(nhstPairwise(...)) 
  cat("\n")  
}

testContrasts<-function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS\n\n")
  print(nhstContrasts(...)) 
  cat("\n")  
}

# SMD Function for Pairwise Group and Variable Comparisons

smdPairwise <- function(...) 
  UseMethod("smdPairwise")
  
smdPairwise.default <- function(...,conf.level=.95){
  Vars <- easiLevels(...)
  nr <- dim(Vars)[1]
  rn <- rownames(Vars)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)<- c("d","g","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	varx <- get(rn[i])
	vary <- get(rn[j])
    ns <- as.numeric(Vars[c(i,j),1])
	mns <- as.numeric(Vars[c(i,j),2])
	sds <- as.numeric(Vars[c(i,j),3])
	ntilde <- 1/mean(1/ns) 
	md <- (mns[1]-mns[2])
	sdp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
	cohend <- md/sdp
	eta <- ns[1]+ns[2]-2
	J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
	hedgesg <- cohend*J
	r <- cor(varx,vary)
	lambda <- hedgesg*sqrt(ntilde/(2*(1-r)))
	tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
	thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
	dlow <- tlow/lambda*hedgesg 
	dhig <- thig/lambda*hedgesg 
    results[comp,] <- c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp <- comp+1
  }
  }
  round(results,3)
} 
 
smdPairwise.formula <- function(formula,conf.level=.95,...){
  Groups <- easiLevels(formula,...)
  nr <- dim(Groups)[1]
  rn <- rownames(Groups)
  ncomp <- (nr)*(nr-1)/2
  results <- data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results) <- c("d","g","LL","UL")
  comp <- 1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp] <- paste(rn[i],"v",rn[j])
	ns <- as.numeric(Groups[c(i,j),1])
	mns <- as.numeric(Groups[c(i,j),2])
	sds <- as.numeric(Groups[c(i,j),3])
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
    results[comp,] <- c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp <- comp+1
  }
  }
  round(results,3)
}

# Wrappers for SMD Functions
# These call the functions and print with titles

effectPairwise <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE PAIRWISE COMPARISONS\n\n")
  print(smdPairwise(...))
  cat("\n")  
}
