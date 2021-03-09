#d <- tar_read(raw_data)

read_survey_data <- function() {
  read_excel(here("data", "ngss-adoption-survey.xlsx"))
}

read_state_data <- function() {

  read_excel(here("data", "ngss-adoption-states.xlsx"))
}

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
