# Estimation Approach to Statistical Inference

[**Functions**](../../Functions) | 
[**Tutorials**](../../Tutorials) | 
[**Examples**](../../Examples) | 
[**Advanced**](../../Advanced)

---

## Pairwise Comparisons - OneWay (Between-Subjects) Tutorial with Data

### Enter Data

```r
Factor <- c(rep(1,4),rep(2,4),rep(3,4))
Outcome <- c(0,0,3,5,4,7,4,9,9,6,4,9)
Factor <- factor(Factor,levels=c(1,2,3),labels=c("Level1","Level2","Level3"))
PairwiseOneWayData <- data.frame(Factor,Outcome)
PairwiseOneWayData
```
```
   Factor Outcome
1  Level1       0
2  Level1       0
3  Level1       3
4  Level1       5
5  Level2       4
6  Level2       7
7  Level2       4
8  Level2       9
9  Level3       9
10 Level3       6
11 Level3       4
12 Level3       9
```

### Analyses of Pairwise Comparisons

#### Confidence Intervals for the Pairwise Comparisons

```r
estimatePairwise(Outcome~Factor)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                 Diff    SE    df     LL    UL
Level1 v Level2 4.000 1.732 6.000 -0.237 8.237
Level1 v Level3 5.000 1.732 6.000  0.763 9.237
Level2 v Level3 1.000 1.732 6.000 -3.237 5.237
```

```r
estimatePairwise(Outcome~Factor,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE PAIRWISE COMPARISONS

                 Diff    SE    df     LL     UL
Level1 v Level2 4.000 1.732 6.000 -2.420 10.420
Level1 v Level3 5.000 1.732 6.000 -1.420 11.420
Level2 v Level3 1.000 1.732 6.000 -5.420  7.420
```

#### Plots of the Confidence Intervals for the Pairwise Comparisons

```r
plotPairwise(Outcome~Factor)
```
<kbd><img src="PairwiseOneWayFigure1.jpeg"></kbd>
```r
plotPairwise(Outcome~Factor,mu=-2,conf.level=.99,rope=c(-4,0))
```
<kbd><img src="PairwiseOneWayFigure2.jpeg"></kbd>

#### Significance Tests of the Pairwise Comparisons

```r
testPairwise(Outcome~Factor)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                 Diff    SE     t    df     p
Level1 v Level2 4.000 1.732 2.310 6.000 0.060
Level1 v Level3 5.000 1.732 2.887 6.000 0.028
Level2 v Level3 1.000 1.732 0.577 6.000 0.585
```

```r
testPairwise(Outcome~Factor,mu=-2)
```
```
HYPOTHESIS TESTS FOR THE PAIRWISE COMPARISONS

                 Diff    SE     t    df     p
Level1 v Level2 6.000 1.732 3.465 6.000 0.013
Level1 v Level3 7.000 1.732 4.042 6.000 0.007
Level2 v Level3 3.000 1.732 1.732 6.000 0.134
```

#### Effect Sizes for the Pairwise Comparisons

```r
standardizePairwise(Outcome~Factor)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                  Est    SE     LL    UL
Level1 v Level2 1.633 0.943 -0.215 3.481
Level1 v Level3 2.042 1.007  0.068 4.015
Level2 v Level3 0.408 0.825 -1.209 2.025
```

```r
standardizePairwise(Outcome~Factor,conf.level=.99)
```
```
CONFIDENCE INTERVALS FOR THE STANDARDIZED PAIRWISE COMPARISONS

                  Est    SE     LL    UL
Level1 v Level2 1.633 0.943 -0.795 4.062
Level1 v Level3 2.042 1.007 -0.552 4.635
Level2 v Level3 0.408 0.825 -1.717 2.533
```