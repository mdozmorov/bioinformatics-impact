# GitHub statistics as a measure of the impact of open-source bioinformatics software

Scripts to reproduce all results in the "GitHub statistics as a measure of the impact of open-source bioinformatics software" paper, accepted in Frontiers in Bioengineering and Biotechnology, section Bioinformatics and Computational Biology, [doi: 10.3389/fbioe.2018.00198](https://www.frontiersin.org/articles/10.3389/fbioe.2018.00198/abstract).

- **Manuscript**, [PDF](manuscript.pdf), [Rmd](manuscript_impact.Rmd)
- **Figure 1 - PCA of bioinformatics impact measures, colored by metric type.** [png](figures/Figure_impact_PCA.png)
- **Supplementary Figure 1 - Growth of publications in PubMed having the term "bioinformatics" in their title/abstract.** Y-axis is the proportion of bioinformatics publications out of the total number of publications, in percent. [png](figures/Figure_bioinformatics_paper_growth.png)
- **Supplementary Figure 2 - Correlogram of bioinformatics software impact metrics.** Each cell shows Pearson Correlation Coefficient (PCC) for the corresponding pair of metrics. Blue/Red gradient highlights low/high PCC, respectively. [png](figures/Figure_correlations.png)
- **Table 1. Popular collections of bioinformatics resources.** Accessed on 2018-11-30. [Markdown](tables/table_1.md)
- **Supplementary Tables**, [PDF](supplementary_tables.pdf)
    - **Supplementary Table 1. Select data science resources.** Metrics in all tables were assessed on 2018-11-30. [Markdown](tables/table_s1.md)
    - **Supplementary Table 2. Examples of lists of lists of computer science and machine learning resources.** [Markdown](tables/table_s2.md)
    - **Supplementary Table 3. Impact metrics of popular bioinformatics tools and resources.** Only software that is being developed on GitHub, has over 50 stars, and published in peer-review journals was selected. [Markdown](tables/table_s3.md)

- More links to data science, bioinformatics, statistics, and machine learning resources, [https://github.com/mdozmorov/blogs](https://github.com/mdozmorov/blogs)

## Compiling

- Download `CiteScore_Metrics_2011-2017_Download_25May2018.xlsx`, CiteScore metrics, into `data` folder. Downloaded from https://www.scopus.com/sources?dgcid=RN_AG_Sourced_300000264 on 10/22/2018. Requires login, click "Download Scopus Source List", then "Download source titles and metrics".
- Run `scripts/citescore.R` that will use `data/CiteScore_Metrics_2011-2017_Download_25May2018.xlsx` to create `tables/CiteScore_2017.csv` 
- Run `scripts/altmetrics.R` that will use `tables_altmetrics.csv` to create `Table_software_stats.csv`
- Run `figures_impact.Rmd` that will use `Table_software_stats.csv` to create `figures/Figure_bioinformatics_paper_growth.png`, `figures/Figure_impact_PCA.png`, `figures/Figure_correlations.png`
- `tables_impact.Rmd` will create its own tables and use `Table_software_stats.csv` to create Supplementary Table 3

## `root`

- `manuscript_impact.Rmd`, `tables_impact.Rmd`, `figures_impact.Rmd` - source files for the manuscript, tables, and figures, respectively

## `scripts`

- `altmetrics.R` - extracting data from `tables_altmetrics.csv`
- `citescore.R` - extracting data from `CiteScore_Metrics_2011-2017_Download_25May2018.xlsx` 
- `utils.R` - functions to make tables using GitHub API

## `styles`

- `Frontiers_Template.docx`, `frontiers-in-bioengineering-and-biotechnology.csl` - Frontiers Word doc template and citation style, respectively.

## `tables`

- `CiteScore_2017.csv` - CiteScore 2017 extracted with `scripts/citescore.R`
- `tables_altmetrics.csv` - GitHub repositories selected for the analysis. `tables_altmetrics1.csv`, `tables_altmetrics2.csv` - first and second parts of the extended list of GitHub repositories. Split in parts because unregistered GitHub API allows 60 queries/hour limit.
- `Table_software_stats.csv` - The final impact statistics table. `Table_software_stats1.csv`, `Table_software_stats2.csv` - first and second parts of the extended impact statistics table
