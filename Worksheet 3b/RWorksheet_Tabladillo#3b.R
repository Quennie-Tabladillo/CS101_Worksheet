#Worksheet 3b
#TABLADILLO, QUENNIE R. 

library(dplyr)
library(tidyverse)

#1.Create a data frame using the table below.
#a.Write the codes.

People <- data.frame(
  Respondents = c(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20),
  Sex = c(2,2,1,2,2,2,2,2,2,2,1,2,2,2,2,2,2,2,1,2),
  Fathers_Occupation = c(1,3,3,3,1,2,3,1,1,1,3,2,1,3,3,1,3,1,2,1),
  Persons_at_Home = c(5,7,3,8,5,9,6,7,8,4,7,5,4,7,8,8,3,11,7,6),
  Siblings_at_School = c(6,4,4,1,2,1,5,3,1,2,3,2,5,5,2,1,2,5,3,2),
  Types_of_Houses = c(1,2,3,1,1,3,3,1,2,3,2,3,2,2,3,3,3,3,3,2)
)
People

#b.Describe the data.Get the summary of the data.
summary(People)

#c.Is the mean number of siblings attending is 5?
#Answer: No

#d.Extract the 1st two rows and then all the columns using the
#subsetting functions.
#Write the codes and its output.
Respondents <- subset(People[1:2, 1:6, drop = FALSE])
Respondents

#e.Extract 3rd and 5th row with 2nd and 4th column. Write the codes and its
#result.
Respondents <- subset(People[c(3,5),c(2,4)])
Respondents

#f.Select the variable types of houses then store the vector that results as 
#types_houses.
#Write the codes.
Types_of_Houses <- People[c(6)]
type_houses <- Types_of_Houses
type_houses

#g.Select only all Males respondent that their father occupation was farmer. 
#Write the codes and its output.
subset(People, Sex == 1, select = c(Sex, Fathers_Occupation == 1, c(Sex)))

#h.Select only all females respondent that have greater than or equal to 5 
#number of siblings attending school. Write the codes and its outputs
Sex <- subset(People[c(1:20), c(2,5)])
girl <- Sex[People$Siblings_at_School >= 5 ,]
girl

#2.Write a R program to create an empty data frame.
df = data.frame(Ints=integer(),
                Doubles=double(), Characters=character(),
                Logicals=logical(),
                Factors=factor(),
                stringsAsFactors=FALSE)
print("Structure of the empty dataframe:")
print(str(df))
#a.Describe the results.
#The resulting data frame has 0 observations, 5 variables, and each of the
#variables are five different classes.

#3.Interpret the graph
#The graph is about the sentiments about former US President Donald Trump.
#The data gathered was the positive, negative and the neutral 
#sentiments about him. The data also includes the dates and the number of
#sentiments per day.




















