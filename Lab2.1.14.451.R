#FACTORS
#reminder that c is used to generate a vector or data set

gender <- c("Male", "Male", "Female", "Female", "Male")
gender

#converting the variable of gender to a factor
factor(gender)

#for human readability, labeling
factor_gender <- factor(gender)

#levels, defines the options
levels(factor_gender)

#summary
summary(gender)
summary(factor_gender)

#TOY EXAMPLE
x.df <- read.csv("toy_example.csv" ,stringsAsFactors = TRUE)

#GGPLOT
library(ggplot2) #every time when you need to use it

#visualization
#ggplot(data = mpg) this makes the base of the scatter plot
head(mpg)
ggplot(data = mpg)+geom_point(aes(x=hwy, y = cty))
View(mpg)



