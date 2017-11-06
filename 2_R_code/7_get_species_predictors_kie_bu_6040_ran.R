setwd("E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands_species/Kiefer_Buche/60-40/random_planted")

fils <- list.files(pattern = "med3.tif$")


outp <- "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_species_predictors/Kiefer_Buche/60-40/random_planted"
in_path <- "E:/KIT_Forschung/26_sim_LiDAR/3_simulated_stands_species/Kiefer_Buche/60-40/random_planted"

#i=10
#path_to_txt <- fils[10]
#plot_size=10 
#hor_shift=0 
#ver_shift=0
#sil_size=70




#####################
## 10 m plots



spec_preds_10m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=10, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_10m[[i]] <- preds
  
}

spec_preds_10m_f <- do.call(rbind, spec_preds_10m)
setwd(outp)
save(spec_preds_10m_f, file="spec_preds_10m_f.RData")

#head(spec_preds_10m_f)

#####################
## 11 m plots



spec_preds_11m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=11, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_11m[[i]] <- preds
  
}

spec_preds_11m_f <- do.call(rbind, spec_preds_11m)
setwd(outp)
save(spec_preds_11m_f, file="spec_preds_11m_f.RData")

#####################
## 12 m plots



spec_preds_12m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=12, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_12m[[i]] <- preds
  
}

spec_preds_12m_f <- do.call(rbind, spec_preds_12m)
setwd(outp)
save(spec_preds_12m_f, file="spec_preds_12m_f.RData")

#####################
## 13 m plots



spec_preds_13m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=13, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_13m[[i]] <- preds
  
}

spec_preds_13m_f <- do.call(rbind, spec_preds_13m)
setwd(outp)
save(spec_preds_13m_f, file="spec_preds_13m_f.RData")

#####################
## 14 m plots



spec_preds_14m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=14, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_14m[[i]] <- preds
  
}

spec_preds_14m_f <- do.call(rbind, spec_preds_14m)
setwd(outp)
save(spec_preds_14m_f, file="spec_preds_14m_f.RData")

#####################
## 15 m plots



spec_preds_15m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=15, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_15m[[i]] <- preds
  
}

spec_preds_15m_f <- do.call(rbind, spec_preds_15m)
setwd(outp)
save(spec_preds_15m_f, file="spec_preds_15m_f.RData")

#####################
## 16 m plots



spec_preds_16m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=16, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_16m[[i]] <- preds
  
}

spec_preds_16m_f <- do.call(rbind, spec_preds_16m)
setwd(outp)
save(spec_preds_16m_f, file="spec_preds_16m_f.RData")

#####################
## 17 m plots



spec_preds_17m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=17, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_17m[[i]] <- preds
  
}

spec_preds_17m_f <- do.call(rbind, spec_preds_17m)
setwd(outp)
save(spec_preds_17m_f, file="spec_preds_17m_f.RData")

#####################
## 18 m plots



spec_preds_18m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=18, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_18m[[i]] <- preds
  
}

spec_preds_18m_f <- do.call(rbind, spec_preds_18m)
setwd(outp)
save(spec_preds_18m_f, file="spec_preds_18m_f.RData")

#####################
## 19 m plots



spec_preds_19m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=19, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_19m[[i]] <- preds
  
}

spec_preds_19m_f <- do.call(rbind, spec_preds_19m)
setwd(outp)
save(spec_preds_19m_f, file="spec_preds_19m_f.RData")




#####################
## 20 m plots


spec_preds_20m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=20, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_20m[[i]] <- preds
  
}

spec_preds_20m_f <- do.call(rbind, spec_preds_20m)
setwd(outp)
save(spec_preds_20m_f, file="spec_preds_20m_f.RData")


#####################
## 21 m plots



spec_preds_21m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=21, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_21m[[i]] <- preds
  
}

spec_preds_21m_f <- do.call(rbind, spec_preds_21m)
setwd(outp)
save(spec_preds_21m_f, file="spec_preds_21m_f.RData")

#####################
## 12 m plots



spec_preds_22m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=22, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_22m[[i]] <- preds
  
}

