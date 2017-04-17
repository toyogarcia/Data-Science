# Question 1
R was developed by statisticians working at...

## Answer
The University of Auckland

# Question 2
The definition of free software consists of four freedoms (freedoms 0 through 3). Which of the following is NOT one of the freedoms that are part of the definition?

## Answer
The freedom to sell the software for any price.

# Question 3
In R the following are all atomic data types EXCEPT

## Answer
matrix

# Question 4
If I execute the expression x <- 4 in R, what is the class of the object 'x' as determined by the `class()' function?

## Answer
numeric

> x <- 4

> class(x)

[1] "numeric"

# Question 5
What is the class of the object defined by x <- c(4, TRUE)?

## Answer
numeric

> x <- c(4, TRUE)

> class(x)

[1] "numeric"

# Question 6
If I have two vectors x <- c(1,3, 5) and y <- c(3, 2, 10), what is produced by the expression cbind(x, y)?

## Answer
a 3 by 2 numeric matrix

> x <- c(1,3, 5)
> y <- c(3, 2, 10)
> cbind(x, y)
     x  y
[1,] 1  3
[2,] 3  2
[3,] 5 10

# Question 7
A key property of vectors in R is that

## Answer
elements of a vector all must be of the same class

# Question 8
Suppose I have a list defined as x <- list(2, "a", "b", TRUE). What does x[[1]] give me?

## Answer
a numeric vector containing the element 2

> x <- list(2, "a", "b", TRUE)
> x[[1]]
[1] 2
> class(x[[1]])
[1] "numeric"

# Question 9
Suppose I have a vector x <- 1:4 and a vector y <- 2. What is produced by the expression x + y?

## Answer
a numeric vector with elements 3, 4, 5, 6.

> x <- 1:4
> y <- 2
> x + y
[1] 3 4 5 6
> class(x + y)
[1] "numeric"

# Question 10
Suppose I have a vector x <- c(17, 14, 4, 5, 13, 12, 10) and I want to set all elements of this vector that are greater than 10 to be equal to 4. What R code achieves this?

## Answer
x[x >= 11] <- 4
> x <- c(17, 14, 4, 5, 13, 12, 10)
> x[x >= 11] <- 4
> x
[1]  4  4  4  5  4  4 10

# Question 11
In the dataset provided for this Quiz, what are the column names of the dataset?

## Answer
Ozone, Solar.R, Wind, Temp, Month, Day

> hw1 = read.csv('hw1_data.csv')
> names(hw1)
[1] "Ozone"   "Solar.R" "Wind"    "Temp"    "Month"   "Day"

# Question 12
Extract the first 2 rows of the data frame and print them to the console. What does the output look like?

## Answer
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

> hw1 = read.csv('hw1_data.csv')
> hw1[c(1,2),]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

OR

> head(hw1,2)
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

OR

> hw1[1:2,]
  Ozone Solar.R Wind Temp Month Day
1    41     190  7.4   67     5   1
2    36     118  8.0   72     5   2

# Question 13
How many observations (i.e. rows) are in this data frame?

## Answer
153

> hw1 = read.csv('hw1_data.csv')
> nrow(hw1)
[1] 153

# Question 14
Extract the last 2 rows of the data frame and print them to the console. What does the output look like?

## Answer
   Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

> hw1 = read.csv('hw1_data.csv')
> tail(hw1,2)
    Ozone Solar.R Wind Temp Month Day
152    18     131  8.0   76     9  29
153    20     223 11.5   68     9  30

# Question 15
What is the value of Ozone in the 47th row?

## Answer
21

> hw1 = read.csv('hw1_data.csv')
> hw1[47,1]
[1] 21

# Question 16
How many missing values are in the Ozone column of this data frame?

## Answer
37

> hw1 = read.csv('hw1_data.csv')
> nrow(hw1[is.na(hw1[,1]),])
[1] 37

# Question 17
What is the mean of the Ozone column in this dataset? Exclude missing values (coded as NA) from this calculation.

## Answer
42.1

> hw1 = read.csv('hw1_data.csv')
> Oz <- hw1[!is.na(hw1[,1]),]
> mean(Oz[,1])
[1] 42.12931

# Question 18
Extract the subset of rows of the data frame where Ozone values are above 31 and Temp values are above 90. What is the mean of Solar.R in this subset?

## Answer
212.8

> hw1 <- read.csv("C:/Coursera/Data Science/2.- R Programming/Week 1/Exercises/hw1_data.csv", header=TRUE)
> cchw1 <- hw1[complete.cases(hw1),]
> mean(cchw1[cchw1[,1] > 31 & cchw1[,4] > 90, 2])
[1] 212.8

# Question 19
What is the mean of "Temp" when "Month" is equal to 6?

## Answer
79.1
Explanation

> hw1 = read.csv('hw1_data.csv')
> sub = subset(hw1, Month == 6, select = Temp)
> apply(sub, 2, mean)
Temp 
79.1

# Question 20
What was the maximum ozone value in the month of May (i.e. Month = 5)?

## Answer
115

Explantion
> hw1 = read.csv('hw1_data.csv')
> sub = subset(hw1, Month == 5 & !is.na(Ozone), select = Ozone)
> apply(sub, 2, max)

Ozone 
  115
