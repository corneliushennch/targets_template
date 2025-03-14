# Header start =================================================================
# _targets.R
#
# Author: Hennch Cornelius (cornelius.hennch@charite.de)
#
# Description: 
# This script contains the entire pipeline definition thus providing an overview
# over all analysis steps.
#
# Code written according to Hadley Wickhams "tidyverse style guide"
# Based on the template treated by use_targets(). 
# Header end ===================================================================

# 1. Load packages required to define the pipeline -----------------------------
library(targets)
library(tarchetypes) # Load other packages as needed.

# 2. Set target options --------------------------------------------------------
tar_option_set(
  packages = c("tidyverse") # Packages that your targets need for their tasks.
  # format = "qs", # Optionally set the default storage format. qs is fast.
  #
  # Pipelines that take a long time to run may benefit from
  # optional distributed computing. To use this capability
  # in tar_make(), supply a {crew} controller
  # as discussed at https://books.ropensci.org/targets/crew.html.
  # Choose a controller that suits your needs. For example, the following
  # sets a controller that scales up to a maximum of two workers
  # which run as local R processes. Each worker launches when there is work
  # to do and exits if 60 seconds pass with no tasks to run.
  #
  #   controller = crew::crew_controller_local(workers = 2, seconds_idle = 60)
  #
  # Alternatively, if you want workers to run on a high-performance computing
  # cluster, select a controller from the {crew.cluster} package.
  # For the cloud, see plugin packages like {crew.aws.batch}.
  # The following example is a controller for Sun Grid Engine (SGE).
  # 
  #   controller = crew.cluster::crew_controller_sge(
  #     # Number of workers that the pipeline can scale up to:
  #     workers = 10,
  #     # It is recommended to set an idle time so workers can shut themselves
  #     # down if they are not running tasks.
  #     seconds_idle = 120,
  #     # Many clusters install R as an environment module, and you can load it
  #     # with the script_lines argument. To select a specific verison of R,
  #     # you may need to include a version string, e.g. "module load R/4.3.2".
  #     # Check with your system administrator if you are unsure.
  #     script_lines = "module load R"
  #   )
  #
  # Set other options as needed.
)

# Run the R scripts in the R/ folder with your custom functions:
tar_source()
# tar_source("other_functions.R") # Source other scripts as needed.

# 3. Targets pipeline ----------------------------------------------------------
list(
  
  ## 3.1 Import and tidy -------------------------------------------------------
  tar_target(
    name = data_file,
    command = "data/raw/sample_data.csv",
    format = "file",
    description = "Raw data file"
    # format = "qs" # Efficient storage for general data objects.
  ),
  
  # Import
  tar_target(
    name = data,
    command = import_data(data_file),
    description = "Sample data frame"
  ),
  
  ## 3.2 Transform -------------------------------------------------------------
  
  
  ## 3.3 Explore ---------------------------------------------------------------
  
  
  ## 3.4 Visualize -------------------------------------------------------------
  tar_target(
    name = scatterplot,
    command = plot_data(data),
    description = "Visualizing the data as a scatterplot"
  ),
  
  ## 3.5 Communicate -----------------------------------------------------------
  # PDF report
  tar_render(
    name = pdf_report,
    path = "markdown/report.qmd",
    output_format = "pdf_document",
    output_dir = "output/reports/",
    description = "PDF report"
  ),
  
  # HTML report
  tar_render(
    name = html_report,
    path = "markdown/report.qmd",
    output_format = "html_document",
    output_dir = "output/reports/",
    description = "HTML report"
  ),
  
  # presentation
  tar_render(
    name = presentation,
    path = "markdown/presentation.Rmd",
    #output_format = "pptx",
    output_dir = "output/presentations/",
    description = "Presentation"
  )
)
