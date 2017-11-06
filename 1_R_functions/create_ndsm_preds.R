#' Get canopy height predictor variables
#'
#' @author Fabian Fassnacht
#' @param path_to_ndsm raster ndsm files created with get_dsm function
#' @param in_path directory containing dsm files
#' @param plot_size plot size (in map units) 
#' @param hor_shift horizontal shift of the plot in m (relative to the stand center)
#' @param ver_shift vertical shift of the plot in m (relative to the stand center)
#' @param sil_size size of the SILVA stand
#' @export
#'


get_ndsm_preds <- function(path_to_ndsm, in_path, plot_size, hor_shift, ver_shift, sil_size){
  
  old_wd <- getwd()
  
  setwd(in_path)
  img <- raster::stack(path_to_ndsm)
  

  #plot(t$x, t$y, xlim=c(0,75), ylim=c(0,75))
  #max(t$y)
  
  setwd(old_wd)

  
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
  
  e <- raster::extent(img)
  
  e[1] <- xmin
  e[2] <- xmax
  e[3] <- ymin
  e[4] <- ymax  
  
  img_ex <- raster::crop(img, e)
  #raster::plot(img_ex)

  ## calculate nDSM predictors
  ndsm_preds <- as.data.frame(matrix(nrow=1, ncol = 12))
  
  ndsm_preds[1:9] <- quantile(raster::values(img_ex), c(0.1, 0.2, 0.3, 0.4, 0.6, 0.7, 0.8, 0.9, 0.95)) 
  ndsm_preds[10] <- mean(raster::values(img_ex))
  ndsm_preds[11] <- median(raster::values(img_ex))
  ndsm_preds[12] <- sd(raster::values(img_ex))
  
  colnames(ndsm_preds) <- c("qu_0_1", "qu_0_2", "qu_0_3", "qu_0_4", "qu_0_6", "qu_0_7", "qu_0_8", "qu_0_9", "qu_0_95", "mean", "median", "sd")
  ndsm_preds
}
  
