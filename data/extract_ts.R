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

load("~/SACTN/data/SACTN_monthly_v4.2.RData")
print(unique(SACTN_monthly_v4.2$index))

extract_ts <- function(ts_index, file_name){
  SACTN_monthly_extract <- filter(SACTN_monthly_v4.2, index %in% ts_index)
  if(length(SACTN_monthly_extract) == 0){
    warning("Make sure the correct site index(es) is being provided. 
            The index(es) must be given as a character vector, or series thereof.")
  }
  save(SACTN_monthly_extract, file = paste0("~/Desktop/",file_name,".Rdata"))
  write_csv(SACTN_monthly_extract, path = paste0("~/Desktop/",file_name,".csv"))
}
