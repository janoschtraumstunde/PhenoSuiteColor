# Copyright (C) 2016 Singer Instruments
# This file is part of SI PhenoSuite Colorscheme Definitions.
#
# SI PhenoSuite Colorscheme Definitions is free software: you 
# can redistribute it and/or modify it under the terms of the 
# GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License.
#
# SI PhenoSuite Colorscheme Definition is distributed in the 
# hope that it will be useful, but WITHOUT ANY WARRANTY; without 
# even the implied warranty of MERCHANTABILITY or FITNESS FOR 
# A PARTICULAR PURPOSE.
# See the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
#
# Script creates 9 different colour schemes that are used in 
# PhenoSuite to colour heatmaps.
# Files:
# SI.PhenoSuite.Color.R:
#     This file creates all colour palettes
# SI.PhenoSuite.Color.functions.R
#     This file contains normalisation functions
# SI.PhenoSuite.Color.Tests.R
#     File tests heatmaps for correct colouring: 
#     1. Uniform normalisation 0 .. 1 
#     2. Median centered normalisation 
#
# Date: 5th August 2016
# Author: jw
# Version: 0.01#


# load Plasma colour scheme
library('viridis') 
# load Brewer colour schemes
library('RColorBrewer')
# make pretty graphics
library('ggplot2')
# modify colors to approve for colour blindness
library('dichromat') 

# in cm's
pdf("PhenoSuite_Heatmap_Colours.pdf", width=12/2.54, height=10/2.54)

# show 3x3 plots each with 1,1,1,1 margins (left,top,right,bottom)
par(mfrow    = c(3, 3),  # segment plot into 3 x 3 tiles (row/cols)
    mar      = c(1, 1, 1, 1),  # set margins b, l, t, r
    bg       = "black",  # set background colour
    col.main = "white")  # set main title colour

# Sequential colour range:

# Colour palette: Plasma
colours <- plasma(n, alpha = 1, begin = 0, end = 1)
colours
pie(rep(1, n), radius = 1, labels = "", border = NA, col = colours, main='Plasma')
write.table(colours, file = "colours_Plasma.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",")

# Colour palette: Monochrome
colours <- gray.colors(n, alpha = 1, start = 0.3, end = 0.9, gamma = 2.2)
colours
pie(rep(1, n), radius = 1, labels = "", border = NA, col = colours, main = 'Monochrome')
write.table(colours, file = "colours_Monochrome.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep=",")


# Colour palette: Purple to Red
colours <- colorRampPalette(brewer.pal(9,"PuRd"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA, main = 'Purple-Red')
write.table(colours, file = "colours_PurpleRed.csv", row.names=FALSE, col.names=FALSE, quote = FALSE, sep = ",")

# Diverging colour range:
  
# BrBG
colours <- colorRampPalette(brewer.pal(11, "BrBG"))(n)
colours
pie(rep(1, n),col = colours,radius = 1, labels = "", border = NA, main='Brown-Turquoise')
write.table(colours,file = "colours_BrownTurquoise.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep  =",")

# PiYG
colours <- colorRampPalette(brewer.pal(11, "PiYG"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA,main='Pink-Green')
write.table(colours, file = "colours_PinkGreen.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep=",")

# PRGn
colours <- colorRampPalette(brewer.pal(11, "PRGn"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA, main ='Purple-Green')
write.table(colours, file = "colours_PurpleGreen.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",")

# PuOr
colours <- colorRampPalette(brewer.pal(11, "PuOr"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA, main = 'Purple-Orange')
write.table(colours, file = "colours_PurpleOrange.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",")

# RdBu
colours <- colorRampPalette(brewer.pal(11, "RdBu"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA, main ='Red-Blue')
write.table(colours, file = "colours_RedBlue.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",")

# RdYlBu
colours <- colorRampPalette(brewer.pal(11, "RdYlBu"))(n)
colours
pie(rep(1, n), col = colours, radius = 1, labels = "", border = NA, main = 'Red-Yellow-Blue')
write.table(colours, file = "colours_RedYellowBlue.csv", row.names = FALSE, col.names = FALSE, quote = FALSE, sep = ",")

dev.off()