#-----------------------------
# CHATON-Download-Public-Data.R
#
# Download publicly available datasets
# from the Open Science Framework
# https://osf.io/s7vrb/
#
# datasets are saved in:
# CHATON-Primary-Analysis/data
#-----------------------------


#-----------------------------
# preamble - source config file
#-----------------------------
library(here)
source(here("R/0-CHATON-primary-Config.R"))

#-----------------------------
# Download data from osf.io
#-----------------------------

# main child analysis dataset
# https://osf.io/qt8se
chaton_full_dataset_public <- osf_retrieve_file("qt8se") %>%
  osf_download(path=here("data"), conflicts = "overwrite", progress = TRUE)

# ineligible children used to make CONSORT
# https://osf.io/ynqa2
chaton_inelig_dataset_public <- osf_retrieve_file("ynqa2") %>%
  osf_download(path=here("data"), conflicts = "overwrite", progress = TRUE)

#-----------------------------
# session info
#-----------------------------
sessionInfo()

