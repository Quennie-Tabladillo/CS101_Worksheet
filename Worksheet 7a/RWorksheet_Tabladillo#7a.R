#CS - 101 R PROGRAMMING
#TABLADILLO, QUENNIE R.
#BSIT 2-A
#WORKSHEET 7a


#1. Create a data frame for the table below.
Student_Scores <- data.frame(
  Student = c(1:10),
  Pre_test = c(55,54,47,57,51,61,57,54,63,58),
  Post_test = c(61,60,56,63,56,63,59,56,62,61)
)
Student_Scores

#a. Compute the descriptive statistics using different packages (Hmisc and pastecs).
#Write the codes and its result.
library(Hmisc)
library(pastecs)

describe(Student_Scores)

stat.desc(Student_Scores)

#2.The Department of Agriculture was studying the effects of several levels of a
#fertilizer on the growth of a plant. For some analyses, it might be useful to convert
#the fertilizer levels to an ordered factor.

#a. the data were 10,10,10, 20,20,50,10,20,10,50,20,50,20,10.

fertilizer <- c(10,10,10,20,20,50,10,
                20,10,50,20,50,20,10)

fertilizer_factor <- factor(fertilizer, ordered = TRUE)
fertilizer_factor

#3. Abdul Hassan, president of Floor Coverings Unlimited, has asked you to study
#the exercise levels undertaken by 10 num3 were “l”, “n”, “n”, “i”, “l” ,
#“l”, “n”, “n”, “i”, “l” ; n=none, l=light, i=intense

#a. What is the best way to represent this in R?

exercise_levels <- c("l","n","n","i","l","l","n","n","i","l")

data.frame(exercise_levels)

#4.Sample of 30 tax accountants from all the states and territories of Australia and
#their individual state of origin is specified by a character vector of state mnemonics
#as:
 
 state <- c("tas", "sa", "qld", "nsw", "nsw", "nt", "wa", "wa", "qld",
             "vic", "nsw", "vic", "qld", "qld", "sa", "tas", "sa", "nt",
             "wa", "vic", "qld", "nsw", "nsw", "wa", "sa", "act", "nsw",
             "vic", "vic", "act")

#a. Apply the factor function and factor level. Describe the results.
 australia <- factor(state)
 australia

 #5.From #4 - continuation:
 #Suppose we have the incomes of the same tax accountants in another vector (in
#suitably large units of money)

 incomes <- c(60, 49, 40, 61, 64, 60, 59, 54,
             62, 69, 70, 42, 56, 61, 61, 61, 58, 51, 48,
             65, 49, 49, 41, 48, 52, 46, 59, 46, 58, 43)

#a.Calculate the sample mean income for each state we can now use the special 
#function tapply():
 
sample_5 <- tapply(incomes, state, mean)
sample_5 

#b.Copy the results and interpret
#results
#act       nsw       nt      qld       sa      tas      vic       wa 
#44.50000  57.33333 55.50000 53.60000 55.00000 60.50000 56.00000 52.25000 
#the results shows the mean of every level of income for each state.

#6. Calculate the standard errors of the state income means (refer again to number 3)

#a. What is the standard error? Write the codes.
standard_err.n <- length(sample_5)
standard_err.sd <- sd(sample_5)
standard_err.se <- standard_err.sd/sqrt(standard_err.n)
standard_err.se

#b. Interpret the result
#This is how I get the state income means by dividing the sd() to sqrt() or length() 
#and that is how I get the standard errors of the state income means and this was 
#the result.


#7. Use the titanic dataset

#a.Subset the titanic dataset of those who survived and not survived. Show the
#codes and its result.

data("Titanic")
Titanic <- data.frame(Titanic)

survived <- subset(Titanic, Survived == "Yes")
survived

not_survived <- subset(Titanic, Survived == "No")
not_survived

#8.The data sets are about the breast cancer Wisconsin. The samples arrive
#periodically as Dr. Wolberg reports his clinical cases. The database therefore
#reflects this chronological grouping of the data.
#You can create this dataset in Microsoft Excel.

#a.describe what is the dataset all about.
#Answer: The dataset is all about the breast cancer Wisconsin.

#b.Import the data from MS Excel.Copy the codes.

library("readxl")

Breast_cancer <- read_excel("E:/CS 101/Worksheet 7a/Breast_Cancer.xlsx")

#c. Compute the descriptive statistics using different packages. Find the values of:
#c.1 Standard error of the mean for clump thickness.
Breast_cancerc1.n <- length(Breast_cancer$'CL. thickness')
Breast_cancerc1.sd <- sd(Breast_cancer$'CL. thickness')
Breast_cancerc1.se <- Breast_cancerc1.sd/sqrt(Breast_cancer$'CL. thickness')
Breast_cancerc1.se

#c.2 Coefficient of variability for Marginal Adhesion.

sd(Breast_cancer$`Marg. Adhesion`) / mean(Breast_cancer$`Marg. Adhesion`) * 100

#c.3 Number of null values of Bare Nuclei

Breast_cancerc3 <- subset(Breast_cancer,`Bare. Nuclei` == "NA")
Breast_cancerc3

#c.4 Mean and standard deviation for Bland Chromatin
mean(Breast_cancer$'Bl. Cromatin')
sd(Breast_cancer$'Bl. Cromatin')

#c.5 Confidence interval of the mean for Uniformity of Cell Shape
#Calculate the mean
breast_cancerc5 <- mean(Breast_cancer$`Cell Shape`)
breast_cancerc5

#Calculate the standard error of the mean
numA <- length(Breast_cancer$`Cell Shape`)
numB <- sd(Breast_cancer$`Cell Shape`)
numC <- numB/sqrt(numA)
numC

#Find the t-score that corresponds to the confidence level
numD = 0.05
numE = numA - 1
numF = qt(p=numD/2, df=numE,lower.tail=F)
numF

#Constructing the confidence interval
numG <- numF * numC
numG
#Lower
numH <- breast_cancerc5 - numG
numH
#Upper
numI <- breast_cancerc5 + numG
numI

c(numH,numI)

#d. How many attributes?
attributes(Breast_cancer)

#e. Find the percentage of respondents who are malignant. Interpret the results.

cancer <- subset(Breast_cancer, Class == "malignant")
cancer

17 / 49 * 100

#There are 34.69388 or 35% of respondents who are malignant.

#9.Export the data abalone to the Microsoft excel file. Copy the codes

install.packages("AppliedPredictiveModeling")
library("AppliedPredictiveModeling")
data(abalone)
view(abalone)
head(abalone)
summary(abalone)

#exporting the data abalone

library(xlsx)

write.xlsx("abalone","C:\\Users\\Quennie\\Documents\\abalone.xlsx")























































































