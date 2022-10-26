## MODELO RANDOM FOREST

install.packages("randomForest")
library(randomForest)
library(caret)

tunegrid_rf <- expand.grid(mtry = c(3, 5, 10), 
                           min.node.size = c(10, 30, 50,
                                             70, 100),
                           splitrule = "variance")

forest <- train(wage ~ .,
                 data = train_df, 
                 method = "ranger", 
                 trControl = cv5,
                 metric = 'RMSE', 
                 tuneGrid = tunegrid_rf)

# Comando automático (a mi no me gusta)
plot(forest)




