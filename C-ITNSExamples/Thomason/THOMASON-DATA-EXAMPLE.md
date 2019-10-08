# Estimation Approach to Statistical Inference (EASI)

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Other Examples**](https://github.com/cwendorf/EASI/tree/master/D-OtherExamples) 

---

## Paired Samples Example with Thomason Data

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/ALL-EASI-FUNCTIONS.R")
```

### Thomason1 Example

```r
Pretest <- c(13,12,12,9,14,17,14,9,6,7,11,15)
Posttest <- c(14,13,16,12,15,18,13,10,10,8,14,16)
```
```r
plotDifference(Pretest,Posttest)
```
<kbd><img src="Thomason-Figure1.jpg"></kbd>
```r
standardizeDifference(Pretest,Posttest)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE    LL     UL
Comparison -0.536 0.181 -0.89 -0.181
```

### Thomason2 Example

```r
Pretest <- c(10,14,7,12,11,11,15,14,9,16,10,11,13,19,19,15)
Posttest <- c(12,19,6,9,15,13,17,14,10,17,9,14,15,22,18,18)
```
```r
plotDifference(Pretest,Posttest)
```
<kbd><img src="Thomason-Figure2.jpg"></kbd>
```r
standardizeDifference(Pretest,Posttest)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL     UL
Comparison -0.356 0.154 -0.658 -0.053
```

### Thomason3 Example

```r
Pretest <- c(41,50,71,70,74,75,64,72,77,53,60,73,72,62,68,63,69,71,70,70,75,71,76,64,70,65,75,66,70,70,64,72,63,68,64,61,63,76,71)
Posttest <- c(52,63,69,71,80,80,69,76,78,77,67,76,69,73,73,68,70,81,70,76,77,75,69,77,70,76,65,64,72,71,63,78,71,77,67,66,73,75,75)
```
```r
plotDifference(Pretest,Posttest)
```
<kbd><img src="Thomason-Figure3.jpg"></kbd>
```r
standardizeDifference(Pretest,Posttest)
```
```
CONFIDENCE INTERVAL FOR THE STANDARDIZED COMPARISON

              Est    SE     LL     UL
Comparison -0.652 0.161 -0.967 -0.338
```
