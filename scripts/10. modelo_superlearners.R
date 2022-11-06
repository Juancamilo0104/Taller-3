## MODELO SUPERLERNERS






# complementaria


# Cargar e instalar paquetes
library(pacman)
p_load(tidyverse, SuperLearner, caret, glmnet, randomForest, RhpcBLASctl, MLmetrics)

# Ajustamos el CV del SuperLearner
# Vamos a usar 3 folds por temas computacionales
# pero deberíamos usar algo alrededor de 20.
X_train2 <- data.frame(scale(X_train))
set.seed(666)
cv_sl = CV.SuperLearner(Y = y_train, X = X_train2, 
                        family = binomial(), 
                        cvControl = list(V = 10),
                        SL.library = c("SL.mean", "SL.glmnet", "SL.rf.better", 
                                       "SL.lm"),
                        control = list(saveFitLibrary = T))
summary(cv_sl)


# clase Ignacio

require("tidyverse")
require("ranger")
require("SuperLearner")
# set the seed for reproducibility
set.seed(123)
# generate the observed data
n = 1000
x = runif(n, 0, 8)
y = 5 + 4 * sqrt(9 * x) * as.numeric(x <
                                       2) + as.numeric(x >= 2) * (abs(x - 6)^(2)) +
  rlaplace(n)
D <- data.frame(x, y) # observed data

xl <- seq(0, 8, 0.1)
yl <- 5 + 4 * sqrt(9 * xl) * as.numeric(xl <
                                          2) + as.numeric(xl >= 2) * (abs(xl -
                                                                            6)^(2))
Dl <- data.frame(xl, yl) # for plotting the true data

# Specify the number of folds for
# V-fold cross-validation
folds = 5
## split data into 5 groups for 5-fold
## cross-validation we do this here so
## that the exact same folds will be
## used in both the SL fit with the R
## package, and the hand coded SL
index <- split(1:1000, 1:folds)
splt <- lapply(1:folds, function(ind) D[index[[ind]], ])

# view the first 6 observations in the # first [[1]] and second [[2]] folds
head(splt[[1]])
head(splt[[2]])


# Fit using the SuperLearner package,
# specify outcome for prediction
# (y), the predictors (x), the loss
# function (L2), the library
# (sl.lib), and number of folds
fitY <- SuperLearner(Y = y, X = data.frame(x),
                     method = "method.NNLS", SL.library = c("SL.lm", "SL.ranger"),
                     cvControl = list(V = folds, validRows = index))
# View the output: 'Risk' column
# returns the CV-MSE estimates
# 'Coef' column gives the weights for the final SuperLearner
# (meta-learner)
fitY

# Now predict the outcome for all
# possible x
yS <- predict(fitY, newdata = data.frame(x = xl),onlySL = T)$pred
# Create a dataframe of all x
# and predicted SL responses
Dl1 <- data.frame(xl, yS)

head(Dl1)





