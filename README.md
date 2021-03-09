# airs-ngss-survey

## Accessing the data

The data is available on the Open Science Framework: https://osf.io/2jypf/

While private data is often stored in OSF repositories, public data may also be;
to download the data, run `osf.R`, which will download the two required files (in 
the `/data` directory):

- `/data/ngss-adoption-states.xlsx`
- `/data/ngss-adoption-survey.xlsx`

## Installing and Using the {targets} R package

To install {targets}:

```{r}
library(remotes)
install_github("wlandau/targets")
```

To run the project pipeline, enter and run the following function:

`targets::tar_make()`
