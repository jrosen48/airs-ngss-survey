# airs-ngss-survey

## Background

This is a repository for an analysis of the extent to which science teachers across the United States
consider themselves to be teaching the [Next Generation Science Standards](https://ngss.nsta.org/About.aspx).

This is an example repository for a project that involves the analysis of summary
data from a large-scale assessment. It uses data from the following source:

- [RAND American Instructional Resources Survey (AIRS) Project](https://www.rand.org/education-and-labor/projects/aep/selected-projects/airs.html)

The project uses a number of tools to address a number of challenges and/or to leverage certain opportunities:

  - git/GitHub for sharing _code_ publicly in a way that promotes collaboration and transparency
  - [Open Science Framework (OSF)](https://osf.io/) for 
  - OSF for sharing _data_ (even large datasets) in either a private or public repository
  - OSF for sharing _products_, including reports and pre- and post-prints
  - [{osfr}](https://github.com/ropensci/osfr) for _linking_ between these efficiently

## How to reproduce this analysis 

### 1. Access this repository

Clone or download this repository from its homepage. 

### 2. Open the R Project in this repository

This step requires having [R](https://www.r-project.org/) and [RStudio](https://rstudio.com) installed first.

Open the project by clicking on `airs-ngss-survey.Rproj`. This opens the project in RStudio.

Install the required packages by running the following function in your R console:

```{r}
install.packages(c("here", "tidyverse", "readxl", "janitor", "rmarkdown", "osfr", "fs", "targets"))
```

### 3. Running the analysis

To run the project pipeline, enter and run the following function in the RStudio console:

`targets::tar_make()`

This will run all of the analyses and create the output, including an R Markdown report. 

This includes accessing the data from OSF (available [here](https://osf.io/2jypf/)) via the {osfr} package.

If any part of the analysis that a later parts depends upon changes, 
then running the above command will re-run all of the analyses from that point forward. 

*Note on data.*
While private data is often stored in OSF repositories, public data may also be;
the targets plan will download the two required files (in 
the `/data` directory). If this data were a part of a private repository, you would first need to be granted access to the repository. Then, you would need to [authenticate your identity via 
osfr](https://cran.r-project.org/web/packages/osfr/vignettes/auth.html).
