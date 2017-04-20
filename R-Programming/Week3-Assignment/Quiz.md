**1.** Take a look at the �iris� dataset that comes with R. The data can be loaded with the code:

library(datasets)

data(iris)

A description of the dataset can be found by running
?iris

There will be an object called �iris� in your workspace. In this dataset, what is the mean of �Sepal.Length� for the species virginica? Please round your answer to the nearest whole number.
(Only enter the numeric result and nothing else.)

**2.** Continuing with the �iris� dataset from the previous Question, 
what R code returns a vector of the means of the variables �Sepal.Length�, �Sepal.Width�, �Petal.Length�, and �Petal.Width�?

**3.** Load the �mtcars� dataset in R with the following code

library(datasets)

data(mtcars)

There will be an object names �mtcars� in your workspace. You can find some information about the dataset by running
?iris

How can one calculate the average miles per gallon (mpg) by number of cylinders in the car (cyl)? Select all that apply.
	with(mtcars, tapply(mpg, cyl, mean))
    	sapply(split(mtcarsmpg,mtcars, cyl), mean)
	tapply(mtcarsmpg,mtcars, cyl, mean)

**4.** Continuing with the �mtcars� dataset from the previous Question, 
what is the absolute difference between the average horsepower of 4-cylinder cars and the average horsepower of 8-cylinder cars?
(Please round your final answer to the nearest whole number. Only enter the numeric result and nothing else.)

**5.** If you run

debug(ls)

What happens when you next call the �ls� function?
