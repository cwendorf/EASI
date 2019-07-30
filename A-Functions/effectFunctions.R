
# ESTIMATION APPROACH TO STATISTICAL INFERENCE (EASI)
## BASIC FUNCTIONS FOR MEANS AND MEAN DIFFERENCES 

### Standardized Mean Difference Functions

#### Basic SMD Function

smd <- function(y,conf.level=.95,mu=0,...){
  Var <- easi(y,...)
  n <- as.numeric(Var[1])
  m <- as.numeric(Var[2])
  sd <- as.numeric(Var[3])
  md <- m-mu
  cohend <- md/sd
  eta <- n-1
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  lambda <- hedgesg*sqrt(n)
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  round(c(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
}

#### SMD Function for Mutiple Groups and Variables

smdLevels <- function(...) 
  UseMethod("smdLevels")

smdLevels.default <- function(...,conf.level=.95,mu=0){
  data <- data.frame(...)
  results <- data.frame(matrix(ncol=4,nrow=0))
  for (i in 1:ncol(data)) results[i,] <- smd(data[,i],conf.level=conf.level,mu=mu)
  colnames(results) <- c("d","g","LL","UL")
  rownames(results) <- colnames(data)
  results
}

smdLevels.formula <- function(formula,...) {
  results <- aggregate(formula,FUN=smd,...)
  colnames(results) <- c("Group","")
  rownames(results) <- results[,1]
  results[2]
}

#### SMD Function for Group and Variable Differences

smdDifference <- function(...) 
  UseMethod("smdDifference")  

smdDifference.default <- function(...,conf.level=.95){
  Vars <- easiLevels(...)
  ns  <- as.numeric(Vars[1:2,1])
  mns <- as.numeric(Vars[1:2,2])
  sds <- as.numeric(Vars[1:2,3])
  ntilde <- 1/mean(1/ns) 
  md <- (mns[1]-mns[2])
  sdp <- sqrt((ns[1]-1)*sds[1]^2+(ns[2]-1)*sds[2]^2)/sqrt(ns[1]+ns[2]-2)
  cohend <- md/sdp
  eta <- ns[1]+ns[2]-2
  J <- gamma(eta/2)/(sqrt(eta/2)*gamma((eta-1)/2))
  hedgesg <- cohend*J
  r <- cor(...)
  lambda <- hedgesg*sqrt(ntilde/(2*(1-r)))
  tlow <- qt(1/2-conf.level/2,df=eta,ncp=lambda)
  thig <- qt(1/2+conf.level/2,df=eta,ncp=lambda)
  dlow <- tlow/lambda*hedgesg 
  dhig <- thig/lambda*hedgesg 
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  results
}

smdDifference.formula <- function(formula,conf.level=.95,...){
  Groups <- easiLevels(formula,...)
  ns <- as.numeric(Groups[1:2,1])
  mns <- as.numeric(Groups[1:2,2])
  sds <- as.numeric(Groups[1:2,3])
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
  results=round(cbind(d=cohend,g=hedgesg,LL=dlow,UL=dhig),3)
  rownames(results) <- c("Comparison")
  results
}

### Wrappers for SMD Functions

effectLevels <- function(...){
  cat("\nSTANDARDIZED MEAN DIFFERENCES FOR THE LEVELS\n\n")
  print(smdLevels(...))
  cat("\n")
}

effectDifference <- function(...) {
  cat("\nSTANDARDIZED MEAN DIFFERENCE FOR THE COMPARISON\n\n")
  print(smdDifference(...))
  cat("\n")  
}
