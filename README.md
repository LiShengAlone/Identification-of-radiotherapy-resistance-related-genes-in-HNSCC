本研究展示了我们为分析与 HNSCC 放疗耐药性 (HNSCC-RR) 相关的 GI 所做的努力。 为了寻找识别 HNSCC-RR 的关键基因，我们提出了一种称为 RGIE（ReliefF，Genetic Interaction，feature Elimination）的基因筛选方法。 第一步是使用 ReliefF 来选择对放射治疗耐药性分类有鉴别力的基因子集。 接着利用GEne Network Inference with Ensemble of trees (GENIE3)算法得到该子集中的基因调控关系，并按照调控权重从小到大对基因进行排序。 最后一步涉及使用特征消除算法为 HNSCC-RR 选择最有效的特征基因。 RGIE在TCGA HNSC数据集上进行了验证，实验结果表明，该方法可有效筛选HNSCC-RR相关基因。 此外，还对头颈部鳞状细胞癌细胞系SCC9和放疗耐药细胞系SCC9-RR之间的特征基因进行了qRT-PCR检测。 结果表明两个细胞系之间有9个基因存在显着差异，证明了RGIE选择的这些特征基因的有效性。

因此，选择 12 个月的时间段来分割 HNSCC-RR 和放射治疗敏感 (HNSCC-RS) 患者。 选择 9 个月和 15 个月的时间段来拆分 HNSCC-RR 和 HNSCC-RS 组，以减少噪音和分类偏差。 HNSCC-RR 组包括 DFS 少于 9 个月的样本，而 HNSCC-RS 组包括 DFS 超过 15 个月的样本。==9-15月的样本去除需要说明==



The RNA sequencing (RNA-seq) data of HNSCC patients were obtained from [The Cancer Genome Atlas (TCGA) database](https://portal.gdc.cancer.gov/), while information on whether the patients received radiotherapy and their survival was obtained from [the XENA database](https://xenabrowser.net/datapages/).

