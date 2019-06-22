
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# CONFIDENCE INTERVAL FUNCTIONS 

# Basic EASI Functions
# These can operate on their own or be called from other functions

easiVar <- function(y,...){
  N=length(y)
  M=mean(y)
  SD=sd(y)
  SE=SD/sqrt(N)
  LL=t.test(y,...)$conf.int[1]
  UL=t.test(y,...)$conf.int[2]
  results=round(c(N=N,M=M,SD=SD,SE=SE,LL=LL,UL=UL),3)
  return(results)
}

easiVars <- function(...,conf.level=.95){
  df=data.frame(...)
  results=data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(df)) results[i,]=easiVar(df[,i],conf.level=conf.level)
  colnames(results)=c("N","M","SD","SE","LL","UL")
  rownames(results)=colnames(df)
  return(results)
}

easiGroups <- function(y,...) {
  results=aggregate(y,FUN=easiVar,...)
  colnames(results)=c("Group","")
  return(results)
}

easiGroupDiff <- function(y,...){
  model=t.test(y,...)
  MD=as.numeric(model$estimate[1]-model$estimate[2])
  SD=NA
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SD=SD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}

easiVarDiff <- function(x,y,...){
  model=t.test(x,y,paired=TRUE,...)
  MD=as.numeric(model$estimate)
  SD=NA
  SE=as.numeric(model$stderr)
  df=as.numeric(model$parameter)
  LL=model$conf.int[1]
  UL=model$conf.int[2]
  results=round(c(Diff=MD,SD=SD,SE=SE,df=df,LL=LL,UL=UL),3)
  return(results)
}


# Wrappers for EASI Functions
# These call the basic functions and print with titles

estVar <- function(y,...){
  cat("\nCONFIDENCE INTERVAL FOR THE VARIABLE\n\n")
  results=easiVar(y,...)
  print(results)
  cat("\n")
}

estVars <- function(...,conf.level=.95){
  cat("\nCONFIDENCE INTERVALS FOR THE VARIABLES\n\n")
  results=easiVars(...,conf.level=conf.level)
  print(results)
  cat("\n")
}

estGroups <- function(y,...) {
  cat("\nCONFIDENCE INTERVALS FOR THE LEVELS OF THE VARIABLE\n\n")
  results=easiGroups(y,...)
  print(results,row.names=FALSE)
  cat("\n")  
}

estGroupDiff<-function(y,...) {
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON ON THE VARIABLE\n\n")
  results=easiGroupDiff(y,...)
  print(results) 
  cat("\n")  
}

estVarDiff <- function(x,y,...){
  cat("\nCONFIDENCE INTERVAL FOR THE COMPARISON OF THE VARIABLES\n\n")
  results=easiVarDiff(x,y,...)
  print(results) 
  cat("\n")
}


# The functions below are still in development
 



