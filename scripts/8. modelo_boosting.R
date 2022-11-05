## MODELO BOOSTING


tunegrid_gbm <- expand.grid(learn_rate = c(0.1, 0.01, 0.001),
                            ntrees = 50,
                            max_depth = 2,
                            col_sample_rate = 1,
                            min_rows = 70) 


# Inicializamos el modelo
library(h2o)
# YO le voy a poner 10 nucleos porque los tengo. Si usted tiene menos o más, pues cambie el parámetro
h2o.init(nthreads = 10)

# Esta suele ser demorada
set.seed(666)
library(caret)
modelo3 <- train(wage ~ .,
                 data = train_df, 
                 method = "gbm_h2o", 
                 trControl = cv3,
                 metric = 'RMSE', 
                 tuneGrid = tunegrid_gbm) 






