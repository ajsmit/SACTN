#############################################################################
###"munge/01-site.list.R"
## This script does:
# 1. Reads in site_list_v4.1.Rdata AND .csv;
## DEPENDS ON:
# Nothing
## USED BY:
# (expand on this)
## CREATES:
# Nothing
#############################################################################

#############################################################################
### These file are compiled manually

## Read in the .csv file
if(file.exists("~/SACTNraw/metadata/site_list_v4.2.csv")){
  site_list <- read_csv("~/SACTNraw/metadata/site_list_v4.2.csv")
  write_csv(site_list, path = "metadata/site_list_v4.2.csv")
}


## Read in the .Rdata file
if(file.exists("~/SACTNraw/metadata/site_list_v4.2.RData")){
  load("~/SACTNraw/metadata/site_list_v4.2.RData")
  save(site_list, file = "metadata/site_list_v4.2.RData")
}
load("metadata/site_list_v4.2.RData")

