#Worksheet-3a in R
#Tabladillo,Quennie R.

#Using Vectors
#1. There is a built-in vector LETTERS contains the uppercase letters of the alphabet and letters which contains the lowercase letters of the alphabet.
LETTERS <- c("A","B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S","T", "U", "V", "W", "X", "Y", "Z")
letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
#Based on the above vector LETTERS:
#a. You need to produce a vector that contains the first 11 letters.
LETTERS <- c("A","B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S","T", "U", "V", "W", "X", "Y", "Z")
LETTERS [1:11]

#b. Produce a vector that contains the odd numbered letters.
LETTERS <- c("A","B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S","T", "U", "V", "W", "X", "Y", "Z")
odd_LETTERS <- c(LETTERS[1:26 %% 2 !=0])
odd_LETTERS

#c. Produce a vector that contains the vowels
LETTERS <- c("A","B","C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S","T", "U", "V", "W", "X", "Y", "Z")
vowels_LETTERS <- c(LETTERS[c(1,5,9,15,21)])
vowels_LETTERS


#Based on the above vector letters:
#d. Produce a vector that contains the last 5 lowercase letters
letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
letters [22:26]

#e. Produce a vector that contains letters between 15 to 24 letters in lowercase.
letters <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")
letters [15:24]

#2. Create a vector with the average temperatures in April for Tuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City. The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
#a.	What is the R code and its result for creating a character vector for the city/town ofTuguegarao City, Manila, Iloilo City, Tacloban, Samal Island, and Davao City? Name the object as city. The names should follow the same order as in the instruction.
City <- c("Tuguegarao City", "Manila", "Iloilo City", "Tacloban", "Samal Island", "Davao City")
City

#b.	The average temperatures in Celcius are 42, 39, 34, 34, 30, and 27 degrees.
temp <- c(42,39,34,34,30,27)
temp

#c.	Associate the temperature temp with the city by using names() function. What is the R code and its result?
City =c("Tuguegarao City", "Manila", "Iloilo City", "Tacloban", "Samal Island", "Davao City")
temp <- c(42,39,34,34,30,27)
names(temp) <- City
temp
 
#d. From the answer in c, what is the content of index 5 and index 6? What is its R code?
temp <- c(42,39,34,34,30,27)
temp[5:6]


#Using Matrices
#2. Create a matrix of one to eight and eleven to fourteen with four columns and three rows.
#a. What will be the R code for the #2 question and its result?
x2 <- matrix(data = c(1:8,11:14), nrow = 3, ncol = 4)
x2

#b.Multiply the matrix by two. What is its R code and its result?
x2*2

#c. what is the content of row 2? What is its R code?
x2[2,]

#d. What will be the R code if you want to display the column 3 and column 4 in row 1 and row 2? What is its Output?
x2[c(1,2),c(3,4)]

#e. What is the Rcode if you want to display only the columns in 2 and 3,row? What is its output?
x2[c(3),c(2,3)]

#f. What is the R code if you want to display only the columns 4? What is the output?
x2[,4]

#g. Name the rows as isa,dalawa,tatlo and column as uno,dos,tres,quatro for the matrix that was created in b. What is its R code and corresponding output?
dimnames(x2) <- list(c("isa","dalawa","tatlo"),c("uno","dos","tres","quatro"))
x2

#h. From the original matrix you have created in a, reshape the matrix by assigning a new dimension with dim().New dimensions should have 2 columns and 6 rows. What will be the R code amd its output?
dim(x2) <- c(6,2)
x2

#Using Arrays
#An Array contains 1,2,3,6,7,8,9,0,3,4,5,1
#a.Create an array for the above numeric values. Each values will be repeated twice.What will be the R code if you are to create a three-dimensional array with 4 columns and 2 rows. What will be its output?
array <- c(1,2,3,6,7,8,9,0,3,4,5,1)
array

value <- array(rep(array, 2),dim = c(2,4,3))
value

#b. How many dimensions do your array have?
dim(x2)

#c.	Name the rows as lowercase letters and columns as uppercase letters starting fromthe A. The array names should be “1st-Dimensional Array”, “2nd-Dimentional Array”, and “3rd-Dimensional Array”. What will be the R codes and its output?
dimnames(value) <- list(letters[1:2], LETTERS[1:4], c("1st-Dimensional Array", "2nd-Dimentional Array", "3rd-Dimensional Array"))
value




