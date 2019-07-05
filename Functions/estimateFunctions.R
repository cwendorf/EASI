
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# CONFIDENCE INTERVAL FUNCTIONS 

# Basic EASI Function

easi <- function(y,...){
  N=length(y)
  M=mean(y,na.rm=TRUE)
  SD=sd(y,na.rm=TRUE)
  SE=SD/sqrt(N)
  LL=t.test(y,...)$conf.int[1]
  UL=t.test(y,...)$conf.int[2]
  results=round(c(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

# EASI Function for Mutiple Groups and Variables

easiLevels <- function(...) 
  UseMethod("easiLevels")

easiLevels.default <- function(...,conf.level=.95){
  data=data.frame(...)
  results=data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(data)) results[i,]=easi(data[,i],conf.level=conf.level)
  colnames(results)=c("N","M","SD","SE","LL","UL")
  rownames(results)=colnames(data)
  return(results)
}

easiLevels.formula <- function(formula,...) {
  results=aggregate(formula,FUN=easi,...)
  rn=results[,1]
  results=results[[2]]
  rownames(results)=rn
  return(results)
}

# EASI Function for Group and Variable Differences

easiDifference <- function(...) 
  UseMethod("easiDifference")

easiDifference.default <- function(x,y,...){
  model=t.test(x,y,paired=TRUE,...)
  MD=as.numeric(model$estimate)
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}

easiDifference.formula <- function(formula,...){
  model=t.test(formula,...)
  MD=as.numeric(model$estimate[1]-model$estimate[2])
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}

# EASI Function for Group and Variable Contrasts

easiContrasts <- function(...) 
  UseMethod("easiContrasts")

easiContrasts.default <- function(...,contrasts=contr.sum,conf.level=.95){
  data=data.frame(...)
  columns=dim(data)[2]
  dataLong=reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects=as.factor(dataLong$Subjects)
  dataLong$Variable=as.factor(dataLong$Variable)
  vlevels=nlevels(dataLong$Variable)
  contrasts(dataLong$Variable)=contrasts
  contrasts(dataLong$Subjects)=contr.sum
  model=aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first=summary(lm(model))[[4]][1:vlevels,1:2]
  second=confint(lm(model),level=conf.level)[1:vlevels,1:2]
  results=round(cbind(first,second),3)
  colnames(results)=c("Diff","SE","LL","UL")
  rownames(results)[1]="Base"
  return(results)
}

easiContrasts.formula <- function(formula,contrasts=contr.sum,conf.level=.95,...){
  x=eval(formula[[3]])
  y=eval(formula[[2]])
  contrasts(x)=contrasts
  model=lm(y~x,...)
  results=round(cbind(summary(model)[[4]][,1:2],confint(model,level=conf.level)),3)
  colnames(results)=c("Diff","SE","LL","UL")
  rownames(results)[1]="Base"
  return(results)
}

# EASI Function for Group Pairwise Comparisons

easiPairwise <- function(formula,conf.level=.95,...){
  model=aov(formula,...)
  results=round(TukeyHSD(model,conf.level=conf.level)[[1]][,1:3],3)
  colnames(results)=c("Diff","LL","UL")
  return(results)
}

# Wrappers for EASI Functions
# These call the functions and print with titles

estimateLevels <- function(...){
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS\n\n")
  results=easiLevels(...)
  print(results)
  cat("\n")
}

estimateDifference<-function(y,...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON\n\n")
  results=easiDifference(y,...)
  print(results) 
  cat("\n")  
}
  
estimateContrasts <- function(y,...) {
  cat("\nCONFIDENCE INTERVALS FOR THE CONTRASTS\n\n")
  results=easiContrasts(y,...)
  print(results) 
  cat("\n")  
}

estimatePairwise <- function(y,...) {
  cat("\nCONFIDENCE INTERVALS FOR TUKEY HSD COMPARISONS\n\n")
  results=easiPairwise(y,...)
  print(results) 
  cat("\n")  
}
