#' Get Species and Shadows
#'
#' @author Fabian Fassnacht
#' @param path_to_txt input table containing the point cloud created with createLiDAR-function (a text file)
#' @param red_pcl_rdata Rdata file containing the reduced point cloud created with get_dsm function (a RData file)
#' @param out_path path to output folder
#' @param out_name name-base of output files (should be character)
#' @param f_size pixel size of the output raster containing the species information
#' @export
#'
#'

#setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/50-50/regular_planted")
#path_to_txt <- "AllPeriods_kb3reg_auslesedf_kschwach_bstark07table.txt"
#red_pcl_rdata <- "AllPeriods_kb3reg_auslesedf_kschwach_bstark07tabledsm_red_pcl.RData"
#f_size=1

get_species <- function(path_to_txt=".", red_pcl_rdata=".", out_path=".", out_name=".", f_size){

  # get old path
  old_path <- getwd()

  # read_original_point_cloud to get same extent for output raster as for dsm
  pcl <- read.table(path_to_txt, header=T, fill=T, sep="\t")

  #head(pcl)

  #########################################################################
  ## get species
  #########################################################################

  max_x <- max(pcl[,1])
  min_x <- min(pcl[,1])

  max_y <- max(pcl[,2])
  min_y <- min(pcl[,2])

  ## set raster width to filter points
  filter_size=f_size

  pt_x <- seq(min_x, max_x, filter_size)
  pt_y <- seq(min_y, max_y, filter_size)

  load(red_pcl_rdata)

  #head(new_pcl1)

  z1 <- as.data.frame(new_pcl1[,1:3])
  colnames(z1) <- c("x", "y", "z")

  sp::coordinates(z1)=~x+y

  pts <- sp::SpatialPointsDataFrame(z1, data.frame(id=1:length(z1)))

  pts$species <- new_pcl1[,5]

  dsm_temp1 <- raster::raster(ncols = length(pt_x), nrows = length(pt_y),
                       ext = raster::extent(min_x, max_x, min_y, max_y))

  dsm_r <- raster::rasterize(pts, field="species" , dsm_temp1, fun=median, background=0)


  #raster::plot(dsm_r_m)

  dsm_r_m <- raster::focal(dsm_r[[1]], w=matrix(1,nrow=3,ncol=3), fun=median)
  #raster::plot(dsm_r_m)
  dsm_r_m[dsm_r_m>50&dsm_r_m<900]<-666

  setwd(out_path)
  raster::writeRaster(dsm_r_m, filename=paste(out_name,"spec_med3.tif", sep=""), format="GTiff", overwrite=T)


  # #########################################################################
  # ## get shadows
  # #########################################################################
  #
  #
  # # interpolate "point cloud" with akima package
  # x=new_pcl1$x
  # y=new_pcl1$y
  # z=new_pcl1$z
  # s= s <- akima::interp(new_pcl1[,1], new_pcl1[,2], new_pcl1[,3], xo=seq(min(new_pcl1[,1]), max(new_pcl1[,1]), length = length(pt_x)),
  #                       yo=seq(min(new_pcl1[,2]), max(new_pcl1[,2]), length = length(pt_y)),
  #                       linear = FALSE, extrap=F, duplicate = "strip", dupfun = NULL,
  #                       nx = length(pt_x), ny = length(pt_y),
  #                       jitter = 10^-12, jitter.iter = 6, jitter.random = FALSE)
  #
  # ## works but results are not fully plausible yet
  # ## for example now shadows in "valley" between crowns
  #
  # rotate <- function(x) t(apply(x, 2, rev))
  #
  # # define sun position
  # sv=insol::normalvector(90,0)
  #
  # # calculate shadows based on canopy height matrix (see preceeding step)
  # sha <- insol::doshade(rotate(rotate(rotate(s$z))), dl=1, sv)
  # #image(t(sha[nrow(sha):1,]),col=grey(1:100/100))
  #
  # sha_temp <- raster::raster(ncols = length(pt_x), nrows = length(pt_y),
  #                            ext = raster::extent(min_x, max_x, min_y, max_y))
  #
  #
  # # rotate values to match original orientation
  # #rotate <- function(x) t(apply(x, 2, rev))
  # raster::values(sha_temp) <- sha
  #
  # #raster::plot(sha_temp)
  #
  # # write our final chm raster
  # raster::writeRaster(sha_temp, filename=paste(out_name,"shad.tif", sep=""), format="GTiff", overwrite=T)
  #
  # #########################################################################
  # ## get combined species + shadows
  # #########################################################################
  #
  # p <- sha_temp==1
  #
  # dsm_r_m_f <- dsm_r_m
  # dsm_r_m_f[p] <- 100
  #
  # raster::writeRaster(dsm_r_m_f, filename=paste(out_name,"sp_sh_comb.tif", sep=""), format="GTiff", overwrite=T)
  #
  # setwd(old_path)

}
