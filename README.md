# GitHub statistics as a measure of the impact of open-source bioinformatics software

Scripts to reproduce all results in the "GitHub statistics as a measure of the impact of open-source bioinformatics software" paper, accepted in Frontiers in Bioengineering and Biotechnology, section Bioinformatics and Computational Biology, [doi: 10.3389/fbioe.2018.00198](https://www.frontiersin.org/articles/10.3389/fbioe.2018.00198/abstract).

## Links

- [Rxivist, bioinformatics authors](https://rxivist.org/?category=bioinformatics&view=standard&entity=authors) - most cited authors in bioinformatics

- [projmgr](https://emilyriederer.github.io/projmgr/index.html) aims to better integrate project management into your workflow and free up time for more exciting tasks like R coding and data analysis. Since many R users and programmers use GitHub as a home for their analysis, the goal of projmgr is to streamline project management with these same tools.

- [jdtrat/ghee](https://github.com/jdtrat/ghee) - Provides a lightweight interface for Github through R

- [GitDiscoverer](https://rajkstats.shinyapps.io/git_discoverer_app/) - An app to discover trending repositories, trending developers and popular projects in ML/DL on Github. [RStudio announcement](https://community.rstudio.com/t/re-work-of-gitdiscoverer-2020-shiny-contest-submission/58325)

- [GitMemory](https://gitmemory.com) - history of github activity of individual users and repositories [Github User Rank List](https://gitmemory.com/rank)

- The missing star history graph of github repos https://star-history.t9t.io, https://github.com/timqian/star-history

- `fCite` - fractional citation tool, better metric to quantify scientific output, an aggregate of several metrics (FLAE, FLAE2, FLAE3, EC). http://www.fcite.org/
    - Kozlowski, Lukasz Pawel. “FCite: A Fractional Citation Tool to Quantify an Individual’s Scientific Research Output.” Preprint. Scientific Communication and Education, September 21, 2019. https://doi.org/10.1101/771485.

- A list of R developers and advocates on Github. https://github.com/amrrs/awesome_R_Githubers

- Meta-Research: Tracking the popularity and outcomes of all bioRxiv preprints, https://elifesciences.org/articles/45133

- Top 1% of highly cited researchers in 2018, https://hcr.clarivate.com/#

- Journal impact factor correlates with the number of their followers on Twitter, https://twitter.com/generegulation/status/1101537375962976262?s=03

- Tracking the popularity and outcomes of all bioRxiv preprints. https://www.bioverlay.org/post/2019-03-tracking-the-popularity-and-outcomes-of-all-biorxiv-preprints/, https://rxivist.org/

- Resumes generated using the GitHub informations. Web site, http://resume.github.io/, and GitHub source code, https://github.com/resume/resume.github.com

- "Top Biomedical GitHub Repos" - top 15 bioinformatics repositories (including Keras) with top citations. https://blog.semanticscholar.org/top-biomedical-github-repos-3ea15cf1930a

- Twitter accounts recommended to scientists working on gene regulation. https://generegulation.org/twitter-accounts-for-gene-regulation-scientists/

- How to use Twitter to further your research career, https://www.nature.com/articles/d41586-019-00535-w

- [Bioinformatics-Workflow-Managers-Tools-Platforms-Languages-Specifications-Standards](https://docs.google.com/spreadsheets/d/1plkAsT_S3CzSeb7ivxyjRnHyrK3JclUCXeUMf_azraY/edit#gid=0) - who is who in #Bioinformatics #Workflow managers with repo metrics.

- API providing access to papers and authors scraped from biorxiv.org. Online, https://rxivist.org/, GitHub, https://github.com/blekhmanlab/rxivist

- "Reviewer-coerced citation: Case report, update on journal policy, and suggestions for future prevention" Jonathan D Wren,  Alfonso Valencia,  Janet Kelso. _Bioinformatics_, https://doi.org/10.1093/bioinformatics/btz071. Published: 30 January 2019.

- An updated ranking of institutes and countries based on developed biological databases is available at http://bigd.big.ac.cn/databasecommons/stat.

- A list of predatory journals, https://predatoryjournals.com/, GitHub, https://github.com/stop-predatory-journals/stop-predatory-journals.github.io

- `statcheck` - An R package and a web tool to extract statistics from articles and recompute p-values. http://statcheck.io/, https://cran.r-project.org/web/packages/statcheck/index.html, https://mbnuijten.com/statcheck/

- Introducing eLife’s first computationally reproducible article. https://elifesciences.org/labs/ad58f08d/introducing-elife-s-first-computationally-reproducible-article


# Files

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

- Open an [issue](https://github.com/mdozmorov/bioinformatics-impact/issues) to report additional resources. See [closed issues](https://github.com/mdozmorov/bioinformatics-impact/issues?q=is%3Aissue+is%3Aclosed) for additional resources.

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
