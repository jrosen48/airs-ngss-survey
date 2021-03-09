#d <- tar_read(raw_data)

join_data <- function(survey_data, state_data) {
  survey_data %>%
    rename(location = Location) %>%
    left_join(state_data)
}

process_data <- function(data) {
  data %>%
    mutate(year = parse_number(dataset)) %>%
    mutate(location_fct = fct_reorder(location, category_no))
}

access_osf_data <- function() {

  if (!dir_exists("data")) dir_create("data")

  if (!file_exists(here("data", "ngss-adoption-states.xlsx"))) {

    ngss_adoption_states_download <- osf_retrieve_file("bymvz") %>%
      osf_download(here("data"))

  }

  if (!file_exists(here("data", "ngss-adoption-survey.xlsx"))) {

    ngss_adoption_survey_download <- osf_retrieve_file("me2qr") %>%
      osf_download(here("data"))

  }
}
