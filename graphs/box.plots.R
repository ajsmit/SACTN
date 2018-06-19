#############################################################################
###"graph/box.plots.R"
## This script does:
# 1. Subset monthly data as preferred;
# 2. Create boxplots of data
## DEPENDS ON:
require(ggplot2); require(lubridate)
## USED BY:
# Nothing
## CREATES:
# Results may vary
#############################################################################


# 1. Subset monthly data as preferred -------------------------------------

levels(SACTN_monthly_v4.2$index)
index <- c("Port Nolloth/ DEA", "Port Nolloth/ SAWS", "Port Nolloth/ UWC")
monthlyData <- droplevels(SACTN_monthly_v4.2[SACTN_monthly_v4.2$index %in% index,])
monthlyData$date <- as.Date(monthlyData$date) # convert from "POSIXct" to "Date" for plotting
monthlyData$month <- month(monthlyData$date, label = TRUE)


# 2. Create boxplots of data ----------------------------------------------

# Here is the base code from which one can play around to create new things
bp <- ggplot(data = monthlyData, aes(x = month, y = temp)) + bw_update +
  geom_boxplot(aes(fill = index), show.legend = FALSE, colour = "black") +
  # facet_wrap(~index, ncol = 3) +
  # scale_x_date(date_breaks = "1 year", date_labels = "%Y", expand = c(0.015,0)) +
  labs(y = expression(paste("Temperature (", degree~C, ")")), x = "")# +
  # theme(axis.text.x = element_text(angle = 45, vjust = 0.5))
bp
ggsave("graphs/boxes.pdf", height = 6, width = 12)
