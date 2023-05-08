Code chunk:
================

## Why this code:
We spend so much time working to source, clean, reshape, merge, analyze, and summarize our data. Nothing is more frustrating than producing remarkable results but having an audience be confused or underwhelmed by the visualization of the data. One way to help fix that is to have a consistent visual style so that your audience can more easily interpret results while also developing (and then maintaining) your 'brand' as an anaylst. 

This function will allow my data visualizations to achieve both of those goals in a repeatable manner **(note that this function will continue to evolve as I improve my skills as a data analyst and coder!)**.

This code:
- Minimizes chartjunk
- Properly color-codes and labeles data
- Makes room for a headline in the chart that helps explain the data for those just seeing it for the first time
- Adds visual branding elements like signature font

## The code:

``` r
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
```

## Example output

Here’s what happens when you run that code on the tidyverse `ToothGrowth` data along with an example of how easy it is to make this tweak (note the + `cnh_theme()` code)

``` r
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
      
    )
}
```
![Alt text](https://github.com/curtisnedhansen/ExampleCode/blob/main/cnh_theme.png)

Compare that to the default style (notice increased chartjunk, increased difficulty of locating/reading headline, etc)
![Alt text](https://github.com/curtisnedhansen/ExampleCode/blob/main/default.png)
