#############################################################################
###"graph/line.graph.R"
## This script does:
# 1. Subsets monthly data as preferred;
# 2. Creates line graph of data
## DEPENDS ON:
require(ggplot2)
## USED BY:
# Nothing
## CREATES:
# Results may vary
#############################################################################

#############################################################################
## Subsets monthly data as preferred
monthlyData <- droplevels(SACTNmonthly_v4.1[SACTNmonthly_v4.1$src == "KZNSB",])
monthlyData$date <- as.Date(monthlyData$date) # convert from "POSIXct" to "Date" for plotting

#############################################################################
## Creates line graph of data

# Here is the base code from which one can play around to create new things
lg <- ggplot(data = monthlyData, aes(x = date, y = temp)) + bw_update +
  #geom_line() +
  geom_line(aes(colour = site)) +
  facet_grid(site ~ .) +
  scale_x_date(date_breaks = "1 year", date_labels = "%Y", expand = c(0.015,0)) +
  ylab(expression(paste("Temperature (", degree~C, ")"))) + xlab("Date") +
  theme(axis.text.x = element_text(angle = 45, vjust = 0.5),
        legend.position = "none")
lg
ggsave("graphs/KZNSBsites.pdf", height = 36, width = 12)
