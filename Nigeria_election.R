############### PAST PRESIDENTIAL ELECTIONS IN NIGERIA VISUALIZATION ###############

### loading libraries
library(tidyverse)
library(tidylog)
library(ggimage)
library(sysfonts)
library(showtext)

### loading data set
dfn <- read_csv("")

### Adding fonts
font_add_google("Anton", family = "Anton")
font_add_google("Acme", family = "Acme")
font_add_google("Secular One", family = "Secular")
showtext_auto()

### Creating title, subtitle and caption
title <- "Past Presidential Election Results in Nigeria"
subtitle <- "Top candidates ranked by percentage of votes received in presidential elections held between 1979 and 2019"
caption <- "Source: African Elections Database | Graphic: @Timmy1Tesla"

### Plotting
election_viz <-
ggplot(data = dfn) +
  ## adding candidates' images
  geom_image(mapping = aes(y = rank, x = 0.6, image = image), size = 0.23, 
             asp = 1.2, by = "height") +
  ## adding candidates' names
  geom_text(mapping = aes(y = rank, x = 2.0, label = candidate), size = 3.37, colour = "#FFFFFF", 
            nudge_y = 0.24, nudge_x = 0.10, family = "Acme") +
  ## adding number of votes
  geom_text(mapping = aes(y = rank + 0.2, x = 2.0, label = vote), colour = "#DADBDD",size = 2.8, 
            nudge_y = 0.175) +
  ## adding percentage
  geom_text(mapping = aes(y = rank + 0.35, x = 2.0, label = paste0(percentage, "%")), 
            colour = "#DADBDD", size = 2.3, nudge_y = 0.12) +
  ## adding party name
  geom_text(mapping = aes(y = rank + 0.5, x = 2.0, label = party), colour = "#DADBDD", 
            size = 2.0, nudge_y = 0.10) +
  ## changing scale limits
  scale_y_reverse(limits = c(3.9,0.25), expand = c(0,0))+
  scale_x_continuous(limits = c(0.5,5)) +
  ## adding title, subtitle and caption
  labs(title = title,
       subtitle = subtitle,
       caption = caption) +
  ## grouping by year
  facet_wrap(~year) + 
  ## changing to minimal theme
  theme_minimal()+
  ## removing axis title
  theme(axis.title = element_blank(),
  ## removing axis text
        axis.text = element_blank(),
  ## changing the colour, size, adjustments and font of facets' header
        strip.text.x = element_text(colour = "#E2DFD2", size = 9.5, hjust = 0.3, 
                                    family = "Anton"),
  ## changing plot background to black
        plot.background = element_rect(fill = "black", colour = "black"),
  ## changing the colour, size, adjustment and font of the plot title
        plot.title = element_text(colour = "white", size = 17, hjust = 0.5,
                                  family = "Secular"),
  ## changing the colour, size, adjustment, margin and size of the subtitle
        plot.subtitle = element_text(colour = "#DADBDD", size = 10.5, hjust = 0.5, 
                                     margin = margin(b = 21), family = "Secular"),
  ## changing the adjustment, size, colour and font of the caption
        plot.caption = element_text(hjust = 1.012, size = 7.0, colour = "#DADBDD", family = "Secular"),
  ## removing panel grid
        panel.grid = element_blank(),
  ## removing plot legend
        legend.position = "none")

### saving the plot
ggsave("election_viz.png", width = 9, height = 7.0)