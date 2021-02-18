# Getting a DEM with R package `elevatr`

# Load packages ----
library(elevatr)
library(sp)
library(raster)

# See help ----
?get_elev_raster

# Load example data ----
data(lake)
# Plot
plot(lake)

# Get medium res data ----
elev_med <- get_elev_raster(lake, z = 9)
# Plot
plot(elev_med)
plot(lake, add = TRUE)

# Get high res data ----
elev_hi <- get_elev_raster(lake, z = 14)
# Plot
plot(elev_hi)
plot(lake, add = TRUE)
