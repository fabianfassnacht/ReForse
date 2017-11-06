# normalize trees
#normalizeTrees("E:/KIT_Forschung/26_sim_LiDAR/1_LiDAR_trees/1_final_trees_study")

# create LiDAR point clouds from silva-tables

##
## create point clouds for Buche random planting cases
##

setwd("E:/KIT_Forschung/26_sim_LiDAR/3_SILVA_inputs/1_inputs_study/Kiefer_Buche/60-40/random_planting")

model_bu_r <- list.files("E:/KIT_Forschung/26_sim_LiDAR/3_SILVA_inputs/1_inputs_study/Kiefer_Buche/60-40/random_planting", pattern=".txt")

#model_bu_r <- model_bu_r[21:25]

sp_col <- 2
h_col <- 4
crd_col <- 6
x_col <- 7
y_col <- 8
cr_range <- 2
h_range <- 4
trees_path = "E:/KIT_Forschung/26_sim_LiDAR/1_LiDAR_trees/1_final_trees_study"
header_trees = "trees_header.RData"

#i = 4

for (i in 1:length(model_bu_r)) {
  
  setwd("E:/KIT_Forschung/26_sim_LiDAR/3_SILVA_inputs/1_inputs_study/Kiefer_Buche/60-40/random_planting")
  in_t <- read.table(model_bu_r[i], fill=T, sep ="\t", header=T)
  in_t <- in_t[complete.cases(in_t),]
  colnames(in_t)<- c("Nr","Art","BHD","h","kra","kd","x","y","kenn","mort")
  head(in_t)
  
  out_filen <- strsplit(model_bu_r[i], ".txt")[1]
  
  createLiDAR(in_t, trees_path = "E:/KIT_Forschung/26_sim_LiDAR/1_LiDAR_trees/1_final_trees_study", 
              out_path = "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/60-40/random_planted", out_filen = out_filen, 
              sp_col, h_col, crd_col, x_col, y_col, cr_range, h_range, header_trees = "trees_header.RData")

}
