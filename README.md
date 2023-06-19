# RGIE: A gene selection method associated with radiotherapy resistance in head and neck squamous cell carcinoma

This repository hosts the experimental code and data for the paper "RGIE: A gene selection method associated with radiotherapy resistance in head and neck squamous cell carcinoma".

## Dataset acquisition
The RNA sequencing (RNA-seq) data of HNSCC patients can be obtained from [The Cancer Genome Atlas (TCGA) database](https://portal.gdc.cancer.gov/), while information on whether the patients received radiotherapy and their survival can be obtained from the [XENA database](https://xenabrowser.net/datapages/).


## Document description

|Document|Description|
|:--|:--|
|1_EDASeq_normalization.R|R script file for downloading the TCGA-HNSC dataset and running EDASeq normalization.|
|2_data_preprocessinge.ipynb|Oversampling of radioresistance samples using SMOTE.|
|3_ReliefF_feature_selection.ipynb|Calculate the importance of genes and rank them.|
|4.1_GENIE3 sorting (ASC), feature elimination and classification.ipynb|First, the regulatory importance of genes is calculated using GENIE3. Second, sort the genes in ascending order. Then, run a feature elimination algorithm to select genes.|
|4.2_GENIE3 sorting (DESC), feature elimination and classification.ipynb|First, the regulatory importance of genes is calculated using GENIE3. Second, sort the genes in descending order. Then, run a feature elimination algorithm to select genes.|
|5.1_classifier_comparison_all_genes.ipynb|Comparison of classifier algorithms using all genes as input.|
|5.2_classifier_comparison_9_genes.ipynb|Comparison of classifier algorithms using the selected 9 genes as input.|
|5.3_confusion matrix_9_genes.ipynb|Confusion Matrix Analysis of Classification Algorithms.|
|6_Comparison_of_feature_selection_methods|Folder for feature selection algorithm comparisons.|
|GENIE3.py|GENIE3 algorithm.|


## Quick Start
1. Run "1_EDASeq_normalization.R" to download the gene expression matrix and perform EDASeq normalization.
2. Run "2_data_preprocessing.ipynb" to oversample radioresistance samples.
3. Run "3_ReliefF_feature_selection.ipynb" to calculate and rank the importance of genes.
4. Run "4.1_GENIE3 sorting (ASC), feature elimination and classification.ipynb" and "4.2_GENIE3 sorting (DESC), feature elimination and classification.ipynb" to calculate the regulatory importance of genes, sort (ascending order or descending order) and perform feature elimination.
5. Run "5.1_classifier_comparison_all_genes.ipynb", "5.2_classifier_comparison_9_genes.ipynb" and "5.3_confusion matrix_9_genes.ipynb" to compare the performance of the classifiers.
6. Run the code in the folder "6_Comparison_of_feature_selection_methods" to compare different feature selection algorithms.

## Result generation

To improve the reproducibility of the results, instructions for generating the results in the paper are given here.

|Item|Overview|Instruction|
|---|---|---|
|**Fig. 2** Performance of identifying HNSCC-RR with increasing number of genes in terms of feature importance.|![Fig. 2](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%202.jpg)| Run [3_ReliefF_feature_selection.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/3_ReliefF_feature_selection.ipynb) to calculate and rank the importance of genes. Then use the saved performance indicator files (files starting with ReliefF_ in the [result_data](https://github.com/dunhuiliu/RGIE/tree/main/result_data) directory) to draw Figure 2. |
|**Fig. 3** Feature importance of genes in the first 20 experiments.|![Fig. 3](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%203.jpg)|Run [3_ReliefF_feature_selection.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/3_ReliefF_feature_selection.ipynb) and plot the [result_data/sortedImp_60.xlsx](https://github.com/dunhuiliu/RGIE/blob/main/result_data/sortedImp_60.xlsx) file using MATLAB (See [Draw_feature_importance.m](https://github.com/dunhuiliu/RGIE/blob/main/result_figure/Draw_feature_importance.m) for the code.).|
|**Fig. 4** Sum of the feature importance values of the top 100 genes.|![Fig. 4](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%204.jpg)|Run [3_ReliefF_feature_selection.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/3_ReliefF_feature_selection.ipynb).|
|**Fig. 5** Classification performance of genes ranked by different methods.|![Fig. 5](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%205.jpg)|Run [4.1_GENIE3 sorting (ASC), feature elimination and classification.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/4.1_GENIE3%20sorting%20(ASC)%2C%20feature%20elimination%20and%20classification.ipynb) and [4.2_GENIE3 sorting (DESC), feature elimination and classification.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/4.2_GENIE3%20sorting%20(DESC)%2C%20feature%20elimination%20and%20classification.ipynb).|
|**Fig. 6** GI network of the final nine signature genes.|![Fig. 6](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%206.jpg)|Select the final 9 genes from the [GENIE3_ranking.txt](https://github.com/dunhuiliu/RGIE/blob/main/result_data/GENIE3_ranking.txt) file and use OriginLab software to draw Figure 6.|
|**Fig. 7** Gene ontology (GO) and signaling pathway analyses were performed on the signature genes.|![Fig. 7](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%207.jpg)|The plotting data is stored in [result_data/gopath](https://github.com/dunhuiliu/RGIE/tree/main/result_data/gopath). The figure was plotted by https://www.bioinformatics.com.cn , an online platform for data analysis and visualization.|
|**Table 3.** Classification performance comparison using all genes.|![Table 3](https://github.com/dunhuiliu/RGIE/blob/main/res/Table%203.jpg)|Run [5.1_classifier_comparison_all_genes.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/5.1_classifier_comparison_all_genes.ipynb).|
|**Table 4.** Classification performance comparison using the selected nine genes.|![Table 4](https://github.com/dunhuiliu/RGIE/blob/main/res/Table%204.jpg)|Run [5.2_classifier_comparison_9_genes.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/5.2_classifier_comparison_9_genes.ipynb).|
|**Fig. 8** Confusion matrix for different classifiers.|![Fig. 8](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%208.jpg)|Rum [5.3_confusion matrix_9_genes.ipynb](https://github.com/dunhuiliu/RGIE/blob/main/5.3_confusion%20matrix_9_genes.ipynb).|
|**Table 5.** Comparison of different feature selection methods.|![Table 5](https://github.com/dunhuiliu/RGIE/blob/main/res/Table%205.jpg)|Run the algorithms in the [6_Comparison_of_feature_selection_methods](https://github.com/dunhuiliu/RGIE/tree/main/6_Comparison_of_feature_selection_methods) directory.|
|**Fig. 9** qRT‐PCR validation of the expression of 9 signature genes.|![Fig. 9](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%209.jpg)|Experimental methods are noted in the Methods section of the manuscript.|
|**Fig. 10** Comparison of classification performance in the three steps when the number of genes is nine.|![Fig. 10](https://github.com/dunhuiliu/RGIE/blob/main/res/Figure%2010.jpg)|It can be plotted according to the results obtained before.|



## Contact us
You can ask questions by sending an email to: [dunhuiliu@163.com](dunhuiliu@163.com).
