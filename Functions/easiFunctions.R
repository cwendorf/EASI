
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# CONFIDENCE INTERVAL FUNCTIONS 

# Basic EASI Functions
# These can operate on their own or be called from other functions

easiVariable <- function(y,...){
  N=length(y)
  M=mean(y,na.rm=TRUE)
  SD=sd(y,na.rm=TRUE)
  SE=SD/sqrt(N)
  LL=t.test(y,...)$conf.int[1]
  UL=t.test(y,...)$conf.int[2]
  results=round(c(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

easiVariables <- function(...,conf.level=.95){
  df=data.frame(...)
  results=data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(df)) results[i,]=easiVariable(df[,i],conf.level=conf.level)
  colnames(results)=c("N","M","SD","SE","LL","UL")
  rownames(results)=colnames(df)
  return(results)
}

easiGroups <- function(y,...) {
  results=aggregate(y,FUN=easiVariable,...)
  colnames(results)=c("Group","")
  return(results)
}

easiGroupDiff <- function(y,...){
  model=t.test(y,...)
  MD=as.numeric(model$estimate[1]-model$estimate[2])
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}

easiVariableDiff <- function(x,y,...){
  model=t.test(x,y,paired=TRUE,...)
  MD=as.numeric(model$estimate)
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}

# Wrappers for EASI Functions
# These call the basic functions and print with titles

estimateVariable <- function(y,...){
  cat("\nCONFIDENCE INTERVAL FOR THE VARIABLE\n\n")
  results=easiVariable(y,...)
  print(results)
  cat("\n")
}

estimateVariables <- function(...,conf.level=.95){
  cat("\nCONFIDENCE INTERVALS FOR THE VARIABLES\n\n")
  results=easiVariables(...,conf.level=conf.level)
  print(results)
  cat("\n")
}

estimateGroups <- function(y,...) {
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS OF THE VARIABLE\n\n")
  results=easiGroups(y,...)
  print(results,row.names=FALSE)
  cat("\n")  
}

estimateGroupDiff<-function(y,...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON ON THE VARIABLE\n\n")
  results=easiGroupDiff(y,...)
  print(results) 
  cat("\n")  
}

estimateVariableDiff <- function(x,y,...){
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON OF THE VARIABLES\n\n")
  results=easiVariableDiff(x,y,...)
  print(results) 
  cat("\n")
}
