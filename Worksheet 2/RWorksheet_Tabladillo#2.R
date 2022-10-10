#Worksheet 2 
#TABLADILLO, QUENNIE R.

#1. Create a vector using : operator
#a. 	Sequence from -5 to 5. Write the R code and its output. Describe its output.
seq <- c(-5:5)
seq

#b.	x <- 1:7. What will be the value of x?
x <- 1:7
x

#2. Create a vector using seq() function
#a. seq(1, 3, by=0.2) # specify step size
         #Creating a Sequence of Numeric Values with the seq Function
seq(1,3)
seq(1,3,0.2)   #specifies that in every number you need to jump by 0.2
#The by argument
seq(1,3, by = 0.2) #sequence from 1 to 3 by 0.2


#3. . A factory has a census of its workers. There are 50 workers in total. 
factory_workers = c(34, 28, 22, 36, 27, 18, 52, 39, 42, 29, 35, 31, 27, 22, 37, 34, 19, 20, 57, 49, 50, 37, 46, 25, 17, 37, 43, 53, 41, 51, 35,
                     24,33, 41, 53, 40, 18, 44, 38, 41, 48, 27, 39, 19, 30, 61, 54, 58, 26,
                     18)
factory_workers
  #a.	Access 3rd element, what is the value?
print(factory_workers[3])
  #b.	Access 2nd and 4th element, what are the values?
print(factory_workers[2])
print(factory_workers[4])
  #c. Access all but the 1st element is not included. Write the R code and its output.
print(factory_workers[-1])

#4. Create a vector x <- c("first"=3, "second"=0, "third"=9). 
x <- c("first"=3, "second"=0, "third"=9)
names(x)
x[c("first", "third")]

#5. Create a sequence x from -3:2.
#a. Modify 2nd element and change it to 0;x[2] <- 0 x
x <- -3:2
x[2] <- 0 
x

#6. 
#a. Create a data frame for month, price per liter (php) and purchase-quantity (liter).Write the codes.
Month <- c("Jan", "Feb", "March", "Apr", "May", "June")
Price_per_liter_php <- c(52.50, 57.25, 60.00, 65.00, 74.25, 54.00)
Purchase_quantity_liter <- c(25, 30, 40, 50, 10, 45) 


data_frame <- data.frame(Month, Price_per_liter_php, Purchase_quantity_liter )
data_frame

#b.	What is the average fuel expenditure of Mr. Cruz from Jan to June? Note: Use weighted.mean(liter, purchase)
weighted.mean(Price_per_liter_php, Purchase_quantity_liter)


#7. R has actually lots of built-in datasets. 
#a.	Type “rivers” in your R console. Create a vector data with 7elements, containing the number of elements (length) in rivers, their sum (sum), mean (mean), median (median), variance (var) standard deviation (sd), minimum (min) and maximum (max).
data <- c(length(rivers), sum(rivers), mean(rivers), median(rivers), var(rivers),
          sd(rivers), min(rivers), max(rivers))
data


#8. 
#a. Create vectors according to the above table. Write the codes
PowerRanking <- (1:25);
CelebrityName <- c("Tom Cruise", "Rolling Stones", "Oprah Winfrey", "U2", 
                   "Tiger Woods", "Steven Spielberg", "Howard Stern", "50 Cent", "Cast of the sopranos",
                   "Dan Brown", "Bruce Springsteen", "Donald Trump", "Muhammad Ali", "Paul McCartney",
                   "George Lucas", "Elton John", "David Letterman", "Phil Mickelson", "J.K Rowling",
                   "Bradd Pitt", "Peter Jackson", "Dr. Phil McGraw", "Jay Lenon", "Celine Dion", "Kobe Bryant");
Pay <- c(67, 90, 225, 110, 90, 332, 302, 41, 52, 88, 55, 44, 55, 40,
         233, 34, 40, 47, 75, 25, 39, 45, 32, 40, 31);

Data_Ranking <- data.frame(PowerRanking, CelebrityName, Pay);
Data_Ranking

#b.	Modify the power ranking and pay of J.K. Rowling. Change power ranking to 15 and pay to 90. Write the codes and its output.
PowerRanking [19] <- 15
print (PowerRanking)

Pay [19] <- 90
print (Pay)
 

forbes_Ranking <- data.frame(PowerRanking, CelebrityName, Pay);
forbes_Ranking






