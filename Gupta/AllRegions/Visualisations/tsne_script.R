
#setwd('/afs/inf.ed.ac.uk/user/s17/s1725186/Documents/Preprocessing/Gupta/AllRegions/Visualisations')

library(tidyverse) ; library(Rtsne)

load('./../Data/preprocessed_data.RData')
datExpr = datExpr %>% data.frame
DE_info = DE_info %>% data.frame

perplexities = rev(c(1,2,5,10,15,20,50,70,100))

for(i in 1:length(perplexities)){
  print(paste0('Calculating t-SNE with perplexity = ', perplexities[i]))
  set.seed(123)
  tsne = datExpr %>% Rtsne(perplexity=perplexities[i])
  tsne_coords = cbind(tsne$Y, rownames(datExpr))
  colnames(tsne_coords) = c('C1','C2','ID')
  write.csv(tsne_coords, paste0('./tsne_perplexity_',perplexities[i],'.csv'), row.names=F)
}
