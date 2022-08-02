
## Advanced Applications

### Overview of the Applications

Applications represent advanced and undocumented features of EASI. Data and summary statistics for these applications are from a variety of published and simulated sources. Also in the spirit of experimentation, all applications use the native pipe operator to identify data sources rather than using standard R syntax.

### Exploratory Data Analyses and Enhanced Plots

The **ExploratoryAnalyses** files analyze boxplots, violin plots, beanplots, and rainclouds:

- [*ExploratoryAnalysesOneWayDataApplications*](./ExploratoryAnalysesOneWayDataApplications.md) - Uses one-way (between-subjects) data
- [*ExploratoryAnalysesRepeatedMeasuresDataApplications*](./ExploratoryAnalysesRepeatedMeasuresDataApplications.md) - Uses repeated measures (within-subjects) data

The **EnhancedPlots** files analyze confidence interval plots with plausibility curves:

- [*EnhancedPlotsOneWayDataApplications*](./EnhancedPlotsOneWayDataApplications.md) - Uses one-way (between-subjects) data
- [*EnhancedPlotsRepeatedMeasuresDataApplications*](./EnhancedPlotsRepeatedMeasuresDataApplications.md) - Uses repeated measures (within-subjects) data

### Pairwise, Posthoc, and Relational Intervals

The **RelationalIntervals** files examine means and mean differences using the concepts of relational and arelational intervals (Wendorf, 2012):

- [*RelationalIntervalsOneWayDataApplications*](./RelationalIntervalsOneWayDataApplications.md) - Uses one-way (between-subjects) data
- [*RelationalIntervalsRepeatedMeasuresDataApplications*](./RelationalIntervalsRepeatedMeasuresDataApplications.md) - Uses repeated measures (within-subjects) data

The **Pairwise** files examine unadjusted pairwise comparisons and Tukey post hoc comparisons using traditional confidence interval plots and diffograms:

- [*PairwiseOneWayDataApplications*](./PairwiseOneWayDataApplications.md) - Uses one-way (between-subjects) data
- [*PairwiseRepeatedMeasuresDataApplications*](./PairwiseRepeatedMeasuresDataApplications.md) - Uses repeated measures (within-subjects) data

### Simple Effects in Factorial and Mixed Designs

The **FactorialBy**  and **MixedBy** files implement "by" functions designed to replicate the analyses of simple effects in factorial and mixed designs:

- [*FactorialByDataApplications*](./FactorialByDataApplications.md) - Uses two-way factorial (between-subjects) data
- [*MixedByDataApplications*](./MixedByDataApplications.md) - Uses two-way mixed design (between-subjects and within-subjects) data

The **Exposition** files implement a exposition pipe operator to simplify the use of subsets (like in the analyses of simple effects) and enhance the plots in factorial and mixed designs:

- [*ExpositionFactorialDataApplications*](./ExpositionFactorialDataApplications.md) - Uses two-way factorial (between-subjects) data
- [*ExpositionMixedDataApplications*](./ExpositionMixedDataApplications.md) - Uses two-way mixed design (between-subjects and within-subjects) data
