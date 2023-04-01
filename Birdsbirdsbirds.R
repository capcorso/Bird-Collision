# title: Corso Bird Collision Exploration
# author: Julianna 
# output: html_document

#' Load Data 
#' 
library(readr)
library(ggplot2)
url <- "https://raw.githubusercontent.com/conradcd/ACC_Bird_Strikes/master/1991-2017_date.csv"
data <- read_csv(url)

# How many entries are there 
n_rows <- nrow(data)
cat("Number of data entries:", n_rows)

#  9080 data entries 

# List Species 
species_list = data$Species_Abv
list(species_list)

#' cleaning data 
#' 
# species count 
count_species = table(species_list)
sort(count_species)

species_list
# Look at distribution 
pie(count_species)



# Making a chart of the top 10 species with the most collisions 



#' Differentiate between Deceased and Survivors 
# 
# Where survivors = Released, self-release, NR/ Released
# Deceased = Euthanized, died, NR/ Euhanized 



# sp_count <- table(data$Species)

# sp_percent <- round(prop.table(sp_count) * 100, 2)

# top_sp <- names(sort(sp_count, decreasing = TRUE)[1:10])

# data_sub <- data[data$Species %in% top_sp,]

# sp_df <- as.data.frame(sp_count)

# colnames(sp_df) <- c("how_obtained_code", "frequency")

# sp_df$percentage <- sp_percent

# top_sp_df <- sp_df[sp_df$how_obtained_code %in% top_sp,]

# PLOTTTTT
ggplot(top_sp_df, aes(x = reorder(how_obtained_code, -frequency), y = percentage)) +
  geom_bar(stat = "identity") +
  xlab(" ") +
  ylab("%") +
  ggtitle("Top 10 Species with most collisions")

#Okay that looks good but change it from scientific name to species code/ abreviation 
# instead of species column Species_Abv 

sp_count <- table(data$Species_Abv)

sp_percent <- round(prop.table(sp_count) * 100, 2)

top_sp <- names(sort(sp_count, decreasing = TRUE)[1:10])

data_sub <- data[data$Species_Abv %in% top_sp,]

sp_df <- as.data.frame(sp_count)

colnames(sp_df) <- c("how_obtained_code", "frequency")

sp_df$percentage <- sp_percent

top_sp_df <- sp_df[sp_df$how_obtained_code %in% top_sp,]

# PLOTTTTT
ggplot(top_sp_df, aes(x = reorder(how_obtained_code, -frequency), y = percentage)) +
  geom_bar(stat = "identity") +
  xlab(" ") +
  ylab("%") +
  ggtitle("Top 10 Species with most collisions")


# Lookkkk at that! 

# Next renaming to be common name instead of species code


# RTHA red tailed Hawk 

# BDOW Barred Owl 

# EASO Eastern Screech Owl 

# GHOW Great Horned Owl 

# OSPR  Osprey 

# RSHA Res-Shouldered Hawk 

# COHA Cooper's Hawk

# MIKI Mississippi Kite 

# TUVU Turkey Vulture 

# BAEA Bald Eagle 







# Not finished, idea line -- 
# merge tool 
Outcome = c()
for(i in seq(1, nrow(data))){
  if(data$Survive[i]=="Died" | data$survive[i]=="Euthanized" | data$Survive[i]=="DIED" | data$Survive[i]=="NR/EUTHANIZED" | data$Survive[i]=="NR/DIED" | data$Survive[i]=="TRANSFERRED/EUTHANIZED" | data$Survive[i]=="TRANSFERRED/DIED") {
    Outcome[i] = 0
  }
  else if(data$Survive[i]== "Released" | data$Survive[i]=="Self-Release" | data$Survive[i]=="RELEASED" | data$Survive[i]=="NR/RELEASED") {
    Outcome[i] = 1
  }
}

          
                                                                                              

