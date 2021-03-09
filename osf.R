library(osfr)
library(here)
library(fs)

if (!dir_exists("data")) dir_create("data")

if (!file_exists(here("data", "ngss-adoption-states.xlsx"))) {

  ngss_adoption_states_download <- osf_retrieve_file("bymvz") %>%
    osf_download(here("data"), conflicts = "skip")

}

if (!file_exists(here("data", "ngss-adoption-survey.xlsx"))) {

  ngss_adoption_survey_download <- osf_retrieve_file("me2qr") %>%
    osf_download(here("data"), conflicts = "skip")

}
