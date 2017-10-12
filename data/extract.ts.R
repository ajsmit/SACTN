#############################################################################
###"data/extract.ts.R"
## This script does:
# 1. Extracts one or many specific time series from the monthly data
## DEPENDS ON:
library(tidyverse)
## USED BY:
# Whenever anyone makes a data request
## CREATES:
#
#############################################################################

load("~/SACTN/data/SACTNmonthly_v4.1.Rdata")
print(unique(SACTNmonthly_v4.1$index))

extract.ts <- function(ts_index, file_name){
  SACTNmonthly_extract <- filter(SACTNmonthly_v4.1, index %in% ts_index)
  if(length(SACTNmonthly_extract) == 0){
    warning("Make sure the correct site index(es) is being provided. 
            The index(es) must be given as a character vector, or series thereof.")
  }
  save(SACTNmonthly_extract, file = paste0("~/Desktop/",file_name,".Rdata"))
  write_csv(SACTNmonthly_extract, path = paste0("~/Desktop/",file_name,".csv"))
}