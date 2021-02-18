# Direct download from USGS

# Interested in the 1/3 arc-second dataset (available for all of lower 48)

# Load packages----
library(raster)

# Construct URL ----

# Argument `coords` should be vector with x, y coord

construct_url <- function(coords) {
  # USGS stores tiles in 1 x 1 degree increments
  # Name of the tile is the max N and max W (= min(long))

  # Get tile numbers
  x_num <- unique(floor(coords[[1]]))
  y_num <- unique(ceiling(coords[[2]]))

  # Get tile directions
  # Directions should typically be N/W, but check
  x_dir <- ifelse(x_num < 0, "w", "e")
  y_dir <- ifelse(y_num > 0, "n", "s")

  # Make tile names
  x_tile <- paste0(x_dir, abs(x_num))
  y_tile <- paste0(y_dir, abs(y_num))

  # Full tile string
  tile <- paste0(y_tile, x_tile)

  # Now create URL
  baseurl <- "https://prd-tnm.s3.amazonaws.com/StagedProducts/Elevation/13/TIFF/"
  tile_url <- paste0(baseurl, tile, "/USGS_13_", tile, ".tif" )

  # Return
  return(tile_url)
}

# Example (near Bear Lake)
coords1 <- c(-111.419, 41.94)

url1 <- construct_url(coords1)

# Now download
f <- tempfile(fileext = ".tif")
download.file(url = url1, destfile = f, method = "curl")

plot(raster(f))
