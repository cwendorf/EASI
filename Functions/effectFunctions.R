
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# STANDARDIZED MEAN DIFFERENCE FUNCTIONS 

# Basic SMD Functions

smd <- function(y,conf.level=.95,mu=0,...){
  Var=easi(y,...)
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

# SMD Function for Mutiple Groups and Variables

smdLevels <- function(...) 
  UseMethod("smdLevels")

smdLevels.default <- function(...,conf.level=.95,mu=0){
  data=data.frame(...)
  results=data.frame(matrix(ncol=4,nrow=0))
  for (i in 1:ncol(data)) results[i,]=smd(data[,i],conf.level=conf.level,mu=mu)
  colnames(results)=c("d","g","LL","UL")
  rownames(results)=colnames(df)
  return(results)
}

smdLevels.formula <- function(formula,...) {
  results=aggregate(formula,FUN=smd,...)
  colnames(results)=c("Group","")
  rownames(results)=results[,1]
  return(results[2])
}

# SMD Function for Group and Variable Differences

smdDifference <- function(...) 
  UseMethod("smdDifference")  

smdDifference.default <- function(...,conf.level=.95){
  Vars=easiLevels(...)
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

smdDifference.formula <- function(formula,conf.level=.95,...){
  Groups=easiLevels(formula,...)
  ns=as.numeric(Groups[1:2,1])
  mns=as.numeric(Groups[1:2,2])
  sds=as.numeric(Groups[1:2,3])
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

smdDifference(Outcome~Comparison)

# Wrappers for SMD Functions
# These call the functions and print with titles

effectLevels <- function(y,...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS\n\n")
  results=smdLevels(y,...)
  print(results)
  cat("\n")
}

effectDifference <- function(y,...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  results=smdDifference(y,...)
  print(results)
  cat("\n")  
}

