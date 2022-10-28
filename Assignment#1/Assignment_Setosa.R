#Assignment #1 

#SETOSA

data("iris")
iris

#Subset the iris set into 3 files per species
subset(iris, Species == "setosa")[1:50,]


#Get total mean for each species 
totalMean <- c(mean1,mean2,mean3,mean4)
totalMean
mean(totalMean)

#Get the mean of each characteristics of the species

mean1 <- iris$Sepal.Length[1:50]
mean2 <- iris$Sepal.Width[1:50]
mean3 <- iris$Petal.Length[1:50]
mean4 <- iris$Petal.Width[1:50]






