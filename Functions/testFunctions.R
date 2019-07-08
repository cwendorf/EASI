
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# NULL HYPOTHESIS SIGNIFICANCE TEST FUNCTIONS 

# Basic NHST Function

nhst <- function(y,...){
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

# NHST Function for Mutiple Groups and Variables

nhstLevels <- function(...) 
  UseMethod("nhstLevels")

nhstLevels.default <- function(...,mu=0){
  data=data.frame(...)
  results=data.frame(matrix(ncol=5,nrow=0))
  for (i in 1:ncol(data)) results[i,]=nhst(data[,i],mu=mu)
  colnames(results)=c("Diff","SE","t","df","p")
  rownames(results)=colnames(data)
  return(results)
}

nhstLevels.formula <- function(formula,...) {
  results=aggregate(formula,FUN=nhst,...)
  rn=results[,1]
  results=results[[2]]
  rownames(results)=rn
  return(results)
}

# NHST Function for Group and Variable Differences

nhstDifference <- function(...) 
  UseMethod("nhstDifference")

nhstDifference.default <- function(x,y,...){
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

nhstDifference.formula <- function(formula,...){
  model=t.test(formula,...)
  mu=as.numeric(model$null.value)
  MD=as.numeric(model$estimate[1]-model$estimate[2]-mu)
  SE=as.numeric(model$stderr)
  t=as.numeric(model$statistic)
  df=as.numeric(model$parameter)
  p=as.numeric(model$p.value)
  results=round(c(Diff=MD,SE=SE,t=t,df=df,p=p),3)
  return(results)
}

# NHST Function for Group and Variable Contrasts

nhstContrasts <- function(...) 
  UseMethod("nhstContrasts")

nhstContrasts.default <- function(...,contrasts=contr.sum){
  data=data.frame(...)
  columns=dim(data)[2]
  dataLong=reshape(data,varying=1:columns,v.names="Outcome",timevar="Variable",idvar="Subjects",direction="long")
  dataLong$Subjects=as.factor(dataLong$Subjects)
  dataLong$Variable=as.factor(dataLong$Variable)
  vlevels=nlevels(dataLong$Variable)
  contrasts(dataLong$Variable)=contrasts
  contrasts(dataLong$Subjects)=contr.sum
  model=aov(Outcome~Variable+Error(Subjects),data=dataLong)
  first=summary(lm(model))[[4]][1:vlevels,1:4]
  results=round(first,3)
  colnames(results)=c("Diff","SE","t","p")
  rownames(results)[1]="Base"
  return(results)
}

nhstContrasts.formula <- function(formula,contrasts=contr.sum,...){
  x=eval(formula[[3]])
  y=eval(formula[[2]])
  contrasts(x)=contrasts
  model=lm(y~x,...)
  results=round(summary(model)[[4]][,],3)
  colnames(results)=c("Diff","SE","t","p")
  rownames(results)[1]="Base"
  return(results)
}

# NHST Function for Pairwise Comparisons

nhstPairwise <- function(...) 
  UseMethod("nhstPairwise")

nhstPairwise.default <- function(...,conf.level=.95,mu=0){
  data=data.frame(...)
  nr=dim(data)[2]
  rn=colnames(data)
  ncomp=(nr)*(nr-1)/2
  results=data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results)=c("Diff","SE","t","df","p")
  comp=1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp]=paste(rn[i],"v",rn[j])
	varx=get(rn[i])
	vary=get(rn[j])
	model=t.test(varx,vary,paired=TRUE,conf.level=conf.level,mu=mu)
	MD=as.numeric(model$estimate)
	SE=as.numeric(model$stderr)
	t=as.numeric(model$statistic)
	df=as.numeric(model$parameter)
	p=as.numeric(model$p.value)
    results[comp,]=c(MD,SE,t,df,p)
  	comp=comp+1
  }
  }
return(round(results,3))
}

nhstPairwise.formula <- function(formula,...){
  varx=eval(formula[[3]])
  vary=eval(formula[[2]])
  nr=nlevels(varx)
  rn=levels(varx)
  ncomp=(nr)*(nr-1)/2
  results=data.frame(matrix(ncol=5,nrow=ncomp))
  colnames(results)=c("Diff","SE","t","df","p")
  comp=1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp]=paste(rn[i],"v",rn[j])
	Comparison=factor(varx,c(rn[i],rn[j]))
	model=t.test(vary~Comparison,...)
	mu=as.numeric(model$null.value)
	MD=as.numeric(model$estimate[1]-model$estimate[2]-mu)		
    SE=as.numeric(model$stderr)
	t=as.numeric(model$statistic)
	df=as.numeric(model$parameter)
	p=as.numeric(model$p.value)
    results[comp,]=c(MD,SE,t,df,p)
	comp=comp+1
  }
  }
  return(round(results,3))
}

# Wrappers for NHST Functions
# These call the functions and print with titles

testLevels <- function(...){
  cat("\nHYPOTHESIS TESTS FOR THE LEVELS\n\n")
  results=nhstLevels(...)
  print(results)
  cat("\n")
}

testDifference <- function(...){
  cat("\nHYPOTHESIS TEST FOR THE COMPARISON\n\n")
  results=nhstDifference(...)
  print(results) 
  cat("\n")
}

testContrasts<-function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE CONTRASTS\n\n")
  results=nhstContrasts(...)
  print(results) 
  cat("\n")  
}

testPairwise <- function(...) {
  cat("\nHYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS\n\n")
  results=nhstPairwise(...)
  print(results) 
  cat("\n")  
}
