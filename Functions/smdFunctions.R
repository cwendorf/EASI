
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# STANDARDIZED MEAN DIFFERENCE FUNCTIONS 

# Basic SMD Functions
# These can operate on their own or be called from other functions

smdVariable <- function(y,conf.level=.95,mu=0,...){
  Var=easiVariable(y,...)
  n=as.numeric(Var[1])
  mn=as.numeric(Var[2])
  sd=as.numeric(Var[3])
  dmn=abs(mn-mu)
  cohend=dmn/sd
  eta=n-1
  J=gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg=cohend*J
  lambda=hedgesg*sqrt(n)
  tlow=qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig=qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow=tlow/lambda*hedgesg 
  dhig=thig/lambda*hedgesg 
  results=round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  return(results)
}

smdVariables <- function(...,conf.level=.95,mu=0){
  data=data.frame(...)
  results=data.frame(matrix(ncol=4,nrow=0))
  for (i in 1:ncol(data)) results[i,]=smdVariable(data[,i],conf.level=conf.level,mu=mu)
  colnames(results)=c("d","g","LL","UL")
  rownames(results)=colnames(df)
  return(results)
}

smdGroups <- function(y,...) {
  results=aggregate(y,FUN=smdVariable,...)
  colnames(results)=c("Group","")
  return(results)
}

smdGroupDiff <- function(y,conf.level=.95,...){
  Groups=easiGroups(y,...)
  ns=as.numeric(Groups[[2]][1:2,1])
  mns=as.numeric(Groups[[2]][1:2,2])
  sds=as.numeric(Groups[[2]][1:2,3])
  ntilde=1/mean(1/ns) 
  dmn=abs(mns[2]-mns[1])
  sdp=sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
  cohend=dmn/sdp
  eta=ns[1]+ns[2]-2
  J=gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg=cohend*J
  lambda=hedgesg*sqrt(ntilde/2)
  tlow=qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig=qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow=tlow/lambda*hedgesg 
  dhig=thig/lambda*hedgesg 
  results=round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  return(results)
}

smdVariableDiff <- function(...,conf.level=.95){
  Vars=easiVariables(...)[1:2,c(1,2,3)]
  ns=as.numeric(Vars[1:2,1])
  mns=as.numeric(Vars[1:2,2])
  sds=as.numeric(Vars[1:2,3])
  ntilde=1/mean(1/ns) 
  dmn=abs(mns[2]-mns[1])
  sdp=sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
  cohend=dmn/sdp
  eta=ns[1]+ns[2]-2
  J=gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg=cohend*J
  r=cor(...)
  lambda=hedgesg*sqrt(ntilde/(2*(1-r)))
  tlow=qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig=qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow=tlow/lambda*hedgesg 
  dhig=thig/lambda*hedgesg 
  results=round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  return(results)
}

# Wrappers for SMD Functions
# These call the basic functions and print with titles

effectVariable <- function(y,...){
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE VARIABLE\n\n")
  results=smdVariable(y,...)
  print(results)
  cat("\n")
}

effectVariables <- function(...,conf.level=.95,mu=0){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE VARIABLES\n\n")
  results=smdVariables(...,conf.level=conf.level,mu=mu)
  print(results)
  cat("\n")
}

effectGroups <- function(y,...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS OF THE VARIABLE\n\n")
  results=smdGroups(y,...)
  print(results,row.names=FALSE)
  cat("\n")  
}

effectGroupDiff <- function(y,...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON ON THE VARIABLE\n\n")
  results=smdGroupDiff(y,...)
  print(results)
  cat("\n")  
}

effectVariableDiff <- function(...,conf.level=.95) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON OF THE VARIABLES\n\n")
  results=smdVariableDiff(...)
  print(results)
  cat("\n")  
}
