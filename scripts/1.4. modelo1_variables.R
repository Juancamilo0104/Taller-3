## MODELO 1 VARIABLES

library("tidyverse")
library("dplyr")
library("caret")
library("stargazer")

modelo1 <- as.formula ("price ~ city + surface1 + betrooms + bathrooms1 + property_type + 
                       dista_park + dista_bus + dista_salud + dista_policia + dista_banco + 
                       dista_bar + estrato + piso + ascensor + parqueadero")

# price: continua
# city: categórica
# surface1: continua
# betrooms: continua
# barthrooms1: continua
# property_type: categórica
# dista_park: continua
# dista_bus: continua
# dista_salud: continua
# dista_policia: continua
# dista_banco: continua
# dista_bar: continua
# estrato: categórica
# piso: categórica
# ascensor: categórica
# parqueadero: categórica



