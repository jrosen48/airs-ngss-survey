library(targets)

source(here::here("R", "functions.R"))

# Set target-specific options such as packages.
tar_option_set(packages = c("here", "tidyverse", "readxl", "janitor", "rmarkdown"))

# Define targets
targets <- list(

  # reading data
  tar_target(survey_data, read_excel(here("data", "ngss-adoption-survey.xlsx"))),
  tar_target(state_data, read_excel(here("data", "ngss-adoption-states.xlsx"))),

  # processing data
  tar_target(joined_data, join_data(survey_data, state_data)),
  tar_target(joined_data_proc, clean_names(joined_data)),
  tar_target(joined_data_to_model, process_data(joined_data_proc)),

  # output
  tar_target(report, rmarkdown::render("report.Rmd",
                                       output_file = "docs/report.html",
                                       params = list(data = joined_data_to_model))
  ),
  tar_target(target_doc, rmarkdown::render("targets.Rmd",
                                           output_file = "docs/targets.html",
                                           params = list(data = joined_data_to_model))
  ),
  tar_target(index, rmarkdown::render(here("docs", "index.Rmd"))),
  tar_target(site, render_site("docs"))

)

# End with a call to tar_pipeline() to wrangle the targets together.
# This target script must return a pipeline object.
targets
