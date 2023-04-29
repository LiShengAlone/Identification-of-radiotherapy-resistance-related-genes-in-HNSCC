# RGIE: A gene selection method associated with radiotherapy resistance in head and neck squamous cell carcinoma

This repository hosts the experimental code and data for the paper "RGIE: A gene selection method associated with radiotherapy resistance in head and neck squamous cell carcinoma".

## Dataset acquisition
The RNA sequencing (RNA-seq) data of HNSCC patients can be obtained from [The Cancer Genome Atlas (TCGA) database](https://portal.gdc.cancer.gov/), while information on whether the patients received radiotherapy and their survival can be obtained from [the XENA database](https://xenabrowser.net/datapages/).


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

## Contact us
You can ask questions by sending an email to: [dunhuiliu@163.com](dunhuiliu@163.com).
