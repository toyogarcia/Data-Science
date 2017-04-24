**QUESTION 1** 

Take a look at the ‘iris’ dataset that comes with R. The data can be loaded with the code:

library(datasets)

data(iris)

A description of the dataset can be found by running
?iris

There will be an object called ‘iris’ in your workspace. In this dataset, what is the mean of ‘Sepal.Length’ for the species virginica? Please round your answer to the nearest whole number.
(Only enter the numeric result and nothing else.)

**SOLUTION**

> round(mean(subset(iris, Species == "virginica", select = Sepal.Length)[,1]))

[1] 7

**QUESTION 2** 

Continuing with the ‘iris’ dataset from the previous Question, 
what R code returns a vector of the means of the variables ‘Sepal.Length’, ‘Sepal.Width’, ‘Petal.Length’, and ‘Petal.Width’?

**SOLUTION**

> sapply(iris[,1:4],mean)

Sepal.Length  Sepal.Width Petal.Length  Petal.Width

    5.843333     3.057333     3.758000     1.199333

**QUESTION 3** 

Load the ‘mtcars’ dataset in R with the following code

library(datasets)

data(mtcars)

There will be an object names ‘mtcars’ in your workspace. You can find some information about the dataset by running
?iris

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.

with(mtcars, tapply(mpg, cyl, mean))

sapply(split(mtcars$mpg, mtcars$cyl), mean)

tapply(mtcars$mpg, mtcars$cyl, mean)

**SOLUTION**

> with(mtcars, tapply(mpg, cyl, mean))

   4        6        8

26.66364 19.74286 15.10000

> sapply(split(mtcars$mpg, mtcars$cyl), mean)

   4        6        8

26.66364 19.74286 15.10000

> tapply(mtcars$mpg, mtcars$cyl, mean)

   4        6        8

26.66364 19.74286 15.10000

**QUESTION 4**

Continuing with the ‘mtcars’ dataset from the previous Question, 
what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)

**SOLUTION**

> round(abs(mean(mtcars$hp[mtcars$cyl==4]) - mean(mtcars$hp[mtcars$cyl==8])))

[1] 127

OR

> x <- tapply(mtcars$hp, mtcars$cyl, mean)

> round(abs(x[1] - x[3]))

  4
  127
