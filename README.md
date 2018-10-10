# Impact of bioinformatics software: community-driven merit-based metrics

Scripts to reproduce all results in the "Impact of bioinformatics software: community-driven merit-based metrics" paper.

- `manuscript_impact.Rmd` - manuscript RMarkdown file
- `impact.bib` - BibTex references

Compiling:

- `scripts/altmetrics.R` will use `tables_altmetrics.csv` to create `Table_software_stats.csv`
- `figures_impact.Rmd` will use `Table_software_stats.csv` to create `Figure_bioinformatics_paper_growth.png`, `Figure_impact_PCA.png`, `Figure_correlations.png`
- `tables_impact.Rmd` will create its own tables and use `Table_software_stats.csv` to create supplementary table 3

## `scripts`

- `scholar.R`, `altmetrics.R` - testing the corresponding packages
- `utils.R` - functions to make tables

## `styles`

- `Arial_8_single_space_narrow_margins_landscape.docx` - Word doc template for table layout
- `Arial_11_single_space_normal_margins.docx` - Word doc template for manuscript layout
- `the-embo-journal.csl` - reference style

## `tables`

- `tables_altmetrics.csv` - the github repositories selected for GitHub API query.
- `Table_software_stats.csv` - the final impact statistics table
