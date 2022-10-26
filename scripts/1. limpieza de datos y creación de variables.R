# LIMPIEZA DE DATOS Y CREACIÓN DE VARIABLES
rm(list = ls())

# instalar y cargar paquetes

install.packages("pacman") 
library(pacman)
library(here)

# cargar bases 

train <- readRDS(here("C:/Users/MIGUEL  CONTRERAS/Desktop/Taller-3-BDML/stores/train.Rds"))
test <- readRDS(here("C:/Users/MIGUEL  CONTRERAS/Desktop/Taller-3-BDML/stores/test.Rds"))

# inspeccionar las bases

View(train)
View(test)
head(train)
head(test)
colnames(train)
colnames(test)
skim(train)
skim(test)


# partir la base train en training y testiing, luego se evalúa dentro de muestra (sobre la de testing) y fuera de muestra (test)






