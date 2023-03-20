
## Advanced Applications

### Overview of the Applications

Applications represent advanced and undocumented features of EASI. Data for these applications are from a variety of published and simulated sources. In the spirit of experimentation, all applications use the native pipe operator to identify data sources (rather than using standard R syntax) and add color to enhance plots.

### Descriptive and Exploratory Analyses

The **Frequencies** files analyze basic frequency and percentile information for measures or groups:

- [*FrequenciesOneWayDataAppplication*](./FrequenciesOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*FrequenciesRepeatedMeasuresDataAppplication*](./FrequenciesRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

The **Exploratory** files analyze boxplots, violin plots, beanplots, and rainclouds:

- [*ExploratoryOneWayDataAppplication*](./ExploratoryOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*ExploratoryRepeatedMeasuresDataAppplication*](./ExploratoryRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

### Pairwise and Post Hoc Analyses

The **Pairwise** files examine unadjusted pairwise comparisons and Tukey post hoc comparisons using traditional confidence interval plots and diffograms:

- [*PairwiseOneWayDataAppplication*](./PairwiseOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*PairwiseRepeatedMeasuresDataAppplication*](./PairwiseRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

The **Relational** files examine means and mean differences using the concepts of relational and arelational intervals (Wendorf, 2012):

- [*RelationalOneWayDataAppplication*](./RelationalOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*RelationalRepeatedMeasuresDataAppplication*](./RelationalRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

### Contrast Plots and Contrast Comparisons

The **Contrasts** files analyze confidence interval plots for comparisons and contrasts by adding data and plausibility curves:

- [*ContrastsOneWayDataAppplication*](./ContrastsOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*ContrastsRepeatedMeasuresDataAppplication*](./ContrastsRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

The **Complex** files analyze differences between two contrasts on the same measures or groups:

- [*ComplexOneWayDataAppplication*](./ComplexOneWayDataAppplication.md) - Uses one-way (between-subjects) data
- [*ComplexRepeatedMeasuresDataAppplication*](./ComplexRepeatedMeasuresDataAppplication.md) - Uses repeated measures (within-subjects) data

### Simple Effects in Factorial and Mixed Designs

The **FactorialBy**  and **MixedBy** files implement "by" functions designed to replicate the analyses of simple effects in factorial and mixed designs:

- [*FactorialByDataAppplication*](./FactorialByDataAppplication.md) - Uses two-way factorial (between-subjects) data
- [*MixedByDataAppplication*](./MixedByDataAppplication.md) - Uses two-way mixed design (between-subjects and within-subjects) data

The **Exposition** files implement a exposition pipe operator to simplify the use of subsets (like in the analyses of simple effects) and enhance the plots in factorial and mixed designs:

- [*ExpositionFactorialDataAppplication*](./ExpositionFactorialDataAppplication.md) - Uses two-way factorial (between-subjects) data
- [*ExpositionMixedDataAppplication*](./ExpositionMixedDataAppplication.md) - Uses two-way mixed design (between-subjects and within-subjects) data
