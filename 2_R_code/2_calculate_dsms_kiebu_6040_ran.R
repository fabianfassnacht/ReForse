setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/60-40/random_planted")

fils <- list.files(pattern="table.txt$")
#fils <- fils[21:25]

f_size <- 1
qu <- 0.95
out_path <- "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands_dsm/Kiefer_Buche/60-40/random_planted"


for (i in 1:length(fils)) {
  
  setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands/Kiefer_Buche/60-40/random_planted")
  get_dsm(path_to_txt=fils[i], out_path=out_path, out_name=paste(strsplit(fils[i], ".txt")[1], "dsm", sep=""), f_size, qu)

  }