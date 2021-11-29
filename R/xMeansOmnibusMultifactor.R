# Estimation Approach to Statistical Inference
## Mean Omnibus Analysis (Multifactor Designs)

### Helper

.error.list <- function(sourceby) {
  source <- sourceby[[1]]+sourceby[[2]]
  source[,3] <- source[,1]/source[,2]
  return(source)
}

.main.list <- function(meansby) {
  wm <- lapply(meansby,FUN=function(x) (x[,1]*x[,2]))
  wm <- matrix(unlist(wm),nrow=length(wm),ncol=length(wm[[1]]),byrow=TRUE)
  n <- lapply(meansby,FUN=function(x) (x[,1]))
  n <- matrix(unlist(n),nrow=length(n),ncol=length(n[[1]]),byrow=TRUE)
  m <- lapply(meansby,FUN=function(x) (x[,2]))
  m <- matrix(unlist(m),ncol=length(m[[1]]),nrow=length(m),byrow=TRUE)
  gm <- sum(wm)/sum(n)
  ssmodel <- sum(n*(m-gm)^2)
  num <- apply(wm,2,sum)
  den <- apply(n,2,sum)
  mn <- num/den
  ssfa <- sum(den*(mn-gm)^2)
  dfa <- length(mn)-1
  msa <- ssfa/dfa
  fa <- c(ssfa,dfa,msa)
  num <- apply(wm,1,sum)
  den <- apply(n,1,sum)
  mn <- num/den
  ssfb <- sum(den*(mn-gm)^2)
  dfb <- length(mn)-1
  msb <- ssfb/dfb
  fb <- c(ssfb,dfb,msb)
  ssint <- ssmodel-ssfa-ssfb
  dfint <- dfa*dfb
  msint <- ssint/dfint
  int <- c(ssint,dfint,msint)
  out <- rbind(fb,fa,int)
  colnames(out) <- c("SS","df","MS")
  return(out)
}

### Descriptives

.describeMeansOmnibusMultifactor <- function(x,...) 
  UseMethod(".describeMeansOmnibusMultifactor")

.describeMeansOmnibusMultifactor.wss <- function(ListDescStats,ListCorrStats) {
  main <- .main.list(ListDescStats)
  ListSourceStats <- .describeMeansOmnibusBy.wss(ListDescStats,ListCorrStats)
  error <- .error.list(ListSourceStats)
  out1 <- rbind(main[1,],error[1,])
  rownames(out1) <- c("Block","Subjects")
  out2 <- rbind(main[2:3,],error[-1:-2,])
  rownames(out2) <- c("Measures","Measures:Block","Residual")  
  results <- list(out1,out2)
  names(results) <- c("Between Subjects","Within Subjects")
  return(results)
}

.describeMeansOmnibusMultifactor.bss <- function(ListDescStats) {
  main <- .main.list(ListDescStats)
  ListSourceStats <- .describeMeansOmnibusBy.bss(ListDescStats)
  error <- .error.list(ListSourceStats)
  out <- rbind(main[1:3,],error[-1,])
  rownames(out) <- c("Block","Factor","Factor:Block","Residual")
  results <- list(out)
  names(results) <- "Between Subjects"
  return(results)
}

.describeMeansOmnibusMultifactor.default <- function(...,by) {
  ListDescStats <- .describeMeansBy.default(...,by=by)
  ListCorrStats <- .describeCorrelationsBy.default(...,by=by)
  .describeMeansOmnibusMultifactor.wss(ListDescStats,ListCorrStats)
}

.describeMeansOmnibusMultifactor.formula <- function(formula,by) {
  ListDescStats <- .describeMeansBy.formula(formula,by=by)
  .describeMeansOmnibusMultifactor.bss(ListDescStats)
}

describeMeansOmnibusMultifactor <- function(...,main=NULL,digits=3) {
  results <- .describeMeansOmnibusMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Source Table for the Effects"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}

### Null Hypothesis Significance Tests

.testMeansOmnibusMultifactor <- function(x,...) 
  UseMethod(".testMeansOmnibusMultifactor")

.testMeansOmnibusMultifactor.wss <- function(ListDescStats,ListCorrStats) {
  out <- .describeMeansOmnibusMultifactor.wss(ListDescStats,ListCorrStats)
  for(i in 1:length(out)) {
    out[[i]]=cbind(out[[i]],NA,NA,NA,NA)
    out[[i]][,4]=out[[i]][,3]/tail(out[[i]][,3],1)
    out[[i]][,5]=out[[i]][,2]
    out[[i]][,6]=tail(out[[i]][,2],1)
    out[[i]][,7]=1-pf(out[[i]][,4],out[[i]][,2],tail(out[[i]][,2],1))
    out[[i]]=out[[i]][,4:7]
    colnames(out[[i]]) <- c("F","df1","df2","p")
  }
  out[[1]]=rbind(out[[1]][-2,])
  rownames(out[[1]])="Block"
  out[[2]]=as.data.frame(out[[2]][-3,])
  return(out)
}

.testMeansOmnibusMultifactor.bss <- function(ListDescStats) {
  out <- .describeMeansOmnibusMultifactor.bss(ListDescStats)
  i=1
  out[[i]]=cbind(out[[i]],NA,NA,NA,NA)
  out[[i]][,4]=out[[i]][,3]/tail(out[[i]][,3],1)
  out[[i]][,5]=out[[i]][,2]
  out[[i]][,6]=tail(out[[i]][,2],1)
  out[[i]][,7]=1-pf(out[[i]][,4],out[[i]][,2],tail(out[[i]][,2],1))
  out[[i]]=out[[i]][-4,4:7]
  colnames(out[[i]]) <- c("F","df1","df2","p")
  return(out)
}

.testMeansOmnibusMultifactor.default <- function(...,by) {
  ListDescStats <- .describeMeansBy.default(...,by=by)
  ListCorrStats <- .describeCorrelationsBy.default(...,by=by)
  .testMeansOmnibusMultifactor.wss(ListDescStats,ListCorrStats)
}

.testMeansOmnibusMultifactor.formula <- function(formula,by) {
  ListDescStats <- .describeMeansBy.formula(formula,by=by)
  .testMeansOmnibusMultifactor.bss(ListDescStats)
}

testMeansOmnibusMultifactor <- function(...,main=NULL,digits=3) {
  results <- .testMeansOmnibusMultifactor(...)
  nm = names(results)
  results <- .formatList(results,digits=digits)
  if(is.null(main)) {main <- "Hypothesis Tests for the Effects"} 
  names(results) = paste(main,nm,sep=": ")
  return(results)
}
