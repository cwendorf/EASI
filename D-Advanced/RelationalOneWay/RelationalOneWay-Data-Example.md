# Estimation Approach to Statistical Inference

[**Functions**](../../A-Functions) | 
[**Tutorials**](../../B-Tutorials) | 
[**Examples**](../../C-Examples) | 
[**Advanced**](../../D-Advanced)

---

## Relational Intervals - OneWay (Between-Subjects) Example with Wendorf Data

### Source the EASI Functions

```r
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Functions.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Omnibus-Extension.R")
source("http://raw.githubusercontent.com/cwendorf/EASI/master/A-Functions/EASI-Relational-Extension.R")
```

### Enter Data

```r
Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("L1","L2","L3","L4","L5"))
WendorfData <- data.frame(Factor,Outcome)
WendorfData
```
```
   Factor Outcome
1      L1      61
2      L1      64
3      L1      72
4      L1      64
5      L1      64
6      L1      70
7      L1      73
8      L1      65
9      L1      65
10     L1      72
11     L2      69
12     L2      74
13     L2      79
14     L2      69
15     L2      64
16     L2      64
17     L2      69
18     L2      69
19     L2      74
20     L2      79
21     L3      70
22     L3      75
23     L3      80
24     L3      80
25     L3      70
26     L3      65
27     L3      70
28     L3      75
29     L3      70
30     L3      70
31     L4      70
32     L4      80
33     L4      85
34     L4      75
35     L4      70
36     L4      65
37     L4      75
38     L4      75
39     L4      85
40     L4      80
41     L5      65
42     L5      55
43     L5      70
44     L5      65
45     L5      65
46     L5      70
47     L5      70
48     L5      60
49     L5      65
50     L5      70
```

### Relational Intervals

```r
estimateRelational(Outcome~Factor)
```
```
CONFIDENCE AND RELATIONAL INTERVALS FOR THE MEANS

      M  CI.LL  CI.UL  RI.LL  RI.UL
L1 67.0 63.928 70.072 64.625 69.375
L2 71.0 67.155 74.845 68.625 73.375
L3 72.5 69.024 75.976 70.125 74.875
L4 76.0 71.291 80.709 73.625 78.375
L5 65.5 61.943 69.057 63.125 67.875
```

```r
plotMeans(Outcome~Factor) # RelationalOneWay-Figure1.jpeg
```
<kbd><img src="RelationalOneWay-Figure1.jpeg"></kbd>
```r
addRelational(Outcome~Factor) # RelationalOneWay-Figure2.jpeg
```
<kbd><img src="RelationalOneWay-Figure2.jpeg"></kbd>
```r
addData(Outcome~Factor) # RelationalOneWay-Figure3.jpeg
```
<kbd><img src="RelationalOneWay-Figure3.jpeg"></kbd>
```r
plotRelational(Outcome~Factor) # RelationalOneWay-Figure4.jpeg
```
<kbd><img src="RelationalOneWay-Figure4.jpeg"></kbd>
```r
plotRelational(Outcome~Factor,conf.level=.99,mu=70) # RelationalOneWay-Figure5.jpeg
```
<kbd><img src="RelationalOneWay-Figure5.jpeg"></kbd>
```r
addData(Outcome~Factor,method="stack",col="black") # RelationalOneWay-Figure6.jpeg
```
<kbd><img src="RelationalOneWay-Figure6.jpeg"></kbd>