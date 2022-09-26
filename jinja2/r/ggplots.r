options(timeout = 3000)

install.packages("reticulate")
#getOption('timeout')
library(reticulate)
py_install("pandas")
pd <- import("pandas")

pickle_data <- pd$read_csv("/home/master/pj/gitprojects/thesis/latex/tehran-thesis-master/jinja2/data/10-DFs-pilot/finalDFCSV.csv",low_memory=FALSE)
labels <- data_mosaic %>%
  filter(MAJOR.CATEGORY == "PERSONAL CARE") %>%
  mutate(y = ymax - 0.01, yRange = (ymax - ymin)* 100) %>%
  select(STATE.CODE, xmax, y, yRange) %>%
  ungroup()

value_labels <- data_mosaic %>%
  select(STATE.CODE, MAJOR.CATEGORY, xmin, xmax, ymax, share) %>%
  mutate(
    x = ifelse(MAJOR.CATEGORY == "PERSONAL CARE", xmax, xmin),
    y = ymax - 0.005,
    label = paste0(round(share * 100), "%"),
    hjust = ifelse(MAJOR.CATEGORY == "PERSONAL CARE", 1.05, -0.25)
  )

ggplot(data_mosaic2) +
  geom_rect(aes(ymin = ymin, ymax = ymax, xmin = xmin, xmax = xmax,
                fill = MAJOR.CATEGORY), colour = "white", size = 0.2)+
  scale_fill_manual("legend", values = c("GENERAL MERCHANDISE" = "grey30",
                                         "HEALTH CARE" = "royalblue1",
                                         "HOME HEALTH CARE" = "gold","PERSONAL CARE"="tomato"))+
  theme_light()+
  geom_text(
    data = labels,
    aes(x = 1.05, y = y, label = as.character(STATE.CODE)),
    hjust = 0, vjust = 1, colour = "blue",size=3
  ) +
  geom_text(
    data = value_labels,
    aes(x = x, y = y, label = label, hjust = hjust),
    vjust = 1, size = 3, alpha = 1, colour = "white"
  ) +
  scale_y_continuous( breaks = labels$y, limits = c(0, 1),
                      labels = scales::percent)+
  theme_minimal()+
  theme(axis.title=element_blank(),
        plot.title = element_text(hjust = 0.5))+
  ggtitle("Sales by Major Category and State")