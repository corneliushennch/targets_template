# Header start =================================================================
# 00_functions.R
#
# Author: Hennch Cornelius (cornelius.hennch@charite.de)
#
# Description: This script contains all the functions used in the _targets.R
# pipeline aka "the muscle"
#
# Code written according to Hadley Wickhams "tidyverse style guide"
# Header end ===================================================================

# 1. Data wrangling functions --------------------------------------------------
import_data <- function(file) {
  readr::read_csv2(file, col_types = cols(), col_select = -1)
}

# 2. Model functions -----------------------------------------------------------


# 3. Plotting functions --------------------------------------------------------
plot_data <- function(data) {
  ggplot(data) +
    geom_point(aes(x = Sepal.Length, y = Sepal.Width, color = Species)) +
    theme_classic(12)
}