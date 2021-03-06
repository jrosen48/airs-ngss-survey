library(targets)

source(here::here("r", "functions.R"))
source(here::here("osf.R"))

# Set target-specific options such as packages.
tar_option_set(packages = c("here", "tidyverse", "readxl", "janitor", "rmarkdown",
                            "osfr", "fs", "targets", "cowplot"))

# Define targets
targets <- list(

  # reading data
  tar_target(survey_data, read_excel(here("data", "ngss-adoption-survey.xlsx"))),
  tar_target(state_data, read_excel(here("data", "ngss-adoption-states.xlsx"))),

  # processing data
  tar_target(joined_data, join_data(survey_data, state_data)),
  tar_target(joined_data_proc, clean_names(joined_data)),
  tar_target(joined_data_parsed, process_data(joined_data_proc)),
  tar_target(joined_data_to_model, prep_data_for_plot(joined_data_parsed)),

  # output
  tar_target(report, render("report.Rmd",
                            output_file = "docs/report.html",
                            params = list(data = joined_data_to_model)),
                            cue = tar_cue(mode = "always")
  ),
  tar_target(report_pdf, render("report.Rmd",
                                output_format = "pdf_document",
                                output_file = "docs/report.pdf",
                                params = list(data = joined_data_to_model)),
                                cue = tar_cue(mode = "always")
  ),
  tar_target(target_doc, render("targets.Rmd",
                                output_file = "docs/targets.html",
                                params = list(data = joined_data_to_model)),
                                cue = tar_cue(mode = "always")
  ),

  tar_target(index, render(here("docs", "index.Rmd"))),
  tar_target(site, render_site("docs")),

  tar_target(upload_report, upload_pdf_report(report_pdf)) # requires authentication via OSF

)

# End with a call to tar_pipeline() to wrangle the targets together.
# This target script must return a pipeline object.
targets