spec_preds_22m_f <- do.call(rbind, spec_preds_22m)
setwd(outp)
save(spec_preds_22m_f, file="spec_preds_22m_f.RData")

#####################
## 23 m plots



spec_preds_23m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=23, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_23m[[i]] <- preds
  
}

spec_preds_23m_f <- do.call(rbind, spec_preds_23m)
setwd(outp)
save(spec_preds_23m_f, file="spec_preds_23m_f.RData")

#####################
## 24 m plots



spec_preds_24m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=24, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_24m[[i]] <- preds
  
}

spec_preds_24m_f <- do.call(rbind, spec_preds_24m)
setwd(outp)
save(spec_preds_24m_f, file="spec_preds_24m_f.RData")

#####################
## 25 m plots



spec_preds_25m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=25, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_25m[[i]] <- preds
  
}

spec_preds_25m_f <- do.call(rbind, spec_preds_25m)
setwd(outp)
save(spec_preds_25m_f, file="spec_preds_25m_f.RData")

#####################
## 26 m plots



spec_preds_26m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=26, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_26m[[i]] <- preds
  
}

spec_preds_26m_f <- do.call(rbind, spec_preds_26m)
setwd(outp)
save(spec_preds_26m_f, file="spec_preds_26m_f.RData")

#####################
## 27 m plots



spec_preds_27m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=27, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_27m[[i]] <- preds
  
}

spec_preds_27m_f <- do.call(rbind, spec_preds_27m)
setwd(outp)
save(spec_preds_27m_f, file="spec_preds_27m_f.RData")

#####################
## 28 m plots



spec_preds_28m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=28, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_28m[[i]] <- preds
  
}

spec_preds_28m_f <- do.call(rbind, spec_preds_28m)
setwd(outp)
save(spec_preds_28m_f, file="spec_preds_28m_f.RData")

#####################
## 29 m plots



spec_preds_29m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=29, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_29m[[i]] <- preds
  
}

spec_preds_29m_f <- do.call(rbind, spec_preds_29m)
setwd(outp)
save(spec_preds_29m_f, file="spec_preds_29m_f.RData")



#####################
## 30 m plots


spec_preds_30m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=30, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_30m[[i]] <- preds
  
}

spec_preds_30m_f <- do.call(rbind, spec_preds_30m)
setwd(outp)
save(spec_preds_30m_f, file="spec_preds_30m_f.RData")

#####################
## 11 m plots



spec_preds_31m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=31, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_31m[[i]] <- preds
  
}

spec_preds_31m_f <- do.call(rbind, spec_preds_31m)
setwd(outp)
save(spec_preds_31m_f, file="spec_preds_31m_f.RData")

#####################
## 32 m plots



spec_preds_32m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=32, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_32m[[i]] <- preds
  
}

spec_preds_32m_f <- do.call(rbind, spec_preds_32m)
setwd(outp)
save(spec_preds_32m_f, file="spec_preds_32m_f.RData")

#####################
## 33 m plots



spec_preds_33m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=33, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_33m[[i]] <- preds
  
}

spec_preds_33m_f <- do.call(rbind, spec_preds_33m)
setwd(outp)
save(spec_preds_33m_f, file="spec_preds_33m_f.RData")

#####################
## 34 m plots



spec_preds_34m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=34, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_34m[[i]] <- preds
  
}

spec_preds_34m_f <- do.call(rbind, spec_preds_34m)
setwd(outp)
save(spec_preds_34m_f, file="spec_preds_34m_f.RData")

#####################
## 35 m plots



spec_preds_35m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=35, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_35m[[i]] <- preds
  
}

spec_preds_35m_f <- do.call(rbind, spec_preds_35m)
setwd(outp)
save(spec_preds_35m_f, file="spec_preds_35m_f.RData")

#####################
## 36 m plots



spec_preds_36m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=36, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_36m[[i]] <- preds
  
}

spec_preds_36m_f <- do.call(rbind, spec_preds_36m)
setwd(outp)
save(spec_preds_36m_f, file="spec_preds_36m_f.RData")

