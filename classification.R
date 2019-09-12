bodyMassIndexData <- read.csv("C:/Users/omerfarukkoc/Desktop/bodyMassIndexData.txt", sep=";")
summary(bodyMassIndexData)
View(bodyMassIndexData)

bodyMassIndexData = bodyMassIndexData[sample(nrow(bodyMassIndexData), size = 50),]

plot(bodyMassIndexData$Height,bodyMassIndexData$BodyMassIndex,pch=16)

model <- lm(bodyMassIndexData$Height ~ bodyMassIndexData$BodyMassIndex, bodyMassIndexData)
abline(model)


library(e1071)

model_svm <- svm(bodyMassIndexData$Height, ~ bodyMassIndexData$BodyMassIndex , bodyMassIndexData)

pred <- predict(model_svm, bodyMassIndexData)

points(bodyMassIndexData$Height, pred, col = "blue", pch=4)

df <- scale(bodyMassIndexData)
head(df, n = 3)
