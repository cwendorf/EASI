
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
# STANDARDIZED MEAN DIFFERENCE FUNCTIONS 

# Basic SMD Function

smd <- function(y,conf.level=.95,mu=0,...){
  Var=easi(y,...)
  n=as.numeric(Var[1])
  mn=as.numeric(Var[2])
  sd=as.numeric(Var[3])
  dmn=mn-mu
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
  dmn=(mns[1]-mns[2])
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
  dmn=(mns[1]-mns[2])
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

# SMD Function for Pairwise Group and Variable Comparisons

smdPairwise <- function(...) 
  UseMethod("smdPairwise")
  
smdPairwise.default <- function(...,conf.level=.95){
  Vars=easiLevels(...)
  nr=dim(Vars)[1]
  rn=rownames(Vars)
  ncomp=(nr)*(nr-1)/2
  results=data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)=c("d","g","LL","UL")
  comp=1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp]=paste(rn[i],"v",rn[j])
	varx=get(rn[i])
	vary=get(rn[j])
    ns=as.numeric(Vars[c(i,j),1])
	mns=as.numeric(Vars[c(i,j),2])
	sds=as.numeric(Vars[c(i,j),3])
	ntilde=1/mean(1/ns) 
	dmn=(mns[1]-mns[2])
	sdp=sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
	cohend=dmn/sdp
	eta=ns[1]+ns[2]-2
	J=gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
	hedgesg=cohend*J
	r=cor(varx,vary)
	lambda=hedgesg*sqrt(ntilde/(2*(1-r)))
	tlow=qt(1/2-conf.level/2,df=eta,ncp=lambda)
	thig=qt(1/2+conf.level/2,df=eta,ncp=lambda)
	dlow=tlow/lambda*hedgesg 
	dhig=thig/lambda*hedgesg 
    results[comp,]=c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp=comp+1
  }
  }
return(round(results,3))
} 
 
smdPairwise.formula <- function(formula,conf.level=.95,...){
  Groups=easiLevels(formula,...)
  nr=dim(Groups)[1]
  rn=rownames(Groups)
  ncomp=(nr)*(nr-1)/2
  results=data.frame(matrix(ncol=4,nrow=ncomp))
  colnames(results)=c("d","g","LL","UL")
  comp=1
  for( i in 1:(nr-1) ){
  for( j in (i+1):nr ){
    rownames(results)[comp]=paste(rn[i],"v",rn[j])
	ns=as.numeric(Groups[c(i,j),1])
	mns=as.numeric(Groups[c(i,j),2])
	sds=as.numeric(Groups[c(i,j),3])
	ntilde=1/mean(1/ns) 
	dmn=(mns[1]-mns[2])
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
    results[comp,]=c(d=cohend,g=hedgesg,LL=dlow,UL=dhig)
  	comp=comp+1
  }
  }
return(round(results,3))
}

# Wrappers for SMD Functions
# These call the functions and print with titles

effectLevels <- function(...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS\n\n")
  results=smdLevels(...)
  print(results)
  cat("\n")
}

effectDifference <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  results=smdDifference(...)
  print(results)
  cat("\n")  
}

effectPairwise <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE PAIRWISE COMPARISONS\n\n")
  results=smdPairwise(...)
  print(results)
  cat("\n")  
}