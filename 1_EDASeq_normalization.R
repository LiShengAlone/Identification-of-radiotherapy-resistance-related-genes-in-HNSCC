# Normalize gene expression matrices by EDASeq.

rm(list=ls())

# Install BiocManager
if(!require("BiocManager")) install.packages("BiocManager",update = F,ask = F)
BiocManager::install("SummarizedExperiment")
BiocManager::install("TCGAbiolinks")

# Load the package.
library(TCGAbiolinks)
query <- GDCquery(project = "TCGA-HNSC",
                  data.category = "Transcriptome Profiling",
                  data.type = "Gene Expression Quantification",
                  workflow.type = "HTSeq - Counts")

samplesDown <- getResults(query,cols=c("cases"))  
getResults(query, rows, cols)
head(samplesDown)

# Screen barcode for tumor and normal tissue.
# TP stands for PRIMARY SOLID TUMOR;
# NT stands for Solid Tissue Normal.

dataSmTP <- TCGAquery_SampleTypes(barcode = samplesDown, typesample = "TP")
View(dataSmTP )

dataSmNT <- TCGAquery_SampleTypes(barcode = samplesDown,typesample = "NT")
View(dataSmNT)

# Set the barcodes parameter. Filter data based on barcode.
queryDown <- GDCquery(project = "TCGA-HNSC", 
                      data.category = "Transcriptome Profiling",
                      data.type = "Gene Expression Quantification", 
                      workflow.type = "HTSeq - Counts", 
                      barcode = c(dataSmTP, dataSmNT))

# Download data.
GDCdownload(queryDown, method = "api", files.per.chunk = 6)


library(SummarizedExperiment)

dataPrep1 <- GDCprepare(query = queryDown, save = TRUE, save.filename = "data/HNSC_case.Rda")
count_matrix=assay(dataPrep1)

# save document.
write.csv(count_matrix,file = paste("TCGA-HNSC","data/Counts.csv",sep = "-"))

# Screen the sample data with tumor purity greater than or equal to 0%.
purityDATA <- TCGAtumor_purity(colnames(dataPrep1), 0, 0, 0, 0, 0)

# filtered is the filtered data, pure_barcodes is the tumor data we want.
Purity.HNSC<-purityDATA$pure_barcodes
normal.HNSC<-purityDATA$filtered

puried_data <-count_matrix[,c(Purity.HNSC,normal.HNSC)]

# Load the SummarizedExperiment package.
library("SummarizedExperiment")

rowData(dataPrep1)

# Write the results to the file "puried.HNSC.csv".
rownames(puried_data)<-rowData(dataPrep1)$external_gene_name
write.csv(puried_data,file = "puried.HNSC.csv",quote = FALSE)

# Perform expression matrix normalization and filtering.
# TCGAanalyze_Normalization performs the following functions in the EDASeq package:
#1. EDASeq::newSeqExpressionSet
#2. EDASeq::withinLaneNormalization
#3. EDASeq::betweenLaneNormalization
#4. EDASeq::counts
dataNorm <- TCGAanalyze_Normalization(tabDF = puried_data, geneInfo = geneInfo, method = "gcContent")

str(dataNorm)
write.csv(dataNorm,file = "data/EDASeq_Normalized.csv",quote = FALSE) 
