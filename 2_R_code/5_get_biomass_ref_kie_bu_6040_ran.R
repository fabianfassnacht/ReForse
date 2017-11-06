setwd("E:/KIT_Forschung/26_sim_LiDAR/11_Github/allometries")
load("allometries.RData")


setwd("E:/KIT_Forschung/26_sim_LiDAR/3_SILVA_inputs/1_inputs_study/Kiefer_Buche/60-40/random_planting")

in_path <- "E:/KIT_Forschung/26_sim_LiDAR/3_SILVA_inputs/1_inputs_study/Kiefer_Buche/60-40/random_planting"

fils <- list.files(pattern = ".txt")

res <- as.data.frame(matrix(data=NA, ncol=42, nrow=length(fils)))

outp <- "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands_biomass/Kiefer_Buche/60-40/random_planted"

#i=10
#path_to_txt <- fils[10]
#plot_size=10 
#hor_shift=0 
#ver_shift=0
#sil_size=70

for (i in 1:length(fils)) {
  
  ps1 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=10, hor_shift=0, ver_shift=0, sil_size=70)
  ps2 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=11, hor_shift=0, ver_shift=0, sil_size=70)
  ps3 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=12, hor_shift=0, ver_shift=0, sil_size=70)
  ps4 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=13, hor_shift=0, ver_shift=0, sil_size=70)
  ps5 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=14, hor_shift=0, ver_shift=0, sil_size=70)
  ps6 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=15, hor_shift=0, ver_shift=0, sil_size=70)
  ps7 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=16, hor_shift=0, ver_shift=0, sil_size=70)
  ps8 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=17, hor_shift=0, ver_shift=0, sil_size=70)
  ps9 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=18, hor_shift=0, ver_shift=0, sil_size=70)
  ps10 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=19, hor_shift=0, ver_shift=0, sil_size=70)
  ps11 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=20, hor_shift=0, ver_shift=0, sil_size=70)
  ps12 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=21, hor_shift=0, ver_shift=0, sil_size=70)
  ps13 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=22, hor_shift=0, ver_shift=0, sil_size=70)
  ps14 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=23, hor_shift=0, ver_shift=0, sil_size=70)
  ps15 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=24, hor_shift=0, ver_shift=0, sil_size=70)
  ps16 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=25, hor_shift=0, ver_shift=0, sil_size=70)
  ps17 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=26, hor_shift=0, ver_shift=0, sil_size=70)
  ps18 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=27, hor_shift=0, ver_shift=0, sil_size=70)
  ps19 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=28, hor_shift=0, ver_shift=0, sil_size=70)
  ps20 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=29, hor_shift=0, ver_shift=0, sil_size=70)
  ps21 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=30, hor_shift=0, ver_shift=0, sil_size=70)
  ps22 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=31, hor_shift=0, ver_shift=0, sil_size=70)
  ps23 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=32, hor_shift=0, ver_shift=0, sil_size=70)
  ps24 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=33, hor_shift=0, ver_shift=0, sil_size=70)
  ps25 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=34, hor_shift=0, ver_shift=0, sil_size=70)
  ps26 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=35, hor_shift=0, ver_shift=0, sil_size=70)
  ps27 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=36, hor_shift=0, ver_shift=0, sil_size=70)
  ps28 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=37, hor_shift=0, ver_shift=0, sil_size=70)
  ps29 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=38, hor_shift=0, ver_shift=0, sil_size=70)
  ps30 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=39, hor_shift=0, ver_shift=0, sil_size=70)
  ps31 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=40, hor_shift=0, ver_shift=0, sil_size=70)
  ps32 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=41, hor_shift=0, ver_shift=0, sil_size=70)
  ps33 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=42, hor_shift=0, ver_shift=0, sil_size=70)
  ps34 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=43, hor_shift=0, ver_shift=0, sil_size=70)
  ps35 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=44, hor_shift=0, ver_shift=0, sil_size=70)
  ps36 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=45, hor_shift=0, ver_shift=0, sil_size=70)
  ps37 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=46, hor_shift=0, ver_shift=0, sil_size=70)
  ps38 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=47, hor_shift=0, ver_shift=0, sil_size=70)
  ps39 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=48, hor_shift=0, ver_shift=0, sil_size=70)
  ps40 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=49, hor_shift=0, ver_shift=0, sil_size=70)
  ps41 <- get_biom_ref(fils[i], in_path = in_path,  plot_size=50, hor_shift=0, ver_shift=0, sil_size=70)
  
  out_name = strsplit(fils[i], ".txt")[1]
  res[i,] <- c(ps1, ps2, ps3, ps4, ps5, ps6, ps7, ps8, ps9, ps10,ps11, ps12, ps13, ps14, ps15, ps16, ps17, ps18, 
               ps19, ps20,ps21, ps22, ps23, ps24, ps25,ps26, ps27, ps28, ps29, ps30, ps31, ps32, ps33, ps34, ps35,
               ps36, ps37, ps38, ps39, ps40, ps41, out_name)
  
}

colnames(res) <- c("biom_10m_pl", "biom_11m_pl", "biom_12m_pl", "biom_13m_pl", "biom_14m_pl",
                   "biom_15m_pl", "biom_16m_pl", "biom_17m_pl", "biom_18m_pl", "biom_19m_pl", 
                   "biom_20m_pl", "biom_21m_pl", "biom_22m_pl", "biom_23m_pl", "biom_24m_pl", 
                   "biom_25m_pl", "biom_26m_pl", "biom_27m_pl", "biom_28m_pl", "biom_29m_pl", 
                   "biom_30m_pl", "biom_31m_pl", "biom_32m_pl", "biom_33m_pl", "biom_34m_pl", 
                   "biom_35m_pl", "biom_36m_pl", "biom_37m_pl", "biom_38m_pl", "biom_39m_pl", 
                   "biom_40m_pl", "biom_41m_pl", "biom_42m_pl", "biom_43m_pl", "biom_44m_pl",
                   "biom_45m_pl", "biom_46m_pl", "biom_47m_pl", "biom_48m_pl", "biom_49m_pl", 
                   "biom_50m_pl", "treatment")
head(res)

setwd(outp)
save(res, file = "Biom_ref_kiebu_6040_ran.RData")


