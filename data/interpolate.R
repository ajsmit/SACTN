#############################################################################
###"data/interpolate.R"
## This script does:
# 1. Load function required to interpolate data;
# 2. Interpolate a time series from a given data frame
## DEPENDS ON:
library(reshape2)
library(FNN)
library(akima)
## USED BY:
# Nothing
## CREATES:
# Results may vary
#############################################################################


# 1. Load function required to interpolate data ---------------------------

# This function takes a single user defined set of coordinates (coords): lon/ lat
# The user may also  input the desired site name (name)
# As well as a user defined dataframe (df) of temperature time series
# It then screens out time series baserd on a user defined range of dates (start, end): "YYYY-MM-DD"
# It then creates a time series for that point based on the nearest n (n) time series
# If the nearest time series are not long enough the next nearest time series are used instead
# A warning is returned when this is done
# The user may define if they want the function to expand (TRUE) the range used for interpolation or not (FALSE)

## For testing ##
# coords <- c(28.431673, -32.638033)
# coords <- c(17.89, -31.33)
# name <- "Qolora"
# df <- SACTNmonthly_v4.1
# n <- 5
# start <- "2005-01-01"
# end <- "2014-12-31"
# expand <- TRUE
##
  
interpolate <- function(coords, name = "New Site", df = SACTNmonthly_v4.1, n = 5, start = "2005-01-01", end = "2014-12-31", expand = TRUE){
  if(is.data.frame(coords) == F){
    coords <- data.frame(lon = coords[1], lat = coords[2])
  }
  sites1 <- site_list[site_list$date.start <= as.Date(start),]
  sites1 <- sites1[sites1$date.end >= as.Date(end),]
  if(length(sites1$site) < 1){
    stop("No time series cover the given range of dates. Please redefine the given date range.")
  }
  nn <- n-1
  df2 <- data.frame()
  while(length(df2) <= 12){
    nn <- nn+1
    sites2 <- droplevels(sites1[as.integer(knnx.index(sites1[,5:6], coords, k = nn)),])
    df1 <- df[df$index %in% sites2$index,]
    df2 <- dcast(df1, index~date, value.var = "temp")
    df3 <- df2[, colSums(is.na(df2)) == 0]
  }
  intrp <- function(dat){
    (interpp(x = sites2$lon, y = sites2$lat, z = as.matrix(dat), xo = coords$lon, yo = coords$lat, linear = TRUE, 
             extrap = TRUE, dupl = "mean"))$z
  }
  site <- data.frame(site = name, adply(df3[2:length(df3)], 2, intrp))[,1:3]
  if(length(site$V1[complete.cases(site$V1)]) == 0){
    sites3 <- droplevels(sites1[as.integer(knnx.index(sites1[,5:6], coords, k = 2)),])
    df4 <- df[df$index %in% sites3$index,]
    df5 <- dcast(df4, index~date, value.var = "temp")
    df6 <- df5[, colSums(is.na(df5)) == 0]
    site <- data.frame(site = name, adply(df6[2:length(df6)], 2, colMeans))
  }
  colnames(site)[2:3] <- c("date", "temp")
  return(site)
}


# 2. Interpolate a time series from a given data frame --------------------

# coords <- c(28.431673, -32.638033) # The coordinates for the coastline near Qolora
# qolora <- interpolate(coords, "Qolora", n = 12)

# save(qolora, file = "data/Qolora.Rdata")