library(leaflet)
sites <- read.csv("metadata/site_list_v4.2.csv")

pal <- colorFactor(palette = c("yellow", "orange", "green", "red", "turquoise", "navy", "blue"), 
                   domain = c("DAFF", "DEA", "EKZNW", "KZNSB", "SAEON", "SAWS", "UWC"))

content <- paste(sep = "<br/>", "<b>", sites$site, "</b>", sites$src, sites$type)

m1 = leaflet() %>%
  addProviderTiles("Esri.OceanBasemap",
                   options = providerTileOptions(opacity = 1.0)) %>%
  addCircleMarkers(lng = sites$lon, lat = sites$lat, group = sites$src,
                   popup = content, radius = 5, color = pal(sites$src),
                   stroke = FALSE, fillOpacity = 0.8) %>%
  setView(24, -31, zoom = 6)
m1
