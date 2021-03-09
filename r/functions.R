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

prep_data_for_plot <- function(data) {
  data %>%
    mutate(year = as.factor(year),
           ymin = category_yes - (margin_of_error_yes / 2),
           ymax = category_yes + (margin_of_error_yes / 2))
}

upload_pdf_report <- function(pdf_report) {
  pdf_report
  osf_retrieve_node("2jypf") %>%
    osf_upload(path = here("docs", "report.pdf"))
}
