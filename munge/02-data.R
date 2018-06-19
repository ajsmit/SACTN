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
if(file.exists("~/SACTNraw/data/4_products/SACTN_monthly_v4.2.RData")){
  load("~/SACTNraw/data/4_products/SACTN_monthly_v4.2.RData")
  save(SACTN_monthly_v4.2, file = "data/SACTN_monthly_v4.2.RData")
}
load("data/SACTN_monthly_v4.2.RData")

# Yearly data
if(file.exists("~/SACTNraw/data/4_products/SACTN_yearly_v4.2.RData")){
  load("~/SACTNraw/data/4_products/SACTN_yearly_v4.2.RData")
  save(SACTN_yearly_v4.2, file = "data/SACTN_yearly_v4.2.RData")
}
load("data/SACTN_yearly_v4.2.RData")

# Climatology data
if(file.exists("~/SACTNraw/data/4_products/SACTN_clim_v4.2.RData")){
  load("~/SACTNraw/data/4_products/SACTN_clim_v4.2.RData")
  save(SACTN_clim_v4.2, file = "data/SACTN_clim_v4.2.RData")
}
load("data/SACTN_clim_v4.2.RData")
