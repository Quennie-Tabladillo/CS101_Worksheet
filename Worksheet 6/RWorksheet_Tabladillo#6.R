#Worksheet 6
#Tabladillo, Quennie R.
#BSIT 2-A

library(ggplot2)
library(dplyr)
require(ggplot2)


data("mpg")
mpg

#1. How many columns are in mpg dataset? How about the number of rows? Show the
#codes and its result.

ncol(mpg)
nrow(mpg)

#ncol(mpg):  11
#nrow(mpg):  234

#2.Which manufacturer has the most models in this data set? Which model has the
#most variations?
#Manufacturer with the most models
data1 <- mpg %>% group_by(manufacturer) %>% count() 
data1
#Model with the most variations
data2 <- mpg %>% group_by(model) %>% count()
data2

#Ans: The manufacturer with the most models is "dodge" and the model with the most
#variations is the "caravan 2wd"

#a.Group the manufacturers and find the unique models. Copy the codes and result.
unique1 <- mpg %>% group_by(manufacturer, model) %>% distinct %>% count()
colnames(unique1) <- c("Manufacturer","Model","Counts")
unique1



#b.Graph the result by using plot() and ggplot(). Write the codes and its result

plot(unique1)
ggplot(unique1, aes(Model, Manufacturer)) + geom_point()

#3. Same dataset will be used. You are going to show the relationship of the 
#modeland the manufacturer

#a.What does ggplot(mpg, aes(model, manufacturer)) + geom_point() show?
ggplot(mpg, aes(model, manufacturer)) + geom_point()

#b.For you, is it useful? If not, how could you modify the data to make it more
#informative?

#Ans: The plot is not useful for a number of reasons
#Each dot represents a different manufacturer-model combination that we observe
#in the data.
#Some of the data is hidden as some manufacturer-model combinations appear
#more than once in the data (e.g. `audi a4 quattro`)

#4.Using the pipe (%>%), group the model and get the number of cars per model. [
#Show codes and its result
model <- mpg %>% group_by(model) %>% count()
model

colnames(model) <- c("Model","Counts")
model

#a.Plot using the geom_bar() + coord_flip() just like what is shown below. Show
#codes and its result
qplot(model,data = mpg,main = "Number of Cars
per Model", xlab = "Model",ylab = "Number
of Cars", geom = "bar", fill = manufacturer) +
  coord_flip()


#b.Use only the top 20 observations. Show code and results
topObserve <- mpg %>% group_by(model) %>% tally(sort = TRUE)
topObserve

ggplot(topObserve, aes(x = model, y = n, fill = "gray")) + 
  geom_bar(stat = "identity") + coord_flip()

#5. Plot the relationship between cyl - number of cylinders and displ - engine 
#displacement using geom_point with aesthetic colour = engine displacement. 
#Title should be “Relationship between No. of Cylinders and Engine Displacement”.

#a. Show the codes and its result.
ggplot(mpg, aes(x = displ, y = cyl)) + geom_point(aes(color = "engine displacement")) +
labs(title = "Relationship between No of Cylinders and Engine Displacement") + 
geom_jitter()

#b. How would you describe its relationship?
#As the number of  cylinder increases, the engine displacement also increases.

#6.Get the total number of observations for drv - type of drive train 
#(f = front-wheel drive,r = rear wheel drive, 4 = 4wd) and class - type of class 
#(Example: suv, 2seater, etc.).

#Plot using the geom_tile() where the number of observations for class be used as a
#fill for aesthetics.

#a. Show the codes and its result for the narrative in #6.
ggplot(mpg, aes(x = drv, y = class)) + geom_tile(aes(fill = class))

#b.Interpret the result.
#Ans: The suv are both under the 4 wheel drive and the rear wheel drive, while the subcompact,pick up, midsize and the compact fall under the 4 wheel drive only.
#The minivan fall under the front wheel drive and the 2seater fall under the rear wheel drive.

#7.  Discuss the difference between these codes. Its outputs for each are shown below.
#Code 1
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy, colour = "blue"))
#Code 2
ggplot(data = mpg) +
  geom_point(mapping = aes(x = displ, y = hwy), colour = "blue")

#Ans: The difference between the two codes are the color of the dots in the plot although, based on the two codes the colour that was declared was blue.

#8. Try to run the command ?mpg. What is the result of this command?
?mpg
#Ans: The result was the r documentation of a dataset about the fuel economy data from 1999 to 2008 for 38 popular models of car

#a.Which variables from mpg dataset are categorical?
#Ans: Categorical variables in mpg include: manufacturer, model, trans (type of transmission), drv (front-wheel drive, rear-wheel, 4wd), fl (fuel type), and class (type of car).

#b. Which are continuous variables?
#Ans: cty , city highway miles per gallon

#c. Plot the relationship between displ (engine displacement) and hwy(highway miles per gallon). Mapped
#it with a continuous variable you have identified in #5-b. What is its result? Why it produced such
#output?

ggplot(mpg, aes(x = displ, y = hwy, colour = cty)) + geom_point()

#Ans: The plot shows a negative relationship between engine size (displ) and fuel efficiency (hwy). In other words, cars with big engines use more fuel.

#9. Plot the relationship between displ(engine displacement) and hwy(highway miles per gallon) using
#geom_point(). Add a trend line over the existing plot using geom_smooth() with se = FALSE. Default
#method is “loess”.

ggplot(mpg, aes(x = displ, y = hwy)) +
  geom_point(aes(color=class)) +
  geom_smooth()


#10. Using the relationship of displ and hwy, add a trend line over existing plot. Set these = FALSE to
#remove the confidence interval and method = lm to check for linear modeling

ggplot(mpg, aes(x = displ, y = hwy, color = class)) + 
  geom_point(aes(color=class)) + 
  geom_smooth(se = FALSE)










