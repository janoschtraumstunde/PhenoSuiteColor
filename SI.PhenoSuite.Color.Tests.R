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
# It test correct colouring for: 
#     1. Uniform normalisation 0 .. 1 
#     2. Median centered normalisation 
#
# TODO: 
#     - Write function to median scale and stretch data to 0 and 1
#     - Write one sided visualisation for median upper/lower range  
#     - Write function for colour range min/max swap
#
# Date: 5th August 2016
# Author: jw
# Version: 0.01#
# colour schemes for PhenoSuite
#
# - decide on heatmap colour schemes and 'extreme' colours 
# for overlay distinction
# - show selection in Pie charts
#
# - test binning code using an artifical ggplot2 plate heatmap

# set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load normalisation functions
source("SI.PhenoSuite.Color.functions.R")

# load Plasma colour scheme
library('viridis') 
# load Brewer colour schemes
library('RColorBrewer')
# make pretty graphics
library('ggplot2')
# modify colors to approve for colour blindness
library('dichromat') 


n <- 20  # number of colour bins
r <- 16  # number of plate row 
c <- 24  # number of plate column

# generate random 384-well plate data
p              <- rnorm(r * c, 1, 0.1)
dim(p)         <- c(r,c)  # turn vector to matrix
dim(p)  # check plate size
# draw subset of the data from different distributions
p[7:10, 14:16] <- rnorm(12, 1.4, sd = .4)  
p[2:7, 4:9]    <- rnorm(36, .5, sd = .7)
# set row and column names
rownames(p) <- LETTERS[seq( from = 1, to = r )]
colnames(p) <- seq(1, c, 1)
head(p)[,1:5]  # check first 5 rows and columns

# apply normalisatons
pq <- UniformNormData(p, max(p), min(p))
pr <- MedianCenterNormData(pq)

# show data distributions
pdf("plots/Data_Distributions.pdf", width = 8, height = 6.5)
par(mfrow    = c(3, 1),  # set row and cols in plot
    mar      = c(3, 3, 3, 1),  # set margins bottom, left, top, right
    col.main = "white",
    col.lab  = "white",
    col.axis = "white",
    fg       = "white",
    bg       = "black")

hist(p,  breaks = 50,col = "Grey", main = "Uniform normalisation")
hist(pq, breaks = 50,col = "Gold", xlim = c(0,1), main = "Uniform normalisation")
hist(pr, breaks = 50,col = "Navy", xlim = c(0,1), main = "Median center normalisation")
dev.off()

# uniform data between 0 and 1
pdf("plots/PhenoSuite_Heatmap_Example_Uniform.pdf", width = 15/2.54, height = 14/2.54)
par(mfrow   = c(2, 2),
    mar     = c(1.5, 2, 1, 1),
    fg      = "white",
    bg      = "black")
colours <- plasma(n, alpha = 1, begin = 0, end = 1)
DrawImageMap(pq, n, r, c, colours)
colours <- gray.colors(n, alpha = 1, start = 0.3, end = 0.9, gamma = 2.2)
DrawImageMap(pq, n, r, c, colours)
colours <- colorRampPalette(brewer.pal(9,"PuRd"))(n)
DrawImageMap(pq, n, r, c, colours)
colours <- colorRampPalette(brewer.pal(11,"PuOr"))(n)
DrawImageMap(pq, n, r, c, colours)
dev.off()

# center data around median
pdf("plots/PhenoSuite_Heatmap_Example_Median_Centered.pdf", width = 15/2.54, height = 14/2.54)
par(mfrow   = c(2, 2),
    mar     = c(1.5, 2, 1, 1),
    fg      = "white",
    bg      = "black")
colours <- plasma(n, alpha = 1, begin = 0, end = 1)
DrawImageMap(pr, n, r, c, colours)
colours <- gray.colors(n, alpha = 1, start = 0.3, end = 0.9, gamma = 2.2)
DrawImageMap(pr, n, r, c, colours)
colours <- colorRampPalette(brewer.pal(9,"PuRd"))(n)
DrawImageMap(pr, n, r, c, colours)
colours <- colorRampPalette(brewer.pal(11,"PuOr"))(n)
DrawImageMap(pr, n, r, c, colours)
dev.off()

