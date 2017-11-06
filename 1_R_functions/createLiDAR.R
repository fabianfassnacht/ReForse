#' Create LiDAR
#'
#' @author Fabian Fassnacht
#' @param path path of output folder
#' @param in_t input table containing the required tree attributes which include: species, DBH, h, crown diameter, x-position, y-position
#' @param trees_path path to a folder including txt files with the point clouds of LiDAR trees
#' @param out_path path to a folder where the final point-clouds and meta-data is stored
#' @param out_filen base for output-filenames
#' @param sp_col integer indicating the column-number in which species information is stored
#' @param h_col integer indicating the column-number in which the height of the tree is stored
#' @param crd_col integer indicating the column-number in which the crown diameter of the tree is stored
#' @param x_col integer indicating the column-number in which the x position of the tree is stored
#' @param y_col integer indicating the column-number in which the y position of the tree is stored
#' @param cr_range float indicating the buffer for the crown diameters of LiDAR trees that will be considered compared to
#' the crown diameter of the input tree
#' @param h_range float indicating the buffer for the height of LiDAR trees that will be considered compared to
#' the height of the input tree
#' @param header_trees .RData file created with function "normalizeTrees" containing the header information of the individual trees
#' @export
#'
#'

createLiDAR <- function(in_t, trees_path = ".", out_path = ".", out_filen = ".", sp_col, h_col, crd_col, x_col, y_col, cr_range, h_range, header_trees = "."){


  oldpath = getwd()
  #setwd(trees_path) # TODO - bad style, should




  #########################
  # read example trees
  #########################

  # trees

  setwd(trees_path)
  fils <- list.files(pattern=".txt")

  trees <- list()

  for (i in 1:length(fils)) {

    trees[[i]] <- read.table(fils[i], sep="\t", header=T)

  }

  #trees[[44]]

  # header for trees
  load(header_trees)

  tree_h <- do.call(rbind, tree_header) # tree_header is a fixed variable name from the function "normalizeTrees".
  tree_h <- as.data.frame(tree_h)


  #########################
  # extract height and crown diameter of
  # example trees
  #########################

  h_cd <- matrix(ncol=2, nrow=length(trees))

  #i3=1
  for (i3 in 1:length(trees)){

    tr1 <- trees[[i3]]
    hmax <- max(tr1$z)

    mx <- mean(tr1$x)
    my <- mean(tr1$y)
    m <- matrix(nrow=1, ncol=2)
    m[1,] <- c(mx,my)

    pts1 <- tr1[,1:2]
    head(pts1)

    dist1 <- fields::rdist(pts1, m)
    maxd1 <- pts1[dist1%in%max(dist1),]

    dist2 <- fields::rdist(pts1, maxd1)
    maxd2 <- max(dist2)

    h_cd[i3,] <- c(hmax, maxd2)

  }

  tree_h$param6 <- h_cd[,1]
  tree_h$param7 <- h_cd[,2]
  tree_h$param8 <- seq(1, length(trees), 1)

  colnames(tree_h) <- c("species", "species_id", "site", "pt_density", "year_fl", "max_height", "max_cr_dia",
                        "sil_tree_id", "lid_tree_id", "param10", "param11", "param12", "param13", "param14")

  #########################
  # compile trees
  #########################

  # create list to store results
  pcl <- list()
  sil_tree_ids <- list()
  lid_tree_ids <- list()
  species_ids <- list()

  selected_trees <- list()
  rot_ang <- list()

  # set seed to create reproducible results
  set.seed(33)

  #i2=1

  # add LiDAR tree for each tree in the SILVA table
  #


  for (i2 in 1:length(in_t[,1])) {

    # get one line (= one tree) from SILVA table
    t1 <- in_t[i2,]

    # filter available trees for species (remain only species that match the species of the SILVA tree)
    f1 <- tree_h[tree_h[,2]%in%t1[sp_col],]

    # filter remaining trees for crown diameter

    # Check whether there are LiDAR trees that have crown diameter +- 2.5 m of the SILVA tree

    if (any((f1$max_cr_dia < (t1[crd_col]+cr_range) & f1$max_cr_dia > (t1[crd_col]-cr_range)) == TRUE)) {
      # if yes, then extract those trees

      f2 <- f1[f1$max_cr_dia < as.numeric(t1[crd_col]+cr_range) & f1$max_cr_dia > as.numeric(t1[crd_col]-cr_range),]

    } else {

      # if not use the single tree with the crown diameter closest to the SILVA tree crown diameter
      diff_cr_d <- abs(f1$max_cr_dia - as.numeric(t1[crd_col]))
      f2 <- f1[abs(f1$max_cr_dia - as.numeric(t1[crd_col]))%in%min(diff_cr_d),]

    }

    # filter remaining trees for height

    # Check whether there are remaining LiDAR trees that have a height of +- 5 m of the SILVA tree
    if (any(f2$max_height < as.numeric(t1[h_col]+h_range) & f2$max_height > as.numeric(t1[h_col]-h_range))==TRUE) {

      # if yes, then extract those trees
      f3 <- f2[f2$max_height < as.numeric(t1[h_col]+h_range) & f2$max_height > as.numeric(t1[h_col] - h_range),]
      # and eliminate NA entries
      f3 <- f3[!is.na(f3[,1]),]
    } else {
      # if not use the single tree with height closest to the SILVA tree height
      diff_h <- abs(f2$max_height - as.numeric(t1[h_col]))
      f3 <- f2[abs(f2$max_height - as.numeric(t1[h_col]))%in%min(diff_h),]
    }


    # from the now remaining trees, select a random tree
    s <- sample(seq(1,length(f3[,1]),1), 1)
    f4 <- f3[s,]
    t_pcl_id <- f4$sil_tree_id
    t_pcl <- trees[[t_pcl_id]]
    #scatterplot3d::scatterplot3d(t_pcl[,1],t_pcl[,2],t_pcl[,3], main="3D Scatterplot")

    # stretch x and y values to match SILVA crown diameter
    # (!!this step has to be conducted before changing the location to the SILVA tree location!!)
    scd <- as.numeric(t1[crd_col])/f4$max_cr_dia
    scd_v <- rep(as.numeric(scd), length(t_pcl[,1]))
    t_pcl[,1] <- t_pcl[,1]*scd_v
    t_pcl[,2] <- t_pcl[,2]*scd_v


    # get x,y-center of point cloud of trees
    t_pcl_min_x <- min(t_pcl[,1])
    t_pcl_max_x <- max(t_pcl[,1])
    t_pcl_min_y <- min(t_pcl[,2])
    t_pcl_max_y <- max(t_pcl[,2])

    t_pcl_cen_x <- (t_pcl_max_x - t_pcl_min_x)/2.0
    t_pcl_cen_y <- (t_pcl_max_y - t_pcl_min_y)/2.0


    # add x,y position of SILVA tree minus the center coordinate to coordinates of the LiDAR tree points
    # (to locate the center of the tree point cloud to the position of the SILVA tree)
    t_pcl[,1] <- t_pcl[,1]+as.numeric(rep((as.numeric(t1[x_col])-t_pcl_cen_x),length(t_pcl[,1])))
    t_pcl[,2] <- t_pcl[,2]+as.numeric(rep((as.numeric(t1[y_col])-t_pcl_cen_y),length(t_pcl[,1])))

    # stretch height of LiDAR tree to match SILVA height
    sch <- f4$max_height/t1[h_col]######### changed something here (no comma!! check!!)
    sch_v <- rep(as.numeric(sch), length(t_pcl[,1]))
    t_pcl[,3] <- t_pcl[,3]/sch_v



    # randomly rotate tree for randomisation
    ran <- sample(seq(1,360,1), 1)
    t_pcl_f <- turn_mat(ran, t_pcl[,1], t_pcl[,2], t_pcl[,3])

    #scatterplot3d(t_pcl_f[,1],t_pcl_f[,2],t_pcl_f[,3], main="3D Scatterplot")

    # add id
    # add species
    sil_tree_ids[[i2]] <- rep(i2, length(t_pcl[,1]))
    lid_tree_ids[[i2]] <- rep(t_pcl_id, length(t_pcl[,1]))
    species_ids[[i2]] <- rep(as.numeric(t1[sp_col]), length(t_pcl[,1]))

    selected_trees[[i2]] <- t_pcl_id
    rot_ang[[i2]] <- ran

    #t_pcl_f <- t_pcl

    # store final tree to list
    pcl[[i2]] <- t_pcl_f
    #print(i2)

  }


  # convert 3D-points of all trees in the list to one table
  pcl_fin <- do.call(rbind, pcl)

  # attach species, SILVA tree number and LiDAR tree number to table
  sil_tree_ids_fin <- unlist(sil_tree_ids)
  lid_tree_ids_fin <- unlist(lid_tree_ids)
  species_ids_fin <- unlist(species_ids)
  pcl_fin2 <- cbind(pcl_fin, sil_tree_ids_fin, species_ids_fin, lid_tree_ids_fin)

  # check table
  #head(pcl_fin2)

  # write out table
  setwd(out_path)
  write.table(pcl_fin2, file=paste(out_filen, "table.txt", sep =""), sep="\t", row.names=F)

  # create table with frequencies of selected LiDAR trees

  sel_t_r <- table(unlist(selected_trees))

  write.table(sel_t_r, file=paste(out_filen, "sel_trees.txt", sep =""), sep="\t", row.names=F)
  #hist(unlist(rot_ang))

  setwd(oldpath)
}

# bug fixing

#tree_pl1 <- trees[[44]]

#tree_pl <- turn_mat(90, tree_pl1[,1], tree_pl1[,2], tree_pl1[,3])
#scatterplot3d(tree_pl[,1],tree_pl[,2],tree_pl[,3], main="3D Scatterplot")
#scatterplot3d(tree_pl1[,1],tree_pl1[,2],tree_pl1[,3], main="3D Scatterplot")

#hist(tree_pl[,1])
#hist(tree_pl1[,1])

