
## Advanced Applications

### Overview of the Applications

Applications represent advanced and undocumented features of EASI. Data for these applications are from a variety of published and simulated sources. In the spirit of experimentation, all applications use the native pipe operator to identify data sources (rather than using standard R syntax) and add color to enhance plots.

### Descriptive and Exploratory Analyses

The **Frequencies** files analyze basic frequency distributions and boxplots for measures or groups:

- [*FrequenciesOneWayDataApplication*](./FrequenciesOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*FrequenciesRepeatedMeasuresDataApplication*](./FrequenciesRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

The **Exploratory** files analyze violin plots, beanplots, and raincloud plots:

- [*ExploratoryOneWayDataApplication*](./ExploratoryOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*ExploratoryRepeatedMeasuresDataApplication*](./ExploratoryRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

### Pairwise and Post Hoc Analyses

The **Pairwise** files examine unadjusted pairwise comparisons and Tukey post hoc comparisons using traditional confidence interval plots and diffograms:

- [*PairwiseOneWayDataApplication*](./PairwiseOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*PairwiseRepeatedMeasuresDataApplication*](./PairwiseRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

The **Relational** files examine means and mean differences using the concepts of relational and arelational intervals (Wendorf, 2012):

- [*RelationalOneWayDataApplication*](./RelationalOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*RelationalRepeatedMeasuresDataApplication*](./RelationalRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

### Contrast Plots and Contrast Comparisons

The **Contrasts** files analyze confidence interval plots for comparisons and contrasts by adding data and plausibility curves:

- [*ContrastsOneWayDataApplication*](./ContrastsOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*ContrastsRepeatedMeasuresDataApplication*](./ContrastsRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

The **Complex** files analyze differences between two contrasts on the same measures or groups:

- [*ComplexOneWayDataApplication*](./ComplexOneWayDataApplication.md) - Uses one-way (between-subjects) data
- [*ComplexRepeatedMeasuresDataApplication*](./ComplexRepeatedMeasuresDataApplication.md) - Uses repeated measures (within-subjects) data

### Simple Effects in Factorial and Mixed Designs

The **FactorialBy**  and **MixedBy** files implement "by" functions designed to replicate the analyses of simple effects in factorial and mixed designs:

- [*FactorialByDataApplication*](./FactorialByDataApplication.md) - Uses two-way factorial (between-subjects) data
- [*MixedByDataApplication*](./MixedByDataApplication.md) - Uses two-way mixed design (between-subjects and within-subjects) data

The **Exposition** files implement a exposition pipe operator to simplify the use of subsets (like in the analyses of simple effects) and enhance the plots in factorial and mixed designs:

- [*ExpositionFactorialDataApplication*](./ExpositionFactorialDataApplication.md) - Uses two-way factorial (between-subjects) data
- [*ExpositionMixedDataApplication*](./ExpositionMixedDataApplication.md) - Uses two-way mixed design (between-subjects and within-subjects) data
