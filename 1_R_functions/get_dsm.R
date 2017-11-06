#' Get DSM
#'
#' @author Fabian Fassnacht
#' @param path path of output folder
#' @param path_to_txt input table containing the point cloud created with createLiDAR-function (a text file)
#' @param out_path path to output folder
#' @param out_name name-base of output files (should be character)
#' @param f_size size (in map units) of the filter to reduce number of LiDAR points
#' @param qu height quantile below which LiDAR point clouds are removed (should be between 0 and 1)
#' @export
#'
#'


#require(akima)
#require(rgl)
#require(rgdal)
#require(raster)

get_dsm <- function(path_to_txt=".", out_path=".", out_name=".", f_size, qu){

  # function needed to rotate matrix
  rotate <- function(x) t(apply(x, 2, rev))

  # get old path
  old_path <- getwd()

  # read LiDAR point cloud
  pcl <- read.table(path_to_txt, header=T, fill=T, sep="\t")

  #head(pcl)

  #########################################################################
  ## filter point cloud for points above 90% quantile ("first returns")
  #########################################################################

  max_x <- max(pcl[,1])
  min_x <- min(pcl[,1])

  max_y <- max(pcl[,2])
  min_y <- min(pcl[,2])

  ## set raster width to filter points
  filter_size=f_size

  pt_x <- seq(min_x, max_x, filter_size)
  pt_y <- seq(min_y, max_y, filter_size)

  ## filter each raster cell for the points above the 90th percentile

  total <- length(pt_x)-1

  new_pcl <- list()

  i3 = 1
  for (i in 1:(length(pt_x)-1)) {

    for (i2 in 1:(length(pt_y)-1)) {

      pcl2 <- pcl[pcl[,1] > pt_x[i] & pcl[,1] < pt_x[(i+1)],]
      pcl3 <- pcl2[pcl2[,2] > pt_y[i2] & pcl2[,2] < pt_y[(i2+1)],]

      pcl5 <- pcl2[1,]
      pcl5[,2] <- pt_y[i2+0.5]
      pcl5[,3] <- 0
      pcl5[,4:6] <- c(999,999,999)

      #pcl4 <- pcl3[pcl3[,3] == max(pcl3[,3], na.rm = T),]
      pcl4 <- pcl3[pcl3[,3] > quantile(pcl3[,3], c(qu)),]
      #pcl4 <- pcl3[pcl3[,3] > quantile(pcl3[,3], c(qu)) & pcl3[,3] < quantile(pcl3[,3], c(0.99)),]

      if (length(pcl4[[1]]) == 0) {

      new_pcl[[i3]] <- pcl5 } else {

        new_pcl[[i3]] <- pcl4
      }


      i3 <- i3+1

    }
    print(paste(i, "out of ", total))
  }

  new_pcl1 <- do.call(rbind, new_pcl)
  #head(new_pcl1)
  #plot(new_pcl1[,1], new_pcl1[,2])

  # set NA values to 0
  new_pcl1[,is.na(new_pcl1[,3])] <- 0
  lgth1 <- length(new_pcl1[,1])
  ##########################################################################
  # remove all rows where there are NA values in any of the other columns
  # !!!!!! CAREFUL !!!!!!!!!! Could be a problem in other cases !!!!!!!!!!!
  ##########################################################################
  new_pcl1 <- new_pcl1[complete.cases(new_pcl1),]
  save(new_pcl1, file=paste(out_name, "_red_pcl.RData", sep=""))
  lgth2 <- length(new_pcl1[,1])

  print(paste("removed ", (lgth1-lgth2), " our of", lgth1, " rows due to contained NAs"))


  #summary(new_pcl1)

  ##############################################################################
  ### get dsm with AKIMA interpolation of filtered points
  ##############################################################################

  s <- akima::interp(new_pcl1[,1], new_pcl1[,2], new_pcl1[,3], xo=seq(min(new_pcl1[,1]), max(new_pcl1[,1]), length = length(pt_x)),
         yo=seq(min(new_pcl1[,2]), max(new_pcl1[,2]), length = length(pt_y)),
         linear = TRUE, extrap=F, duplicate = "strip", dupfun = NULL,
         nx = length(pt_x), ny = length(pt_y),
         jitter = 10^-12, jitter.iter = 6, jitter.random = FALSE)




  dsm_temp <- raster::raster(ncols = length(pt_x), nrows = length(pt_y),
                     ext = raster::extent(min_x, max_x, min_y, max_y))

  raster::values(dsm_temp) <- rotate(rotate(rotate(s$z)))

  dsm_ak_med <- raster::focal(dsm_temp[[1]], w=matrix(1,nrow=3,ncol=3), fun=median)


  setwd(out_path)

  raster::writeRaster(dsm_temp, filename=paste(out_name, "_dsm_akima.tif", sep=""), format="GTiff", overwrite=T)


  ##############################################################################
  ### get dsm with rasterizing points using mean values of filtered points
  ##############################################################################


#   z1 <- as.data.frame(new_pcl1[,1:3])
#   colnames(z1) <- c("x", "y", "z")
#
#   sp::coordinates(z1)=~x+y
#
#   pts <- sp::SpatialPointsDataFrame(z1, data.frame(id=1:length(z1)))
#
#   pts$height <- new_pcl1[,3]
#
#   dsm_temp1 <- raster::raster(ncols = length(pt_x), nrows = length(pt_y),
#                      ext = raster::extent(min_x, max_x, min_y, max_y))
#
#   dsm_r <- raster::rasterize(pts, field="height" , dsm_temp1, fun=mean, background=0)
#
#   #raster::plot(dsm_r)
#
#   dsm_r_m <- raster::focal(dsm_r[[1]], w=matrix(1,nrow=3,ncol=3), fun=median)
#   #raster::plot(dsm_r_m)
#
#   raster::writeRaster(dsm_r_m, filename=paste(out_name,"dsm_max_med3.tif", sep=""), format="GTiff", overwrite=T)
#
   setwd(old_path)
 }

##############################################################################
### compare the two created nDSM s with nDSM from LiDAR software TreesVis
##############################################################################
#
# nDSM <- raster::stack("ndsm_cor.tif")
#
# par(mfrow=c(1,3))
#
# brk <- seq(0,30,1)
#
# par(mfrow=c(1,3))
#
# plot(dsm_r_m, col = terrain.colors(31), breaks=brk)
# plot(dsm_ak_med, col = terrain.colors(31), breaks=brk)
# plot(nDSM, col = terrain.colors(31), breaks=brk)
