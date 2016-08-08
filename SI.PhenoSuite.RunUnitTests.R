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

# set source file directory as default
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# update your current packages
update.packages()

# install pacman
if (!require("pacman")) install.packages("pacman")
pacman::p_exists(R)

# install required packages with pacman
pacman::p_load(RUnit, testthat, viridis, dichromat, ggplot2)

# Run R unit tests
library('RUnit')

source('SI.PhenoSuite.Color.functions.R')

test.pheno.suite.colours <- defineTestSuite("PhenoSuiteColours",
                              dirs           = file.path("tests"),
                              testFileRegexp = '^\\d+\\.R')

test.result <- runTestSuite(test.pheno.suite.colours)

printTextProtocol(test.result)



