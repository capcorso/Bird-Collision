# title: Corso Bird Collision Exploration
# author: Julianna 
# output: html_document

#' Load Data 
#' 
library(readr)

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


#' Differentiate between Deceased and Survivors 
# 
# Where survivors = Released, self-release, NR/ Released
# Deceased = Euthanized, died, NR/ Euhanized 

Outcome = c()
for(i in seq(1, nrow(data))){
  if(data$Survive[i]=="Died" | data$survive[i]=="Euthanized" | data$Survive[i]=="DIED" | data$Survive[i]=="NR/EUTHANIZED" | data$Survive[i]=="NR/DIED" | data$Survive[i]=="TRANSFERRED/EUTHANIZED" | data$Survive[i]=="TRANSFERRED/DIED") {
    Outcome[i] = 0
  }
  else if(data$Survive[i]== "Released" | data$Survive[i]=="Self-Release" | data$Survive[i]=="RELEASED" | data$Survive[i]=="NR/RELEASED") {
    Outcome[i] = 1
  }
}

Error in if (data$Disposition[i] == "Died" | data$Disposition[i] == "Euthanized" |  : 
             missing value where TRUE/FALSE needed
             
             # 
             Outcome = c()
             for(i in seq(1, nrow(data))){
               if(data$Survive[i]=="Died" | data$survive[i]=="Euthanized" | data$Survive[i]=="DIED" | data$Survive[i]=="NR/EUTHANIZED" | data$Survive[i]=="NR/DIED" | data$Survive[i]=="TRANSFERRED/EUTHANIZED" | data$Survive[i]=="TRANSFERRED/DIED") {
                 Outcome[i] = 0
               }
               else if(data$Survive[i]== "Released" | data$Survive[i]=="Self-Release" | data$Survive[i]=="RELEASED" | data$Survive[i]=="NR/RELEASED") {
                 Outcome[i] = 1
               }
             }
             
             
             
             #trying to rename/ nickname the abreviated species names 
             
             data$Common.Species.Name <- ifelse(data$Species_Abv == "RTHA", "Red-Tailed Hawk", data$Common.Species.Name)
             count.fields("Red-Tailed Hawk")
             
             for(i in seq(1, nrow(data)))  {
               else if(data$Species_Abv == "GHOW")
                 data$Common.Species.Name = "Great Horned Owl"
          
                                                                                              

