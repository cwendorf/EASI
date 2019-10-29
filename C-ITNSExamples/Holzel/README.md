# EASI: Estimation Approach to Statistical Inference

[**Home**](https://github.com/cwendorf/EASI/) | 
[**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) | 
[**Tutorial Examples**](https://github.com/cwendorf/EASI/tree/master/B-TutorialExamples) | 
[**ITNS Examples**](https://github.com/cwendorf/EASI/tree/master/C-ITNSExamples) | 
[**Extension Examples**](https://github.com/cwendorf/EASI/tree/master/D-ExtensionExamples)

---

## Mixed Design Example with Holzel Statistics

### Overview of this Example

The **Holzel** files analyze and example of a two-factor mixed design, one between-subjects and one within-subjects factor (from _[ITNS](https://thenewstatistics.com/itns/ "Introduction to the New Statistics")_, Ch. 15). These analyses include the following:

- Analyses of Variable Differences (equivalent to a comparison analysis two instances of a variable, seaprately at levels of the between-subjects factor)

### Details of this Example

The following files analyze the example using raw data input:

- [**_Holzel-Data-Syntax.R_**](./Holzel-Data-Syntax.R)
- [**_Holzel-Data-Output.R_**](./Holzel-Data-Output.R)
- [**_Holzel-Figure1.jpeg_**](./Holzel-Figure1.jpeg)
- [**_Holzel-Figure2.jpeg_**](./Holzel-Figure2.jpeg)

The following files analyze the example using summary statistics input:

- [**_Holzel-Summary-Syntax.R_**](./Holzel-Summary-Syntax.R)
- [**_Holzel-Summary-Output.R_**](./Holzel-Summary-Output.R)
- [**_Holzel-Figure1.jpeg_**](./Holzel-Figure1.jpeg)
- [**_Holzel-Figure2.jpeg_**](./Holzel-Figure2.jpeg)

> **Note: Results of these analyses will differ slightly from those in _ITNS_. This is because ESCI and EASI make different statistical assumptions about the data. See the [**Functions**](https://github.com/cwendorf/EASI/tree/master/A-Functions) page for more details.**

## References

Cumming, G., & Calin-Jageman, R. (2017). _Introduction to the new statistics._ New York: Routledge.
