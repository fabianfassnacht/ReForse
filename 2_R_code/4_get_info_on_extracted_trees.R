setwd("E:/KIT_Forschung/26_sim_LiDAR/1_LiDAR_trees/1_final_trees_study")

load("tree_infos.RData")

head(tree_h)




beech <- tree_h[tree_h$species=="beech",]
pine <- tree_h[tree_h$species=="pine",]

min(beech$max_height)
min(pine$max_height)


pdf(file="overview_trees.pdf", width=7, height=10)
par(mfrow=c(3,2))
hist(beech$max_cr_dia)
hist(beech$max_height)
hist(pine$max_cr_dia)
hist(pine$max_height)

plot(beech$max_cr_dia, beech$max_height)
plot(pine$max_cr_dia, pine$max_height)
dev.off()