#-----------------------------
# CHATON-primary-Config.R
#
# configuration file for
# the CHATON primary analyses
#-----------------------------


#-----------------------------
# load packages
#-----------------------------

# environment
library(here)
library(renv)

# data processing
library(tidyverse)
library(readr)
library(tibble)
library(data.table)
library(osfr)

# data visualization
library(kableExtra)
library(scales)
library(table1)

# data documentation 
library(janitor) 
library(labelled) # for adding labels to datasets

# parallel computing
library(foreach)
library(doParallel)
registerDoParallel(detectCores() - 1)

#-----------------------------
# custom color palettes
#-----------------------------
# safe color blind palette
# http://jfly.iam.u-tokyo.ac.jp/color/
# http://www.cookbook-r.com/Graphs/Colors_(ggplot2)/
# Reference: Bang Wong, Nature Methods 2011: https://www.nature.com/articles/nmeth.1618
cbpal <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#-----------------------------
# define project directory paths
#-----------------------------
raw_data_folder <- "~/Library/CloudStorage/Box-Box/Burkina Faso/CHATON/data/raw/"
data_folder <- "~/Library/CloudStorage/Box-Box/Burkina Faso/CHATON/data/"
tab_dir <- "~/Library/CloudStorage/Box-Box/Burkina Faso/CHATON/data/tables/"
