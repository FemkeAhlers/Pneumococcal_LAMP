# Figure 3 : Limit of detection of the LAMP assay. Three independent serial dilutions of pneumococcal DNA were used to determine the limit of detection of the new LAMP assay SP2020_3+. The horizontal dashed line indicates the fluorescence threshold.

# Load R libraries

library(ggplot2)
library(dplyr)
library(tibble)
library(readr)


# Import dataframes

LAMP_LOD = read.csv("03_02112022_Dilution_LAMP.csv")


# Create Figure 3

LAMP_LOD <- LAMP_LOD %>% 
  mutate(Sec = Cycle.Number * 20)

LAMP_LOD <- LAMP_LOD %>% 
  mutate(Min = Cycle.Number * 20 / 60)

#Changing the order of the legend
LAMP_LOD$DNA.quantity <- factor(LAMP_LOD$DNA.quantity,
                              levels = c("261223", "26122", "2612", "261", "131", "65", "33", "16", "8", "4", "2", "0"))

ggplot(data = LAMP_LOD, aes(x=Min, y=SYBR, colour= DNA.quantity)) +
    geom_line() +
    xlab("Time (min)") +
    ylab("Fluorescence from SYBR green") +
  geom_hline(yintercept =15000000, linetype='dashed') +
    theme_bw() +
    guides(colour = guide_legend(override.aes = list(size=3))) +
    xlim(0,60) +
    facet_wrap(~Dilution, nrow=1, ncol=3) +
  theme(strip.text.x = element_text(size = 12), axis.text=element_text(size=10),
        axis.title=element_text(size=12,face="bold"), legend.text=element_text(size=12), legend.title=element_text(size=12, face="bold")) +
    theme(strip.background = element_blank(), strip.text.x = element_blank()) 

