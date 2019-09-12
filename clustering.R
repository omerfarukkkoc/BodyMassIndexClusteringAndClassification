install.packages("animation")
install.packages("factoextra")

bodyMassIndexData <- read.csv("C:/Users/omerfarukkoc/Desktop/bodyMassIndexData.txt", sep=";")
summary(bodyMassIndexData)
View(bodyMassIndexData)

bodyMassIndexDataKlon = bodyMassIndexData
bodyMassIndexData[,"HealthRate"] =NULL

df <- scale(bodyMassIndexData)
head(df, n = 3)

cluster1 <- kmeans(bodyMassIndexData,3)
head(cbind(bodyMassIndexData, cluster = cluster1$cluster))
table(cluster1$cluster, bodyMassIndexDataKlon$HealthRate)
library(factoextra)
fviz_cluster(cluster1, data = df)
cluster1$cluster <- as.factor(cluster1$cluster)
library(ggplot2)
ggplot(bodyMassIndexData, aes(bodyMassIndexData$Height, bodyMassIndexData$Weight, color = cluster1$cluster)) + geom_point()


library(animation)
cluster2 <- kmeans.ani(bodyMassIndexData,4)
#aggregate(bodyMassIndexData, by=list(cluster=cluster2$cluster), mean)
head(cbind(bodyMassIndexData, cluster = cluster2$cluster))
table(cluster2$cluster, bodyMassIndexDataKlon$HealthRate)



