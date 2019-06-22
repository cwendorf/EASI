
# NULL HYPOTHESIS SIGNIFICANT TESTING (NHST)
# SIGNIFICANCE TEST FUNCTIONS 

# Basic NHST Functions
# These can operate on their own or be called from other functions

nhstVar <- function(y,...){
  model=t.test(y,...)
  mu=as.numeric(model$null.value)
  MD=as.numeric(model$estimate-mu)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Hyp=mu,Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstVars <- function(...,mu=0){
  df=data.frame(...)
  results=data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(df)) results[i,]=nhstVar(df[,i],mu=mu)
  colnames(results)=c("Hyp","Diff","SE","t","df","p")
  rownames(results)=colnames(df)
  return(results)
}

nhstGroups <- function(y,...) {
  results=aggregate(y,FUN=nhstVar,...)
  colnames(results)=c("Group","")
  return(results)
}

nhstGroupDiff <- function(y,...){
  model=t.test(y,...)
  mu=as.numeric(model$null.value)
  MD=as.numeric(model$estimate[1]-model$estimate[2]-mu)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Hyp=mu,Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstVarDiff <- function(x,y,...){
  model=t.test(x,y,paired=TRUE,...)
  mu=as.numeric(model$null.value) 
  MD=as.numeric(model$estimate)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Hyp=mu,Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}


# Wrappers for NHST Functions
# These call the basic functions and print with titles

testVar <- function(y,...){
  cat("\nHYPOTHESIS TEST FOR THE VARIABLE\n\n")
  results=nhstVar(y,...)
  print(results)
  cat("\n")
}

testVars <- function(...,mu=0){
  cat("\nHYPOTHESIS TESTS FOR THE VARIABLES\n\n")
  results=nhstVars(...,mu=mu)
  print(results)
  cat("\n")
}

testGroups <- function(y,...) {
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS OF THE VARIABLE\n\n")
  results=nhstGroups(y,...)
  print(results,row.names=FALSE)
  cat("\n")  
}

testGroupDiff <- function(y,...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON ON THE VARIABLE\n\n")
  results=nhstGroupDiff(y,...)
  print(results) 
  cat("\n")
}

testVarDiff <- function(x,y,...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON OF THE VARIABLES\n\n")
  results=nhstVarDiff(x,y,...)
  print(results) 
  cat("\n")
}


# The functions below are still in development

