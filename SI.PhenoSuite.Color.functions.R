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
# Normalisation Functions for SI.PhenoSuite.Color.R
#                             SI.PhenoSuite.Color.Tests
# 
# Date: 5th August 2016
# Author: jw
# Version: 0.01

UniformNormData <- function(p, max, min) {
  # Normalises data betwee 0 and 1
  #
  # Args:
  #   p: data point
  #   max: maximum from array data is drawn
  #   min: minimum from array data is drawn
  #
  # Returns:
  #  A normalised data vector or point
  
  if (min >= max){ 
    stop('Minimum can not be larger then maximum.')
  }

  x <- (p-min) / (max - min)
  min(x)
  max(x)
  return(x)
}

MedianCenterNormData <- function(p) {
  # Normalises data betwee 0 and 1
  # with median at =~0.5
  #
  # Args:
  #   p: data array
  #
  # Returns:
  #  A normalised array.
  median <- median(p)
  median
  
  max    <- max(p)
  min    <- min(p)
  # identify larger range left/right of median
  r.max  <- abs(max - median)
  r.max
  
  r.min  <- abs(median - min)
  r.min
  
  # set new min if upper range is greater
  if ((median - r.max) < min) {
    min <- median - r.max
    
  }
  # set new max if lower range is greater
  if ((median + r.min) > max) {
    max <- median + r.min
    
  }
  max
  # normalise between 0 and 1
  x <- (p - min) / (max - min)
  x
  
  return(x)
  
}

UniformColourBinData <- function(p, max, min, n, col) {
  # Normalises data betwee 0 and 1
  #
  # Args:
  #   p: data point
  #   max: maximum from array data is drawn
  #   min: minimum from array data is drawn
  #   n: number of bins to use from a color array
  #   col: #RGB colour array
  #
  # Returns:
  #  The corresponding #RGB color from a color array
  #  with n bins.
  x   <- (p - min) / (max - min)
  bin <- floor(x / (1 / (n - 1)))
  
  # R index adjustment 1..x
  return(col[bin + 1])
}

MedianCenterColourBinData <- function(p, median, max, min, n, col) {
  # Normalises data betwee 0 and 1
  # with median at =~0.5
  #
  # Args:
  #   p: data point
  #   median: median from array to center normalisation
  #   max: maximum from array data is drawn
  #   min: minimum from array data is drawn
  #   n: number of bins to use from a color array
  #   col: #RGB colour array
  #
  # Returns:
  #  The corresponding #RGB color from a color array
  #  with n bins.
  r.max <- abs(max - median); r.max;
  r.min <- abs(median - min); r.min;
  
  if ((median - r.max ) < min) {
    min <- median - r.max;
  }
  min
  
  if ((median + r.min ) > max) {
    max <- median + r.min;
  }   
  max 
  
  x <- (p - min)/(max - min); x
  
  bin <- floor(x / (1 / (n-1))); bin
  
  return(col[bin + 1]) # + 1 array adjustment 1..x 
  
}

DrawImageMap <- function(p, n, r, c, col) {
  # Visualize plate data
  #
  # Args:
  #   p: Plate data
  #   n: Number of bins to use from a color array
  #   r: Number of rows
  #   c: Number of columns
  #   col: #RGB colour array
  
  # adjustment for character placement on heatmap
  r.adj <- 1 / r
  c.adj <- 1 / c
  
  image(p,
        axes = F,
        zlim = c(0,1),
        col  = colours)
  mtext(
    text = rownames(p),
    side = 1,
    line = 0.3,
    at   = seq(0, 1, (1 + r.adj) / r),
    las  = 1,
    cex  = 0.5)
  mtext(
    text = colnames(p),
    side = 2,
    line = 0.3,
    at   = seq(0, 1, (1 + c.adj) / c),
    las  = 2,
    cex  = 0.5)
  
}
