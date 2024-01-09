#-----------------------------
# CHATON-primary-run-all.R
#
# Run all analysis scripts
# for CHATON primary analyses
#
# there are 9 scripts, all 
# in R markdown in:
# CHATON-Primary-Analysis/R
#
# output is saved in:
# CHATON-Primary-Analysis/output
#-----------------------------

#-----------------------------
# preamble - source config file
#-----------------------------
library(here)
source(here("R/0-CHATON-primary-Config.R"))

#-----------------------------
# Download public datasets
#-----------------------------
source(here("R/0-CHATON-Download-Public-Data.R"))

#-----------------------------
# Figure 1
# CONSORT participant flow
#-----------------------------
rmarkdown::render(here::here("R/1-CHATON-Consort.Rmd"),
                  output_file = here::here("output/1-CHATON-Consort.html"))

#-----------------------------
# Table 1
# Baseline balance
#-----------------------------
rmarkdown::render(here::here("R/2-CHATON-Baseline.Rmd"),
                  output_file = here::here("output/2-CHATON-Baseline.html"))

#-----------------------------
# Table 2, row 1
# Primary outcome analysis
#-----------------------------
rmarkdown::render(here::here("R/3-CHATON-Mortality.Rmd"),
                  output_file = here::here("output/3-CHATON-Mortality.html"))

#-----------------------------
# Table 2, remaining rows
# Subgroup analyses for
# all cause mortality
#-----------------------------
rmarkdown::render(here::here("R/4-CHATON-Mortality-Subgroup.Rmd"),
                  output_file = here::here("output/4-CHATON-Mortality-Subgroup.html"))

#-----------------------------
# Table 2, final row
# additional subgroup:
# community level treatment 
# assignment in the CHAT trial
#-----------------------------
rmarkdown::render(here::here("R/5-CHATON-Mortality-Subgroup-Factorial.Rmd"),
                  output_file = here::here("output/5-CHATON-Mortality-Subgroup-Factorial.html"))

#-----------------------------
# Table 3
# adverse events
#-----------------------------
rmarkdown::render(here::here("R/6-CHATON-AdverseEvents.Rmd"),
                  output_file = here::here("output/6-CHATON-AdverseEvents.html"))

#-----------------------------
# Table 4
# secondary outcome analyses
#-----------------------------
rmarkdown::render(here::here("R/7-CHATON-Secondary.Rmd"),
                  output_file = here::here("output/7-CHATON-Secondary.html"))


#-----------------------------
# Table S1
# compare age and sex of 
# CHATON to the general population
# 
# NOTE: this script will not
# run on public data because
# it joins to a separate trial's
# data using internal (not public) IDs
#-----------------------------
rmarkdown::render(here::here("R/8-CHATON-Trial-Population.Rmd"),
                  output_file = here::here("output/8-CHATON-Trial-Population.html"))


#-----------------------------
# Table S2
# baseline characteristics
# by arm and follow-up status
#-----------------------------
rmarkdown::render(here::here("R/9-CHATON-Baseline-LTFU.Rmd"),
                  output_file = here::here("output/9-CHATON-Baseline-LTFU.html"))

#-----------------------------
# Table S3
# incidence rates
# deaths per 1000 person-years
#-----------------------------
rmarkdown::render(here::here("R/10-CHATON-Incidence.Rmd"),
                  output_file = here::here("output/10-CHATON-Incidence.html"))

#-----------------------------
# Table S4
# analysis restricted to infants 
# residing in communities not 
# enrolled in the CHAT trial
#-----------------------------
rmarkdown::render(here::here("R/11-CHATON-Sensitivity.Rmd"),
                  output_file = here::here("output/11-CHATON-Sensitivity.html"))


#-----------------------------
# session info
#-----------------------------
sessionInfo()

