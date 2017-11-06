# Script created by 


#load the required packages


#' Create silva files
#' 
#' @author Steven Hill and Hooman Latifi (University of W?rzburg)
#' @param xmin minimum x value
#' @param xmax maximum x value
#' @param ymin minimum y value
#' @param ymax maximum y value
#' @param ntrees number of trees
#' @param path path of output folder
#' 
#' @note Tree types are encoded by Forest Growth Chair of TU M?nchen
#' @export
createSilvaFiles <- function(xmin=0, xmax=100, ymin=0, ymax=100,  ntrees=6000, path = "."){
  
  library(spatstat)
  library(raster)
  # set the working directory
  oldpath = getwd()
  setwd(path)

  #random plantation pattern
  x <- runif(ntrees, max=xmax)
  y <- runif(ntrees, max=xmax)
  grd <- ppp(x, y, c(xmin,xmax), c(ymin,ymax))
  #plot (grd)
  
  #regular plantation pattern 
  ext = raster::extent(xmin, xmax, ymin,ymax)
  r = raster(ext = ext, resolution = sqrt((xmax*ymax)/ntrees))
  #grd = as.data.frame(coordinates(r))
  #plot (grd)
  
  
  #generating single tree data frame
  #include the first tree type
  xx<-as.data.frame(grd)[,1]
  yy<-as.data.frame(grd)[,2]
  
  ID<-1:length(xx)                        # make ID¬¥s
  tables<-as.data.frame(cbind(ID,xx,yy)) 
  
  tables$Z<-2                           #tree height
  tables$dbh<-2                         #DBH
  tables$kd<-0                           #crown diameter 
  tables$kra<-0                          #crown base height
  tables$art <- 3                        #tree type identification number
  tables$kenn3 <- 0                      #last column needs random values
  
  ######################################################
  #include the second tree type
  #50:50 distribution and same values
  
  #make the attribute names for the second tree type
  #art2<-5
  #z <- 2
  #dbh2 <- 2
  #nmb<-floor(runif(ntrees/2, min=0, max=ntrees))
  
  #you can change the proportion of the tree types by using the following line
  #nmb<-floor(runif(1250, min=0, max=ntrees))
  
  #make the attribute names for the second tree type
  #tables[nmb,"art"]<-art2
  #tables[nmb,"Z"]<-z
  #tables[nmb,"dbh"]<-dbh2
  ########################################################
  
  
  #plot paramters for the SILVA input table header 
  FORST_ID <- "NordSWww"                #forest stand name (!length must be 8)
  BEST_TYP <- 1                         #always 1 in .txt data
  angle_north<-"0.0"                    #plot angle (e.g. North: 0, South:180)
  fake_nam <-"abc"                      #fake name
  fake_num<-"1"                         #fake num
  growing_zone <- "99.73.01"            #growing zone
  latitude <- "49.0"                    #latitude
  meanHNN<-600                         #height above sea level
  asp="128"                           #Exposition (e.g. North: 0, South:180)
  slop="13"                           #slope in degrees
  year <- 2012                          #year
  soil_fresh <- 6                       #soil freshness index 
  nutrit <- 4                           #nutrition supply index
  
  
  #create final tables    
  silva_tabelle <- cbind(tables$ID, tables$art, tables$dbh, tables$Z, tables$kra, tables$kd, tables$xx, tables$yy, tables$kenn3)
  
  filename <- "silva_file.txt"
  silva_tab <- assign(filename, silva_tabelle)
  write.table(silva_tabelle, filename, quote = FALSE, row.names = FALSE, 
              col.names = FALSE, 
              sep = "\t")
  
  #making the headers for line 1 and 2 of the input table
  header1 <- as.character(paste(FORST_ID, (x.range <- diff(c(ext@xmin, ext@xmax))),(y.range <- diff(c(ext@ymin, ext@ymax))), (angle_north), (fake_nam)), sep = " ")
  header2 <- as.character(paste((fake_num), (growing_zone), (latitude), (meanHNN), (asp), (slop), (year), (soil_fresh), (nutrit), sep = " "))
  
  #write the file as output
  file <- "silva_file.txt"
  cat(header1, "\n", file = file)
  write.table(header2, file, append = T, quote = FALSE, row.names = FALSE, 
              col.names = F, fileEncoding = "", 
              sep = "")
  write.table(silva_tab, file, append = T, quote = FALSE, row.names = FALSE, 
              col.names = F, fileEncoding = "", 
              sep = "\t")
  
  
  
  setwd(oldpath)
  
}


