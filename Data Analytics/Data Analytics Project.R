EmployeeAttrition <- read.csv("MFG10YearTerminationData.csv")
summary(EmployeeAttrition)
# packages to get a better description and summary of the dataset
install.packages("plyr")
install.packages("dplyr")
library("plyr")
library("dplyr")
# summary of the dataset
summary(EmployeeAttrition)
View(EmployeeAttrition)
names(EmployeeAttrition)
# getting status count year wise
statuscount <- as.data.frame.matrix(EmployeeAttrition %>%
                                      group_by(STATUS_YEAR) %>%
                                      select(STATUS) %>%
                                      table())
statuscount
statuscount$Total <- statuscount$ACTIVE + statuscount$TERMINATED
statuscount$PercentTerminated <- statuscount$TERMINATED/(statuscount$Total)*100
statuscount
mean(statuscount$PercentTerminated)
# determining the business unit with greater Churn rate -
# lbrary for plots 
install.packages("ggplot2")
library(Rcpp)
library(ggplot2) 

ggplot() + geom_bar(aes(y = ..count..,x =as.factor(BUSINESS_UNIT),
                        fill = as.factor(STATUS)),data=EmployeeAttrition,
                    position = position_stack())
# determinig the churn rate with reason in each department 
# filtering data on the basis of STATUS = TERMINATED
ChurnData<- as.data.frame(EmployeeAttrition %>%
                                 filter(STATUS=="TERMINATED"))

ggplot() + geom_bar(aes(y = ..count..,x =as.factor(department_name),
                        fill = as.factor(termreason_desc)),data=ChurnData,
                    position = position_stack())+
  theme(axis.text.x=element_text(angle=90,hjust=1,vjust=0.5))

summary(EmployeeAttrition$age)
# anova testing start
anovadata <- EmployeeAttrition[,c(6,16,17)]
anovadata
# crating different age groups
agegroup <- cut(anovadata$age, breaks = c(18,29,39,49,59,69), labels = c("Agegroup1", 
                                                                         "Agegroup2", "Agegroup3", 
                                                                         "Agegroup4", "Agegroup5")
                , right= FALSE)
agegroup
anovadata <- data.frame(anovadata, agegroup)
anovadata
names(anovadata)
summary(anovadata)
anovadata <- anovadata[1:49653, -1]
View(anovadata)

avdata <- anovadata
# filtering data to get employees who have terminated
avdata<- as.data.frame(avdata %>%
                            filter(STATUS=="TERMINATED"))

View(avdata)
# grouping records on the basis of year
agegroupTotal <- as.data.frame.matrix(avdata %>%
                               group_by(avdata$STATUS_YEAR) %>%
                                 table())
                               
agegroupTotal
# selecting status year data grouped by age groups
agegroupTotal1 <- as.data.frame.matrix(avdata %>%
                                      group_by(agegroup) %>%
                                      select(STATUS_YEAR) %>%
                                      table())

agegroupTotal1


View(avdata)
View(agegroupTotal)
# creating dataset for Anova testing
newanovadata <- avdata
newanovadata <- newanovadata$agegroup
install.packages("data.table")
library(data.table)
agesplit <- c("agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5",
              "agegroup1", "agegroup2", "agegroup3", "agegroup4", "agegroup5"
              )
newanovadata <- as.data.table(agesplit)
View(newanovadata)
TotalTerminate <- c(agegroupTotal1$`2006`,agegroupTotal1$`2007`,agegroupTotal1$`2008`,
                    agegroupTotal1$`2009`, agegroupTotal1$`2010`,agegroupTotal1$`2011`,
                    agegroupTotal1$`2012`, agegroupTotal1$`2013`, agegroupTotal1$`2014`,
                    agegroupTotal1$`2015`)
TotalTerminate
newanovadata$TotalTerminate <-TotalTerminate 
TotalTerminate
# box plot of all age groups
boxplot(agegroupTotal, name = c("Agegroup1", "Agegroup2", "Agegroup3", "Agegroup4",
                                "Agegroup5"), xlab="Age Groups", ylab= "Termination count")

anova1 = aov(TotalTerminate~agesplit, data = newanovadata)
anova1
summary(anova1)
anova2= lm(TotalTerminate~agesplit)
summary(anova2)
# Hypothesis testing 1 -
## male and female have same attrition rate 
## null hypothesis µ0 = M = F
## Alternate hypothesis µ1 = M ??? F
col(EmployeeAttrition)
names(EmployeeAttrition)
# getting data for hypothesis testing 1
hypotest1 <- EmployeeAttrition[,c(13,16,17)]
summary(hypotest1)
View(hypotest1)
# getting the employess which have terminated
hypotest1 <- as.data.frame(hypotest1 %>%
                          filter(hypotest1$STATUS=="TERMINATED"))
View(hypotest1)
hypotest1total <- as.data.frame.matrix(hypotest1 %>%
                                        group_by(STATUS_YEAR) %>%
                                        select(gender_full) %>%
                                        table())
View(hypotest1total)
# getting serate attrition data for male and female employees
MaleTerminationCount <- c(hypotest1total$Male)
FemaleTerminationCount <- c(hypotest1total$Female)
MaleTerminationCount
FemaleTerminationCount
# box plot to show attrition of male and female employees
boxplot(hypotest1total, 
        names = c("MaleTerminationCount","FemaleTerminationCount"), 
        xlab="Gender", ylab="Termination Count")
Terminationdiff <- MaleTerminationCount - FemaleTerminationCount
install.packages("BSDA")
library(BSDA)
t.test(Terminationdiff, NULL, alternative = "two.sided",
       mu=0, sigma.x = sd(Terminationdiff), sigma.y = NULL, conf.level = 0.95)
