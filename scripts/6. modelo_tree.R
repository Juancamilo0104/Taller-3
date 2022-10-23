## MODELO TREE

library(pacman)
p_load(tidyverse, ggplot2, doParallel, rattle, MLmetrics,
       janitor, fastDummies, tidymodels, caret)

library(rpart)
tree <- rpart (modelo1, data=training, method  = "anova")

library(rpart.plot)
rpart.plot::prp(tree$finalModel)

plot(tree)


pred_tree <- predict(tree,testing)






# así aparece en árbol de clasificación en la complementaria

modelo1 <- decision_tree() %>%
  set_engine("rpart") %>%
  set_mode("classification")


# así aparece en árbol de clasificación en las diapositivas

#?rpart
#install.packages("rpart")
#cp alpha<-seq(from = 0, to = 0.1, length = 10)
set.seed(1410)
tree <- train(modelo1,
  data = training,
  method = "rpart",
  trControl = ctrl,
  parms=list(split='Gini'),
  #tuneGrid = expand.grid(cp = cp alpha)#,
  tuneLength=200,
  #preProcess = c("center", "scale")
)






