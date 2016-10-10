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
if(file.exists("~/SACTNraw/metadata/site_list_v4.1.csv")){
  site_list <- read.csv("~/SACTNraw/metadata/site_list_v4.1.csv")
  write.csv(site_list, file = "metadata/site_list_v4.1.csv", row.names = F)
}


## Read in the .Rdata file
if(file.exists("~/SACTNraw/metadata/site_list_v4.1.Rdata")){
  load("~/SACTNraw/metadata/site_list_v4.1.Rdata")
  save(site_list, file = "metadata/site_list_v4.1.Rdata")
}
load("metadata/site_list_v4.1.Rdata")

