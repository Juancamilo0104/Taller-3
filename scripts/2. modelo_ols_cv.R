## MODELO OLS_CV

library("tidyverse")
library("dplyr")
library("caret")
library("stargazer")

set.seed(123)
ols < -lm(modelo1,data=training)
summary(ols)
testing$ols <- predict(ols,newdata = testing)
with(testing,mean((price-ols)^2))

# otra forma
set.seed(123)
ols <- train(
  modelo1,
  data = training,
  method = "lm",
  trControl = ctrl,
  preProcess = c("center", "scale")
)

# predicción dentro de muestra (testing)
pred_ols_in <- predict(ols , testing)

# predicción fuera de muestra (en test)
pred_ols_out <- predict(ols , test)

### 

# ols con cv

set.seed(123)
ols_cv <- train(modelo1,
              data = training,
              trControl=trainControl(method="cv",number=5),
              na.action  = na.pass,
              method="lm")
summary(ols_cv)
stargazer(ols_cv,type="text")

testing$ols_cv <- predict(ols_cv,newdata = testing)
with(testing,mean((price-ols_cv)^2))

# predicción dentro de muestra (testing)
pred_ols_cv_in <- predict(ols_cv , testing)

# predicción fuera de muestra (en test)
pred_ols_cv_out <- predict(ols_cv , test)











