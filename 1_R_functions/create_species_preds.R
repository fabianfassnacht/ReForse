#' Get species predictor variables
#'
#' @author Fabian Fassnacht
#' @param path_to_species raster files created with get_species function(has to correspond to the same dataset as path_to_dsm)
#' @param path_to_dsm raster files created with get_dsm function (has to correspond to the same dataset as path_to_species)
#' @param in_path directory containing species tif files
#' @param in_path2 directory containing dsm tif files
#' @param plot_size plot size (in map units)
#' @param hor_shift horizontal shift of the plot in m (relative to the stand center)
#' @param ver_shift vertical shift of the plot in m (relative to the stand center)
#' @param sil_size size of the SILVA stand
#' @export
#'

# in_path <- "E:/test"
# plot_size = 20
# hor_shift = 0
# ver_shift = 0
# sil_size = 100
# path_to_species <- "E:/test/AllPeriods_kb3_ auslesedf31tablespec_med3.tif"
# path_to_dsm <- "E:/test/AllPeriods_kb3_ auslesedf31tabledsm_dsm_akima.tif"


get_species_preds <- function(path_to_species, path_to_dsm, in_path, in_path2, plot_size, hor_shift, ver_shift, sil_size){

  old_wd <- getwd()

  setwd(in_path)
  img <- raster::stack(path_to_species)
  setwd(in_path2)
  dsm <- raster::raster(path_to_dsm)

  #plot(t$x, t$y, xlim=c(0,75), ylim=c(0,75))
  #max(t$y)

  setwd(old_wd)

  ##############################################
  ### calculate shadows and mask species layer
  ##############################################

  #define sun azimuth and elevation
  elevation = 60
  azimuth = 190

  #calculate cast shadow
  require(raster)
  sv = insol::normalvector(90-elevation, azimuth)
  sh = insol::doshade(dsm, sv)

  img1 <- raster::mask(img, sh, maskvalue=0, updatevalue=100)

  ##################
  # APPROACH 1
  ##################


  #######################################################
  # extract quadratic plots around center of SILVA plot
  #######################################################

  ## define plot size (length of one side of the quadrat)
  plsz <- plot_size

  ## define shift from plot center
  sh_v <- ver_shift
  sh_h <- hor_shift

  ## define length of SILVA plot side

  sil_xl <- sil_size
  sil_yl <- sil_size



  xmin <- ((sil_xl/2)+sh_h)-(plsz/2)
  xmax <- ((sil_xl/2)+sh_v)+(plsz/2)

  ymin <- ((sil_yl/2)+sh_h)-(plsz/2)
  ymax <- ((sil_yl/2)+sh_v)+(plsz/2)

  ## extract dsm area overlapping with biomass reference area

  e <- raster::extent(img1)

  e[1] <- xmin
  e[2] <- xmax
  e[3] <- ymin
  e[4] <- ymax

  img_ex <- raster::crop(img1, e)
  #raster::plot(img_ex)

  ## calculate nDSM predictors

  # create empty matrix to store results
  results <- matrix(NA, nrow=1, ncol=6)
  # rename column names
  colnames(results) <- c("broadleaved", "coniferous", "bl_cf_mix", "mixed", "ground", "shadow")

  # count pixels of all considered classes (soil, shadow, coniferous, broadleaved) in each cluster-polygon
  # calculate percentages of each class

  # get raster values
  data <- raster::values(img_ex)

  # calculate percentages of each class
  results[1] <- length(data[data==5])/length(data)
  results[2] <- length(data[data==3])/length(data)
  results[3] <- length(data[data==4])/length(data)
  results[4] <- length(data[data==666])/length(data)
  results[5] <- length(data[data==999])/length(data)
  results[6] <- length(data[data==100])/length(data)

  results

}

