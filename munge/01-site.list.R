#############################################################################
###"munge/01-site.list.R"
## This script does:
# 1. Reads in site_list_v4.0.csv;
# 2. Runs script that ensures correct ordering of sites
## DEPENDS ON:
# Nothing
## USED BY:
# (expand on this)
## CREATES:
# Nothing
#############################################################################

#############################################################################
## Read in the .csv file
  # This file is compiled manually
if(file.exists("~/SACTNraw/metadata/site_list_v4.0.csv")){
  site_list <- read.csv("~/SACTNraw/metadata/site_list_v4.0.csv")
  write.csv(site_list, file = "metadata/site_list_v4.0.csv", row.names = F)
}
site_list <- read.csv("metadata/site_list_v4.0.csv")
