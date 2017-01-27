#############################################################################
###"munge/02-daily.data.R"
## This script does:
# 1. Read in the raw data if there is access to it
## DEPENDS ON:
# Nothing
## USED BY:
# Nothing
## CREATES:
# Nothing
#############################################################################

#############################################################################
## Read in the raw data if there is access to it
# Otherwise only uses the data that were downloaded from GitHub

## NB: Daily data are only available upon specific requests re MOU's filed with respective bodies
# # Daily data
# if(file.exists("~/SACTNraw/data/SACTNdaily_v4.1.Rdata")){
#   load("~/SACTNraw/data/SACTNdaily_v4.1.Rdata")
#   save(SACTNdaily_v4.1, file = "data/SACTNdaily_v4.1.Rdata")
# }

# Monthly data
if(file.exists("~/SACTNraw/data/SACTNmonthly_v4.1.Rdata")){
  load("~/SACTNraw/data/SACTNmonthly_v4.1.Rdata")
  save(SACTNmonthly_v4.1, file = "data/SACTNmonthly_v4.1.Rdata")
}
load("data/SACTNmonthly_v4.1.Rdata")

# Annual data
if(file.exists("~/SACTNraw/data/SACTNannual_v4.1.Rdata")){
  load("~/SACTNraw/data/SACTNannual_v4.1.Rdata")
  save(SACTNannual_v4.1, file = "data/SACTNannual_v4.1.Rdata")
}
load("data/SACTNannual_v4.1.Rdata")

# Climatology data
if(file.exists("~/SACTNraw/data/SACTNclim_v4.1.Rdata")){
  load("~/SACTNraw/data/SACTNclim_v4.1.Rdata")
  save(SACTNclim_v4.1, file = "data/SACTNclim_v4.1.Rdata")
}
load("data/SACTNclim_v4.1.Rdata")
