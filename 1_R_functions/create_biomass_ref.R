#' Get Biomass Reference
#'
#' @author Fabian Fassnacht
#' @param path_to_txt input table containing the SILVA table
#' @param in_path directory containing input SILVA tables
#' @param plot_size plot size (in map units) 
#' @param hor_shift horizontal shift of the plot in m (relative to the stand center)
#' @param ver_shift vertical shift of the plot in m (relative to the stand center)
#' @param sil_size size of the SILVA stand
#' @export
#'


get_biom_ref <- function(path_to_txt, in_path, plot_size, hor_shift, ver_shift, sil_size){
  
  old_wd <- getwd()
  
  setwd(in_path)
  
  t <- read.table(path_to_txt, sep="\t", header=T, fill=T)
  t <- t[complete.cases(t),]
  #head(t)
  
  
  #plot(t$x, t$y, xlim=c(0,75), ylim=c(0,75))
  #max(t$y)
  
  setwd(old_wd)
  #######################################################
  # Calculate biomass of individual trees 
  #######################################################
  
  t$biomass <- rep(0, length(t[,1]))
  
  for (i in 1:length(t[,1])) {
    
    art <- t$Art[i]
    func <- aeq[[art]]
    
    t$biomass[i] <- func(t$BHD[i]) 
    
  }
  
  
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
  
  ## extract all entries from table that are within the plot
  
  xmin <- ((sil_xl/2)+sh_h)-(plsz/2)
  xmax <- ((sil_xl/2)+sh_v)+(plsz/2)
  
  ymin <- ((sil_yl/2)+sh_h)-(plsz/2)
  ymax <- ((sil_yl/2)+sh_v)+(plsz/2)
  
  t2 <- t[t$x > xmin & t$x < xmax,]
  t3 <- t2[t2$y > ymin & t2$y < ymax,]
  
  
  #plot(t$x, t$y, xlim=c(0,75), ylim=c(0,75))
  #par(new=T)
  #plot(t3$x, t3$y, xlim=c(0,75), ylim=c(0,75), col="red", ann=F)
  
  if (length(t3[,1])==0) {
  
  empty <- t[1,]
  empty[,11] <- 0
  empty[,7] <- (xmin+xmax)/2
  empty[,8] <- (ymin+ymax)/2
  
  t3[1,] <- empty } 
  
  #######################################################
  # Calculate biomass/ha of plot (full sampling of all trees)
  #######################################################
  
  t3$perha_biom <- rep(0, length(t3[,1]))
  
  ## define expansion factor
  
  exf <- 10000 / plsz^2
  
  ## calculate extrapolated biomass values per tree
  
  for (i2 in 1:length(t3[,1])) {
    
    t3$perha_biom[i2] <- t3$biomass[i2] * exf
    
  }
  
  ## final plot-biomass value
  
  fin_qu <- sum(t3$perha_biom)/1000
  fin_qu

}
  
  
  ##################
  # APPROACH 2
  ##################
  
  
  #######################################################
  # Calculate biomass/ha of plot (concentric rings)
  #######################################################
  
  # 
  # # set plot center
  # xcent <- sil_size/2
  # ycent <- sil_size/2
  # 
  # # set radii of concentric rings
  # rad1 <-2 
  # rad2 <-3
  # rad3 <-6
  # rad4 <- 12
  # 
  # # set diameter thresholds for each radius  
  # th1 <- 7
  # th2 <- 10
  # th3 <- 15
  # th4 <- 30
  # 
  # # calculate expansion factors for each diameter class / radius
  # exf_r1 <- 10000/(pi * rad1^2)
  # exf_r2 <- 10000/(pi * rad2^2)
  # exf_r3 <- 10000/(pi * rad3^2)
  # exf_r4 <- 10000/(pi * rad4^2)
  # 
  # # function to identify whether a tree is within a ring with a given center and radius
  # chk_loc <- function(x,y, center_x, center_y, radius) {(x - center_x)^2 + (y - center_y)^2 < radius^2}
  # 
  # # check all trees in table whether they are located in ring with radius = rad1 and whether they match
  # # the corresponding diameter class
  # tr_rad1 <- chk_loc(t$x, t$y, center_x = xcent, center_y = ycent, radius = rad1)
  # s_tr_rad1 <- t[tr_rad1,]
  # s_tr_rad11 <- s_tr_rad1[s_tr_rad1$BHD > th1,]
  # s_tr_rad11 <- s_tr_rad11[s_tr_rad11$BHD <= th2,]
  # s_tr_rad11$biom_ha <- s_tr_rad11$biomass * exf_r1
  # 
  # tr_rad2 <- chk_loc(t$x, t$y, center_x = xcent, center_y = ycent, radius = rad2)
  # s_tr_rad2 <- t[tr_rad2,]
  # s_tr_rad22 <- s_tr_rad2[s_tr_rad2$BHD > th2,]
  # s_tr_rad22 <- s_tr_rad22[s_tr_rad22$BHD <= th3,]
  # s_tr_rad22$biom_ha <- s_tr_rad22$biomass * exf_r2
  # 
  # tr_rad3 <- chk_loc(t$x, t$y, center_x = xcent, center_y = ycent, radius = rad3)
  # s_tr_rad3 <- t[tr_rad3,]
  # s_tr_rad33 <- s_tr_rad3[s_tr_rad3$BHD > th3,]
  # s_tr_rad33 <- s_tr_rad33[s_tr_rad33$BHD <= th4,]
  # s_tr_rad33$biom_ha <- s_tr_rad33$biomass * exf_r3
  # 
  # tr_rad4 <- chk_loc(t$x, t$y, center_x = xcent, center_y = ycent, radius = rad4)
  # s_tr_rad4 <- t[tr_rad4,]
  # s_tr_rad44 <- s_tr_rad4[s_tr_rad4$BHD > th4,]
  # s_tr_rad44$biom_ha <- s_tr_rad44$biomass * exf_r4
  # 
  # # merge all selected trees into a single file
  # sel_trees <- rbind(s_tr_rad11, s_tr_rad22, s_tr_rad33, s_tr_rad44)
  # 
  # # remove duplicated trees (should normally be not the case)
  # sel_trees_ind <- duplicated(sel_trees[,1:8])
  # 
  # 
  # if (length(table(sel_trees_ind))>1) {
  #   sel_trees_f <- sel_trees[sel_trees_ind,]
  # } else {
  #   sel_trees_f <- sel_trees
  # }
  # 
  # # calculate final biomass values in tons / ha  
  # sum(sel_trees_f$biom_ha)/1000
  
