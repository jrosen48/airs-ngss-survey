library(osfr)
library(here)

ngss_adoption_states_download <- osf_retrieve_file("bymvz") %>%
  osf_download(here("data"))

ngss_adoption_survey_download <- osf_retrieve_file("me2qr") %>%
  osf_download(here("data"))
