library(tidyverse)
library(ggplot2)
library(ggtext) # for using markdown in plot text
library(showtext) # for custom fonts

cnh_theme <- function () { 
  library(ggtext) # for using markdown in plot text
  library(showtext) # for custom fonts
  font_add_google(name = "Roboto", family = "roboto")
  showtext_auto() #primes the font
 
  theme_linedraw(base_size=14, base_family="roboto") %+replace% 
    theme(
      panel.background  = element_blank(),
      plot.background = element_rect(fill = "transparent", color = NA), 
      axis.ticks = element_blank(),
      panel.grid.major = element_blank(),
      panel.grid.minor = element_blank(),
      plot.title.position = "plot",
      plot.title = element_markdown(size = 20, hjust = 0, vjust = 0.5, 
                                    margin = margin(b = 0.2, unit = "cm")),
      plot.subtitle = element_text(size = 14, hjust = 0, vjust = 0.5, 
                                   margin = margin(b = 0.4, unit = "cm")),
      plot.caption = element_text(size = 10, hjust = 1, face = "italic", 
                                  margin = margin(t = 0.1, unit = "cm")),
      axis.title = element_text(size = 16, face = "bold"),
      axis.text = element_text(size = 14),
      legend.position = "none",
      
    )
}

# cnh_theme example

ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) +
  geom_boxplot() +
  facet_grid( ~ dose) +
  labs(x = "Dose (mg/day)",
       y = "Tooth length (mm)",
       title = "<span style = 'color:#F8766D;'>Orange Juice</span> and <span style = 'color:#00BFC4;'>Vitamin C</span> Effect on Tooth Growth",
       subtitle = "Tooth growth generally increases with doses, as measured in 60 Guinea Pigs",
       caption = "Produced using cnh_theme",
       fill = "Supplement") +
  cnh_theme()


# Default example

ggplot(ToothGrowth, aes(x = supp, y = len, fill = supp)) +
  geom_boxplot() +
  facet_grid( ~ dose) +
  labs(x = "Dose (mg/day)",
       y = "Tooth length (mm)",
       title = "Orange Juice and Vitamin C Effect on Tooth Growth",
       subtitle = "Tooth growth generally increases with doses, as measured in 60 Guinea Pigs",
       caption = "Produced using default theme",
       fill = "Supplement")
