#Worksheet 1, Tabladillo, Quennie BSIT 2-A

#1.
age <- c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 42, 53, 41, 51, 35, 24, 33, 41)
df <- data.frame(Data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3, 2.5, 2.3, 2.4, 2.7))

#2. Find the reciprocal of the values for age.
reciprocal <- function(age) vec <- 1/age
rage <- reciprocal(age)
rage

#3.Assign also new_age<- c(age, 0, age).
#what happen to the new_age?
new_age <- c(age, 0, age)
new_age

#4.Sort the values for age.
sort(age)

#5.Find the minimum and maximum value for age.
max(age)
min(age)

#6.Set up a vector named data, consisting of 2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,
#2.5, 2.3, 2.4, and 2.7.
Data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,2.5,2.3, 2.4,2.7)

#7.Generates a new vector for data where you double every value of the data. What happen to the data?
Data <- c(2.4, 2.8, 2.1, 2.5, 2.4, 2.2, 2.5, 2.3,2.5,2.3, 2.4,2.7)
2*Data

#8.Generate a sequence for the following scenario:
#8.1 integers from 1 to 100
seq(1:100)
#8.2Numbers from 20 to 60
seq(20,60)
length(seq(20,60))
#8.3 Mean of numbers from 20 to 60
x<- 20,60
print(mean(20,60))
#8.4 Sum of numbers from 51 to 91
print(sum(51:91))
#8.5 Integers from 1 to 1,000
seq(1:1000)
#A. there are 43 data points in 8.1 to 8.4
#B.Write the r code and output from 8.1 to 8.4
seq(20,60)
print(mean(20,60))
print(sum(51:91))
#C. for 8.5 find only maximumdata points until 10
m<- seq(1:10)
max(m)

#9. Print a vector with the integers between 1 and 100 that are not divisible by 3, 5 and 7 using filter option
Filter(function(i) { all(i %% c(3,5,7) != 0) }, seq(100))

#10. Generate a sequence backwards of the integers from 1 to 100
seq(from = 100, to = 1)

#11. 	List all the natural numbers below 25 that are multiples of 3 or 5.
sum((1:25)[((1:25)%%3 == 0) | ((1:25)%%5 == 0)])

#12. Enter this statement: { x <- 0+ x + 5 + }
{ x <- 0+ x + 5 + }

#13. Set up a vector named score, consisting of 72, 86, 92, 63, 88, 89, 91, 92, 75, 75 and 77. To access individual elements of an atomic vector, one generally uses the x[i] construction.
#Find x[2] and x[3]. 
score <-c(72, 86, 92, 63, 88, 89, 91, 92, 75,75, 77)

#14.Create a vector a = c(1,2,NA,4,NA,6,7).
a <- c(1,2,NA,4,NA,6,7)
print(a,na.print="-999")

#15. 	A special type of function calls can appear on the left hand side of the assignment operator as in > class(x) <- "foo".
class(x) <- "foo"
name = readline(prompt="Input your name: ")
age = readline(prompt="Input your age: ")
print(paste("My name is",name, "and I am",age ,"years old."))
print(R.version.string)

