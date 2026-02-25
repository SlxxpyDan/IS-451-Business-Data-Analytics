#VECTOR

xNum<- c(1, 3.14159, 5, 7)
xNum

xLogic<- c(TRUE, FALSE, TRUE)
xLogic

xNum<- c(xNum, 100, 200)
xNum

xNum<- c(-1, xNum)
xNum

xNum<- c(xNum, TRUE,FALSE)
xNum
#true is converted to 1 and false is converted to zero
#converted logic to numerical

xMix<- c(1,2,3, "a")
xMix
#numerics converted to characters because it's mixed with even one character

#MATH ON VECTORS
x<- c(2,4,6,8)
x+1
x*pi
x+x
x*x

#LENGTH
length(x) #four values

#GENERATING REGULAR SEQUENCES
#1:30 is the vector c(1,2,...,29,30)
1:30
xSeq<- 1:10
xSeq
10:1
x<- 10:-3
x
x<- 10:12.4 #goes to the closest whole value
x

#INDEXING A VECTOR: SELECTING SUBSETS OF A DATA SET
#Basic indexing uses a set of integers to select postions:
xNum<- c(1,3,5,7,11,100)
xNum
xNum[2]
xNum[2:4] #returning the second, 3rd, 4th value
xNum[c(1,3,6)]
#Variables can be used
myStart<- 4
xNum[myStart]

#NEGATIVE INDEXING
#when we want to omit a variable from a vector and return everything else
xSeq
xSeq[-5] 
xSeq[-5:-7]

#INDEXING W/ LOGIC VALUES (TRUE, FALSE)
#Logic values of TRUE and FALSE can be used to select items:
xNum
xNum[c(TRUE,TRUE,FALSE,FALSE,FALSE,TRUE)] #same length

xSeq<- 1:6
xSeq
xSeq >3
xSeq[xSeq>3]
xSeq[xSeq>=2]
xSeq[xSeq!=5]
xSeq ==1
xSeq != 1

#PRACTICE
#create a vector with some (at least 3) of your friend's names
fname = c("Nouryani","Maddie","AC","Matthew")
fname

#get the length of the above vector
length(fname)

#get the first two friends from the above vector
fname[1:2] #alt: fname[c(1,2)]

#get the second and third friends
fname[2:3] #alt: fname[c(2,3)]

#DATA FRAME
#variables of a data set as columns and the observations as rows
#session - set working directory - rstudio
x.df <- read.csv("toy_example.csv")

#elements of the data frame can be referenced by specifying the row and
#the column index in single !*square brackets*!
x.df[2,1]
x.df[1,2]
x.df[2,] #all of row 2
x.df[,1] #all of column 1
x.df[2:3,] #this is selecting the row bc column is blank
x.df[2:3] #automatically goes to column and not row
x.df[,2:3] #this is selecting the column bc row is blank
#[row,column] recommended usage
#[sth] -> stands for column
x.df[3,]

#indexing by using column names
x.df[,1]
x.df[2:3,]
x.df[, "xNum"]
x.df[2:3, c("xNum", "xLog")] #indexing multiple columns with names

#short cut using $ sign if your columns have names
x.df$xNum #equivalent to x.df[,"xNum]
x.df$xChar

#useful dataframe fucntions
View(x.df) #shows all the data in a new tab
head(x.df) #shows the first 6 rows
tail(x.df) #shows the last 6 rows
names(x.df) #showing the column names
dim(x.df) #number of rows and columns
nrow(x.df) #number of rows
ncol(x.df) #number of columns
str(x.df) #structure of data frame - name, type and preview of data in each column
summary(x.df) #finds summary statistics, mainly used for numeric

#ARITHMETIC FUNCTIONS
#log, exp, sqrt all have their usual meanings

#max(), min() selects the largest and smallest elements
a<- c(1,2,3,4)
min(a)
x.df$xNum
max(x.df$xNum)

#sum() gives the total of the elements in x, mean(x) calculates the mean
sum(a)
mean(a)

#CLASS EXERCISES

#if you wanted to assign variables to the values
col<- ncol(iris)
row<- nrow(iris)

#get the last 2 rows in last 2 columns from iris data frame
iris[(nrow(iris)-1):nrow(iris),(ncol(iris)-1):ncol(iris)]

#find out the average Petal length over all the observation
names(iris) #to find column names
petal_length<- iris$Petal.Length
petal_length
mean(petal_length)

#Find observations whose species are "versicolor"
names(iris)
versicolor<- iris$Species


#List the sepal widths of all "versicolor"s



