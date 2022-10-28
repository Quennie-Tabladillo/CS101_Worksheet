#VERSICOLOR

data("iris")
iris

#Subset the iris set into 3 files per species
subset(iris, Species == "versicolor")

#Get total mean for each species (Versicolor)
totalMean <- c(mean1,mean2,mean3,mean4)
totalMean
mean(totalMean)

#Get the mean of each characteristics of the species
mean1 <- iris$Sepal.Length[51:100]
mean2 <- iris$Sepal.Width[51:100]
mean3 <- iris$Petal.Length[51:100]
mean4 <- iris$Petal.Width[51:100]


mean(mean1)
mean(mean2)
mean(mean3)
mean(mean4)























