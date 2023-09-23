## Theme OneWay Data Application

This page shows how to enhance different types of plots with EASI color themes using one-way (between-subjects) data.

### Data Management

Simulate some data.

```r
Factor <- c(rep(1,10),rep(2,10),rep(3,10),rep(4,10),rep(5,10))
Outcome <- c(61,64,72,64,64,70,73,65,65,72,69,74,79,69,64,64,69,69,74,79,70,75,80,80,70,65,70,75,70,70,70,80,85,75,70,65,75,75,85,80,65,55,70,65,65,70,70,60,65,70)
Factor <- factor(Factor,levels=c(1,2,3,4,5),labels=c("Level1","Level2","Level3","Level4","Level5"))
```

### Analyses of the Means

Rather than directly specifying colors for each level, simply specify a built-in color theme (like EASI's "muted" theme, which is the default if "theme" is used).

```r
(Outcome~Factor) |> plotMeans(col=theme())
(Outcome~Factor) |> plotData(col=theme(),add=TRUE)
```

![](figures/Theme-OneWay-MeansA-1.png)<!-- -->

For larger number of levels, it may be preferably to use colors along a spectrum (similar to the vibrant or muted themes, though with the color orders determined mathematically) and have R determine the number of levels across the main effect.

```r
(Outcome~Factor) |> plotMeans(col=theme("muted","main",nlevels(Factor)))
(Outcome~Factor) |> plotData(col=theme("muted","main",nlevels(Factor)),add=TRUE)
```

![](figures/Theme-OneWay-MeansB-1.png)<!-- -->

### Analyses of a Comparison

In plotting a comparison, it may be preferable to use a theme for the main elements (like the confidence intervals and plausibility curves), but use a set color for the comparison portion of the graph. To do this, use the "comp" parameter (instead of "main").

```r
Comparison = factor(Factor,c("Level1","Level2"))
(Outcome~Comparison) |> plotMeanComparison(col=theme("vibrant","comp"))
(Outcome~Comparison) |> plotPlausible(col=theme("vibrant","comp"),add=TRUE)
```

![](figures/Theme-OneWay-Comparison-1.png)<!-- -->
