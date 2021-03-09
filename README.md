# airs-ngss-survey

## Background

This is a repository for an analysis of the extent to which science teachers across the United States
consider themselves to be teaching the [Next Generation Science Standards](https://ngss.nsta.org/About.aspx).

The project uses a number of tools to address a number of challenges and/or to leverage certain opportunities:

  - git/GitHub for sharing _code_ publicly in a way that promotes collaboration and transparency
  - [Open Science Framework (OSF)](https://osf.io/) for 
  - OSF for sharing _data_ (even large datasets) in either a private or public repository
  - OSF for sharing _products_, including reports and pre- and post-prints
  - [{osfr}](https://github.com/ropensci/osfr) for _linking_ between these efficiently

## How to reproduce this analysis 

### 1. Access the data

The data is available on the Open Science Framework: https://osf.io/2jypf/

While private data is often stored in OSF repositories, public data may also be;
to download the data, run the R script `osf.R`, which will download the two required files (in 
the `/data` directory):

- `/data/ngss-adoption-states.xlsx`
- `/data/ngss-adoption-survey.xlsx`

If this data were a part of a private repository, you would first need to be granted
access to the repository. Then, you would need to [authenticate your identity via 
osfr](https://cran.r-project.org/web/packages/osfr/vignettes/auth.html).

### 2. Access this repository

Clone or download this repository from its homepage. 

### 3. Open the R Project in this repository

This step requires having [R](https://www.r-project.org/) and [RStudio](https://rstudio.com) installed first.

Open the project by clicking on `airs-ngss-survey.Rproj`. This opens the project in RStudio.

### 4. Installing the {targets} R package

The [{targets}](https://cran.r-project.org/web/packages/targets/index.html) R package is used to run all
of the analyses for this project.

To install {targets}:

```{r}
library(remotes)
install_github("wlandau/targets")
```

### 5. Running the analysis

To run the project pipeline, enter and run the following function in the RStudio console:

`targets::tar_make()`

This will run all of the analyses and create the output, including an R Markdown report. If any
part of the analysis that a later parts depends upon changes, then running the above command
will re-run all of the analyses from that point forward. 
