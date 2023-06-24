# Test r docker studio

# clean data
library(tidyr)
library(dplyr)
# More efficient
library(data.table)
# for ICC
library(psych)
# for DDM
library(hausekeep) # ez ddm
library(RWiener) # RW ddm
# plot
library(ggplot2)
library(see)
# Parallel Computing
library(foreach)
library(parallel)
library(iterators)
library(doParallel)

# local packages: yukiSH & yukiBP
# You can install them from ".tar.gz" or GitHub

# install.packages("./PACKAGES/yukiSH_0.0.2.tar.gz") # nolint
# devtools::install_github("yuki-961004/yukiSH") # nolint
library(yukiSH)

# install.packages("./PACKAGES/yukiBP_0.1.3.tar.gz") # nolint
# devtools::install_github("yuki-961004/yukiBP") # nolint
library(yukiBP)

