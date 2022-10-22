## MODELO OLS_CV

library("tidyverse")
library("dplyr")
library("caret")
library("stargazer")

set.seed(123)
ols < -lm(modelo1,data=train)
test$ols <- predict(ols,newdata = test)
with(test,mean((price-ols)^2))

# otra forma
ols <- train(
  modelo1,
  data = train,
  method = "lm",
  trControl = ctrl,
  preProcess = c("center", "scale")
)
pred_ols <- predict(ols , testing)

# cv
set.seed(123)
ols_cv <- train(modelo1,
              data = train,
              trControl=trainControl(method="cv",number=5),
              na.action  = na.pass,
              method="lm")
summary(ols_cv)
stargazer(ols_cv,type="text")

test$ols_cv <- predict(ols_cv,newdata = test)
with(test,mean((price-ols_cv)^2))












