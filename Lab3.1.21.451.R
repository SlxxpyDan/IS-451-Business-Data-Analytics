library(ggplot2)

ggplot(data = mpg) + geom_bar(aes(x = class))
ggplot(data = mpg) + geom_bar(aes(x = class, y = hwy),
                              stat = "summary", fun = "mean")

mower.df <- read.csv("RidingMowers.csv") #different than what she did bc I have a diff version
ggplot(data = mower.df) + geom_bar(aes(x = Ownership, y = Income),
                                   stat = "summary", fun = "mean")

ggplot(data = mpg) + geom_boxplot(aes(x = class, y = hwy))

#A
house.df <- read.csv("BostonHousing.csv")
names(house.df)
ggplot(data = house.df) + geom_point(aes(x = LSTAT, y = MEDV))

#B
ggplot(data = boston.df) + geom_bar(aes(x = factor(CHAS), y = MEDV),
                                    stat = "summary", fun = "mean")


#C
ggplot(data = boston.df) + geom_boxplot(aes(x = factor(CHAS), y = MEDV))

#1
#Variables are: RM and MEDV
ggplot(data = boston.df)+geom_point(aes(x = RM, y = MEDV)) +
  labs(
    title = "Number of Rooms vs Median House Value",
    x = "Number of Rooms (RM)",
    y = "Median House Value (MEDV)"
  )
#true

#2 #USE BOX INSTEAD
#Variables are: CHAS and MEDV
ggplot(data = boston.df) + geom_bar(aes(x = factor(CHAS), y = MEDV),
                                    stat = "summary", fun = "mean")
#partially

#3 #you can use scatter
#Variables are: PTRATIO and MEDV
ggplot(data = boston.df)+geom_point(aes(x = PTRATIO, y = MEDV))
#false

#4
#Variables are: ZN and MEDV
ggplot(data = boston.df)+geom_point(aes(x = ZN, y = MEDV))
#false

#5
#Variables are: AGE and MEDV
ggplot(data = boston.df)+geom_point(aes(x = AGE, y = MEDV))
#incorrect


