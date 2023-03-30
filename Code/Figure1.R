# Figure 1D: Six different loop-mediated isothermal amplification (LAMP) primer combinations were tested. (D) Diagrams shows the 6 different LAMP primer combinations (in triplicate) and their water controls. The horizontal black dashed line indicates a threshold set to 15 million RFU. 

# Load R libraries

library(ggplot2)
library(dplyr)
library(tibble)
library(readr)


# Import dataset

LAMP_6_assays = read.csv("01LAMP_multiple_assays.csv")


# Create Figure 1D

LAMP_6_assays <- LAMP_6_assays %>% 
  mutate(Sec = CycleNumber * 20)

LAMP_6_assays <- LAMP_6_assays %>% 
  mutate(Min = CycleNumber * 20 / 60)

LAMP_6_assays <- LAMP_6_assays %>% 
  add_column(Sample = if_else(.$Run == "Template", "Template", "Non Template Control"))

ggplot(data = LAMP_6_assays, aes(x=Min, y=SYBR, colour=Assay, group=interaction(Assay, Control))) +
    geom_line(aes(linetype = Sample), size=1)+
    scale_linetype_manual(values=c("dotted", "solid")) +
    scale_color_manual(values = c("#F8766D", "#C49A00", "#12de23", "#15fbff","#193bfa" ,"#FB61D7")) +
    xlab("Time (min)") +
    ylab("Raw fluorescence from SYBR green") +
    geom_hline(yintercept =15000000, linetype='dashed') +
    xlim(0, 60) +
    theme_bw() +
    guides(colour = guide_legend(override.aes = list(size=3))) +
    facet_wrap(~Assay, nrow=2, ncol=3) +
    theme(strip.text.x = element_text(size = 12), axis.text=element_text(size=10),
        axis.title=element_text(size=12,face="bold"), legend.text=element_text(size=12), legend.title=element_text(size=12, face="bold")) +
    theme(strip.background = element_blank(), strip.text.x = element_blank())

