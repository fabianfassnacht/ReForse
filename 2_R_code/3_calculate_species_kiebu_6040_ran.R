setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/60-40/random_planted")

fils <- list.files(pattern="table.txt$")
rd_fils <- list.files(pattern=".RData$")

f_size <- 1

out_path <- "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands_species/Kiefer_Buche/60-40/random_planted"


for (i in 1:length(fils)) {
  
  setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/60-40/random_planted")
  
  get_species(path_to_txt=fils[i], red_pcl_rdata=rd_fils[i], out_path=out_path, out_name=paste(strsplit(fils[i], ".txt")[1]), f_size)
  print(i)

  }