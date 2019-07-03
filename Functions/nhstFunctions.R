
# NULL HYPOTHESIS SIGNIFICANT TESTING (NHST)
# SIGNIFICANCE TEST FUNCTIONS 

# Basic NHST Functions
# These can operate on their own or be called from other functions

nhstVariable <- function(y,...){
  model=t.test(y,...)
  mu=as.numeric(model$null.value)
  MD=as.numeric(model$estimate-mu)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstVariables <- function(...,mu=0){
  df=data.frame(...)
  results=data.frame(matrix(ncol=6,nrow=0))
  for (i in 1:ncol(df)) results[i,]=nhstVariable(df[,i],mu=mu)
  colnames(results)=c("Diff","SE","t","df","p")
  rownames(results)=colnames(df)
  return(results)
}

nhstGroups <- function(y,...) {
  results=aggregate(y,FUN=nhstVariable,...)
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
  results=round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstVariableDiff <- function(x,y,...){
  model=t.test(x,y,paired=TRUE,...)
  mu=as.numeric(model$null.value) 
  MD=as.numeric(model$estimate)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

nhstGroupPairs <- function(y,...){
  anova=aov(y,...)
  results=round(TukeyHSD(anova)[[1]][,c(1,4)],3)
  colnames(results)=c("Diff","p adj")
  return(results)
}

nhstGroupContrasts <- function(y,contrasts=contr.sum,...){
  x=eval(y[[3]])
  y=eval(y[[2]])
  contrasts(x)=contrasts
  mymodel=lm(y~x,...)
  results=round(summary(mymodel)[[4]][,],3)
  colnames(results)=c("Diff","SE","t","p")
  rownames(results)[1]="Base"
  return(results)
}

nhstVariableContrasts <- function(...,contrasts=contr.sum){
  data=data.frame(...)
  columns=dim(data)[2]
  dataLong=reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects=as.factor(dataLong$Subjects)
  dataLong$Variable=as.factor(dataLong$Variable)
  vlevels=nlevels(dataLong$Variable)
  contrasts(dataLong$Variable)=contrasts
  contrasts(dataLong$Subjects)=contr.sum
  anova=aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first=summary(lm(anova))[[4]][1:vlevels,1:4]
  results=round(first,3)
  colnames(results)=c("Diff","SE","t","p")
  rownames(results)[1]="Base"
  return(results)
}

# Wrappers for NHST Functions
# These call the basic functions and print with titles

testVariable <- function(y,...){
  cat("\nHYPOTHESIS TEST FOR THE VARIABLE\n\n")
  results=nhstVariable(y,...)
  print(results)
  cat("\n")
}

testVariables <- function(...,mu=0){
  cat("\nHYPOTHESIS TESTS FOR THE VARIABLES\n\n")
  results=nhstVariables(...,mu=mu)
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

testVariableDiff <- function(x,y,...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON OF THE VARIABLES\n\n")
  results=nhstVariableDiff(x,y,...)
  print(results) 
  cat("\n")
}

testGroupPairs <- function(y,...) {
  cat("\nHYPOTHESIS TESTS FOR TUKEY HSD COMPARISONS OF THE GROUPS\n\n")
  results=nhstGroupPairs(y,...)
  print(results) 
  cat("\n")  
}

testGroupContrasts<-function(y,contrasts=contr.sum,...) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS OF THE GROUPS\n\n")
  results=nhstGroupContrasts(y,...)
  print(results) 
  cat("\n")  
}

testVariableContrasts <- function(...,contrasts=contr.sum) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS OF THE VARIABLES\n\n")
  results=nhstVariableContrasts(...,contrasts=contrasts)
  print(results) 
  cat("\n")  
}
