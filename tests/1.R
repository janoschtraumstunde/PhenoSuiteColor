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
# Unit tests for:
#                 SI.PhenoSuite.Color.R
#                 SI.PhenoSuite.Color.Tests
# 
# Date: 5th August 2016
# Author: jw
# Version: 0.01



test.examples <- function()
{
  
  colours <- c("#050505", "#A0A0A0", "#E0E0E0")
  n      <- length(colours)
  data   <- c(-1, 4.34342342344532, 0, 5,  6)
  min    <- min(data)
  max    <- max(data)
  
  # Uniform normalisation tests
  checkException(UniformNormData(data, min, max), 'Minimum can not be larger then maximum.')
  
  checkEquals(1, UniformNormData(data, max, min)[length(data)])
  checkEquals(0, UniformNormData(data, max, min)[1])

  checkEqualsNumeric(0.43, round(UniformNormData(2, max, min),2))
 
  checkTrue(UniformNormData(data, max, min)[1] < UniformNormData(data, max, min)[(length(data)-1)],'Vector is sorted.')
  
  # Median center normalisation test
  checkEqualsNumeric(0.5, round(median(MedianCenterNormData(data)),2))

  # Median center normalisation colour bin test
  checkEquals("#050505",MedianCenterColourBinData(min(data), median(data), max(data), min(data), n, colours))
  checkEquals("#A0A0A0",MedianCenterColourBinData(median(data), median(data), max(data), min(data), n, colours))
  checkEquals("#A0A0A0",MedianCenterColourBinData(max(data), median(data), max(data), min(data), n, colours))
  
  data   <- c(-1, 0, 1)
  
  checkEquals("#050505",MedianCenterColourBinData(min(data), median(data), max(data), min(data), n, colours))
  checkEquals("#A0A0A0",MedianCenterColourBinData(median(data), median(data), max(data), min(data), n, colours))
  checkEquals("#E0E0E0",MedianCenterColourBinData(max(data), median(data), max(data), min(data), n, colours))
  
}

test.deactivation <- function()
{
  DEACTIVATED('Deactivating this test function')
}