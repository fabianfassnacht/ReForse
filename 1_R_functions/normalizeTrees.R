#' Normalize Trees
#' 
#' @param path folder with tree files
#' @details XXX
#' @author Fabian Fassnacht
#' 
#' @export
#' 
normalizeTrees <- function(path = "."){
  
  oldpath = getwd()
  setwd(path) # TODO - bad style, should 
  
  options(digits=12)
  
  fils <- list.files(pattern=".asc")
  i=1
  
  ## normalize the coordinates and save to new textfiles
  
  for (i in 1:length(fils)) {
    
    tree <- read.table(fils[i], header=F, skip=23, dec = ",")
    tree[,1] <- as.numeric(as.character(tree[,1]))
    tree[,2] <- as.numeric(as.character(tree[,2]))
    tree[,3] <- as.numeric(as.character(tree[,3]))
    
    colnames(tree) <- c("x", "y", "z")
    
    min_x <- min(tree$x)
    min_y <- min(tree$y)
    
    tree[,1] <- tree[,1]-min_x
    tree[,2] <- tree[,2]-min_y
    
    filen <- strsplit(fils[i], ".asc")
    
    
    write.table(tree, file = paste(filen, "_norm.txt"), sep="\t", row.names = FALSE)
    remove(tree)
    
    #scatterplot3d(tree2[,1],tree2[,2],tree2[,3], main="3D Scatterplot")
    
  }
  
  
  ## get additional infos from header
  
  i2=1
  
  tree_header <- list()
  
  for (i2 in 1:length(fils)) {
    
    head_mat <- as.data.frame(matrix(nrow=1, ncol=21))  
    tree <- read.table(fils[i2], header=F, nrows=21, sep="\t")
    head_mat[1,] <- tree[,2]
    colnames(head_mat) <- c("species", "species_id", "site", "pt_density", "param5", "param6", "param7", "param8", "param9", 
                            "param10", "param11", "param12", "param13", "param14", "param15", "param16", "param17", 
                            "param18", "param19", "param20")
    
    tree_header[[i2]] <- head_mat
    
    #scatterplot3d::scatterplot3d(tree2[,1],tree2[,2],tree2[,3], main="3D Scatterplot")
    
  }
  
  
  save(tree_header, file = "trees_header.RData")
  setwd(oldpath)
}