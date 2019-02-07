# Load libraries
library(tidyverse)

# Create dataframe
pct_x <- c(99, 92.1, 81.6, 67.27, 50)
pct_y <- c(99, 92.1, 81.6, 67.27, 50)
year_label <- c("1860", "1870", "1880", "1890", "1900")
pct_label <- c("99%", "92.1%", "81.6%", "67.27%", "(50%?)")
df <- tibble(pct_x, pct_y, pct_label, year_label)

# Plot
ggplot(df) +
  
    # Black vertical bars
    geom_bar(aes(x = -pct_x, y = pct_y), stat = "identity", width = 1.89, fill = "black") +
    
    # Black horiztonal segments (the "outline")
    geom_segment(aes(x = -99, y = 99, xend = -100, yend = 99), 
                 stat = "identity", size = 2.2, colour = "black", lineend = "square") +
    geom_segment(aes(x = -92.1, y = 92.1, xend = -100, yend = 92.1), 
                 stat = "identity", size = 2.2, colour = "black", lineend = "square") +
    geom_segment(aes(x = -81.6, y = 81.6, xend = -100, yend = 81.6), 
                 stat = "identity", size = 2.2, colour = "black", lineend = "square") +
    geom_segment(aes(x = -67.27, y = 67.27, xend = -100, yend = 67.27), 
                 stat = "identity", size = 2.2, colour = "black", lineend = "square") +
    geom_segment(aes(x = -50, y = 50, xend = -100, yend = 50), 
                 stat = "identity", size = 2.2, colour = "black", lineend = "square") +
  
    # White horizontal segments (the "fill")
    geom_segment(aes(x = -99, y = 99, xend = -100, yend = 99), 
                 stat = "identity", size = 2.0, colour = "white", lineend = "square") +
    geom_segment(aes(x = -92.1, y = 92.1, xend = -100, yend = 92.1), 
                 stat = "identity", size = 2.0, colour = "white", lineend = "square") +
    geom_segment(aes(x = -81.6, y = 81.6, xend = -100, yend = 81.6), 
                 stat = "identity", size = 2.0, colour = "white", lineend = "square") +
    geom_segment(aes(x = -67.27, y = 67.27, xend = -100, yend = 67.27), 
                 stat = "identity", size = 2.0, colour = "white", lineend = "square") +
    geom_segment(aes(x = -50, y = 50, xend = -100, yend = 50), 
                 stat = "identity", size = 2.0, colour = "white", lineend = "square") +
  
  # x axis labels
  scale_x_continuous(breaks = c(-99, -92.1, -81.6, -67.27, -50), 
                     limits = c(-103, -45), 
                     label = pct_label,
                     name = str_wrap("PERCENT OF ILLITERACY.", 10),
                     expand=c(0,0)) +
  
  # y axis labels
  scale_y_continuous(breaks = c(50, 67.27, 81.6, 92.1, 99), 
                     limits = c(0, 103),
                     label = c("(1900?)", "1890", "1880", "1870", "1860"),
                     expand=c(0,0)) +

  # theme
  theme(text = element_text(family = "Rajdhani", size = 8, colour = "black"),
        plot.margin = margin(20, 40, 20, 40),
        panel.background = element_blank(),
        axis.title.y = element_blank(),
        axis.title.x = element_text(hjust = -0.2, vjust = 6.4, size = 5),
        axis.ticks = element_blank(),
        panel.grid = element_blank(),
        plot.title = element_text(hjust = 0.5, face = "bold", margin = margin(0,0,10,0))) +
  
  # title
  labs(title = "ILLITERACY.") +

  # save as png
  ggsave("illiteracy.png", height = 12, width = 9, unit = "cm")