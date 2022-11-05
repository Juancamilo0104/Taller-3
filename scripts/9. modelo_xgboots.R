## MODELO XGBOOTS







# clase Ignacio

require("xgboost")
grid_default <- expand.grid(nrounds = c(250,500),
                            max_depth = c(4,6,8),
                            eta = c(0.01,0.3,0.5),
                            gamma = c(0,1),
                            min_child_weight = c(10, 25,50),
                            colsample_bytree = c(0.7),
                            subsample = c(0.6))


set.seed(1410)
xgboost <- train(
  Default ~amount+installment+age+ historygood + historypoor + purposeusedcar+ purposegoods.repair + purposeedu + foreigngerman + rentTRUE,
  data = upSampledTrain,
  method = "xgbTree",
  trControl = ctrl,
  metric = "Sens",
  tuneGrid = grid_default,
  preProcess = c("center", "scale")
)

xgboost

pred_xgb<-predict(xgboost,testing)
confusionMatrix(testing$Default,pred_xgb)