## Hypothesis Testing 2 
# to determine how length of service affects the attrition rate taking 10 years as
# mid points to divide group
View(EmployeeAttrition)
summary(EmployeeAttrition$length_of_service)
names(EmployeeAttrition)
# extracting data for hypothesis testing 2
hypotest2 <- EmployeeAttrition[,c(7,16,17)]
View(hypotest2)
# crating different groups for length of service
lengthofservicegrp <- cut(hypotest2$length_of_service, breaks = c(0,11,30),
                          labels = c("smallservicelen","lengthyservicelen") 
                  , right= FALSE)
View(hypotest2)
hypotest2 <- data.frame(hypotest2, lengthofservicegrp)
names(hypotest2)
hypotest2 <- hypotest2[1:49653, -1]
View(hypotest2)
# getting employess who are terminated
hypotest2 <- as.data.frame(hypotest2 %>%
                             filter(hypotest2$STATUS=="TERMINATED"))
hypotest2total <- as.data.frame.matrix(hypotest2 %>%
                                         group_by(STATUS_YEAR) %>%
                                         select(lengthofservicegrp) %>%
                                         table())
View(hypotest2total)
# separating data for lenghty ans small length of service
LengthyserTermination <- c(hypotest2total$lengthyservicelen)
SmallserTermination <- c(hypotest2total$smallservicelen)
LengthyserTermination
SmallserTermination
# box plot to show small service length and lengthy length of service attrition
boxplot(hypotest2total, 
        names = c("smallServiceLength","LengthyServiceLength"), 
        xlab="Service Length", ylab="Termination Count")
Termination2diff <- SmallserTermination - LengthyserTermination
t.test(Termination2diff, NULL, alternative = "two.sided",
       mu=0, sigma.x = sd(Termination2diff), sigma.y = NULL, conf.level = 0.95)

## Classification models -
install.packages("magrittr")
library(magrittr)
names(EmployeeAttrition)
mydata <- EmployeeAttrition[c(6,7,13,16,17,18)]
View(mydata)
install.packages("rattle")
install.packages("https://cran.r-project.org/bin/windows/contrib/3.3/RGtk2_2.20.31.zip", repos=NULL)
library(rattle)
crv$seed <- 2
set.seed(crv$seed)
train.data = subset(mydata,STATUS_YEAR<=2014)
test.date = subset(mydata,STATUS_YEAR== 2015)
#Logistic Regression model -
Lmodel = glm(STATUS~., data = train.data, family = binomial)
summary(Lmodel)
# removing Job Title 
names(train.data)
train.data <- train.data[1:34757, -3]
test.date <- test.date[1:4961, -3]
Lmodel = glm(STATUS~., data = train.data, family = binomial)
summary(Lmodel)
# removing city name 
names(train.data)
train.data <- train.data[1:34757, -3]
test.date <- test.date[1:4961, -3]
Lmodel = glm(STATUS~., data = train.data, family = binomial)
summary(Lmodel)
# removing department
names(train.data)
train.data <- train.data[1:34757, -3]
test.date <- test.date[1:4961, -3]
Lmodel = glm(STATUS~., data = train.data, family = binomial)
summary(Lmodel)
# Confusion matrix 
install.packages("ROCR")
install.packages("gplots")
library(ROCR)
res <- predict(Lmodel, train.data, type = "response")
ROCRPred = prediction(res, train.data$STATUS)
ROCRPref = performance(ROCRPred, "tpr", "fpr")
plot(ROCRPref, colorize= TRUE, print.cutoffs.at= seq(0.1, by=0.1))
#table(Actualvalue= test.date$STATUS, Predictedvalue= res>0.3)
MYpr <- as.vector(ifelse(predict(Lmodel, type="response", 
                                 newdata=test.date) > 0.3, 
                         "TERMINATED", "ACTIVE"))
table(Actualvalue = test.date$STATUS, MYpr, dnn = c("Actual", "Predicted"))
install.packages("caret")
library(caret)
confusionMatrix(table(MYpr, test.date$STATUS))
## random forest 
install.packages("randomForest")
library(randomForest)
set.seed(crv$seed)
RFmodel = randomForest(train.data$STATUS~. , data= train.data, 
                       ntree= 500, mtry=3)
RFmodel
importance(RFmodel)
RFpred <- predict(RFmodel, newdata = test.date, type = "class")
RFpred
confusionMatrix(table(RFpred, test.date$STATUS))
install.packages("caret")
library(caret)
table(Actualvalue = test.date$STATUS, RFpred, dnn = c("Actual", "Predicted"))
table(na.omit(test.date$STATUS), RFpred, dnn = c("Actual", "Predicted"))
#Naive Bayes classification Model
set.seed(crv$seed)
install.packages("e1071")
library(e1071)
NBmodel <- naiveBayes(train.data$STATUS~., data= train.data)
NBmodel
NBpred <- predict(NBmodel, test.date)
confusionMatrix(table(NBpred, test.date$STATUS))
NBpred <- predict(NBmodel,test.date,type= "raw")
#Second Attempt 
names(EmployeeAttrition)
mydata <- EmployeeAttrition[c(6,7,9,13,16,17,18)]
train.data = subset(mydata,STATUS_YEAR<=2014)
test.date = subset(mydata,STATUS_YEAR== 2015)
set.seed(crv$seed)
NBmodel<- naiveBayes(train.data$STATUS~., data = train.data)
NBmodel
NBpred <- predict(NBmodel, test.date)
confusionMatrix(table(NBpred, test.date$STATUS))
NBpred <- predict(NBmodel,test.date,type= "raw")
