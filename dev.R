# Header start =================================================================
# dev.R
#
# Author: Hennch Cornelius (cornelius.hennch@charite.de)
#
# Description: This scripts is only used during development of the pipeline.
#
# Code written according to Hadley Wickhams "tidyverse style guide"
# Based on the template treated by use_targets(). 
# Header end ===================================================================

library(targets)
library(tarchetypes)

# Restart your R session.
rstudioapi::restartSession()

# Loads globals like tar_option_set() packages and functions
tar_load_globals()

# run the pipeline
tar_make()

# inspect the pipeline
tar_visnetwork()

# Load necessary / all objects
# tar_load() / tar_load_everything()