#####################
## 37 m plots



spec_preds_37m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=37, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_37m[[i]] <- preds
  
}

spec_preds_37m_f <- do.call(rbind, spec_preds_37m)
setwd(outp)
save(spec_preds_37m_f, file="spec_preds_37m_f.RData")

#####################
## 38 m plots



spec_preds_38m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=38, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_38m[[i]] <- preds
  
}

spec_preds_38m_f <- do.call(rbind, spec_preds_38m)
setwd(outp)
save(spec_preds_38m_f, file="spec_preds_38m_f.RData")

#####################
## 39 m plots



spec_preds_39m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=39, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_39m[[i]] <- preds
  
}

spec_preds_39m_f <- do.call(rbind, spec_preds_39m)
setwd(outp)
save(spec_preds_39m_f, file="spec_preds_39m_f.RData")



#####################
## 40 m plots


spec_preds_40m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=40, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_40m[[i]] <- preds
  
}

spec_preds_40m_f <- do.call(rbind, spec_preds_40m)
setwd(outp)
save(spec_preds_40m_f, file="spec_preds_40m_f.RData")

#####################
## 41 m plots



spec_preds_41m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=41, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_41m[[i]] <- preds
  
}

spec_preds_41m_f <- do.call(rbind, spec_preds_41m)
setwd(outp)
save(spec_preds_41m_f, file="spec_preds_41m_f.RData")

#####################
## 42 m plots



spec_preds_42m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=42, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_42m[[i]] <- preds
  
}

spec_preds_42m_f <- do.call(rbind, spec_preds_42m)
setwd(outp)
save(spec_preds_42m_f, file="spec_preds_42m_f.RData")

#####################
## 43 m plots



spec_preds_43m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=43, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_43m[[i]] <- preds
  
}

spec_preds_43m_f <- do.call(rbind, spec_preds_43m)
setwd(outp)
save(spec_preds_43m_f, file="spec_preds_43m_f.RData")

#####################
## 44 m plots



spec_preds_44m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=44, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_44m[[i]] <- preds
  
}

spec_preds_44m_f <- do.call(rbind, spec_preds_44m)
setwd(outp)
save(spec_preds_44m_f, file="spec_preds_44m_f.RData")

#####################
## 45 m plots



spec_preds_45m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=45, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_45m[[i]] <- preds
  
}

spec_preds_45m_f <- do.call(rbind, spec_preds_45m)
setwd(outp)
save(spec_preds_45m_f, file="spec_preds_45m_f.RData")

#####################
## 46 m plots



spec_preds_46m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=46, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_46m[[i]] <- preds
  
}

spec_preds_46m_f <- do.call(rbind, spec_preds_46m)
setwd(outp)
save(spec_preds_46m_f, file="spec_preds_46m_f.RData")

#####################
## 47 m plots



spec_preds_47m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=47, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_47m[[i]] <- preds
  
}

spec_preds_47m_f <- do.call(rbind, spec_preds_47m)
setwd(outp)
save(spec_preds_47m_f, file="spec_preds_47m_f.RData")

#####################
## 48 m plots



spec_preds_48m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=48, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_48m[[i]] <- preds
  
}

spec_preds_48m_f <- do.call(rbind, spec_preds_48m)
setwd(outp)
save(spec_preds_48m_f, file="spec_preds_48m_f.RData")

#####################
## 49 m plots



spec_preds_49m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=49, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_49m[[i]] <- preds
  
}

spec_preds_49m_f <- do.call(rbind, spec_preds_49m)
setwd(outp)
save(spec_preds_49m_f, file="spec_preds_49m_f.RData")



#####################
## 50 m plots


spec_preds_50m <- list()

for (i in 1:length(fils)) {
  
  preds <-get_species_preds(fils[i], in_path = in_path,  plot_size=50, hor_shift=0, ver_shift=0, sil_size=70)
  spec_preds_50m[[i]] <- preds
  
}

spec_preds_50m_f <- do.call(rbind, spec_preds_50m)
setwd(outp)
save(spec_preds_50m_f, file="spec_preds_50m_f.RData")