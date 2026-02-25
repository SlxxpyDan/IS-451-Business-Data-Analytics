#HW 3

#1
phone <- read.csv("phone_sale.csv")

phone$Phone_sale <- ifelse(phone$Phone_sale == "Yes", 1, 0)

phone$Any_cc_miles_12mo <- factor(ifelse(phone$Any_cc_miles_12mo == 1, "Y", "N"), levels = c("Y", "N"))

#2
phone <- phone[, c("Bonus_trans", "Any_cc_miles_12mo", "Phone_sale")]

#3 (generated with the seed 111 for 60% training vs. 40% validation)
load("a3_TrainIndex.rda")
ls()
train.df <- phone[train.index, ]
valid.df <- phone[-train.index, ]

logit.reg <- glm(Phone_sale ~ Bonus_trans + Any_cc_miles_12mo,
                 data = train.df, family = "binomial")

#4
summary(logit.reg)

#6
Q6 <- data.frame(Bonus_trans = 50,
                 Any_cc_miles_12mo = factor("Y", levels = c("Y", "N")))
predict(logit.reg, newdata = Q6, type = "response")

#7
library(caret)
Q7.prob <- predict(logit.reg, newdata = valid.df, type = "response")
Q7.class <- ifelse(Q7.prob >= 0.5, 1, 0)

confusionMatrix(factor(Q7.class), factor(valid.df$Phone_sale), positive = "1")

#9
# cutoff = 0.3
Q7.class.03 <- ifelse(Q7.prob >= 0.3, 1, 0)
confusionMatrix(factor(Q7.class.03), factor(valid.df$Phone_sale), positive = "1")

# cutoff = 0.1
Q7.class.01 <- ifelse(Q7.prob >= 0.1, 1, 0)
confusionMatrix(factor(Q7.class.01), factor(valid.df$Phone_sale), positive = "1")