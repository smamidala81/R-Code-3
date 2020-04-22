# Joins (Merge) data frames (inner, outer, right,left)

df1<-data.frame(customerid=c(1:6),product=c(rep('oven',3), rep('television',3)))
df1
df2<-data.frame(customerid=c(2,4,6,7),state=c(rep('california',3), rep('texas',1)))
df2               

# Inner Join

?merge
df<-merge(x=df1,y=df2,by='customerid')
df

# Outer Join
df<-merge(x=df1,y=df2,by='customerid',all=T)
df

# Left outer join
df<-merge(x=df1,y=df2,by='customerid',all.x = T)
df

# right outer join
df<-merge(x=df1,y=df2,by='customerid',all.y = T)
df

# Apply

?apply
x<-matrix(rnorm(30),nrow = 5,ncol = 6)
x
apply(x,1,sum)
apply(x,2,sum)

# lapply

A<-matrix(1:9,3,3)
A
B<-matrix(4:15,4,3)
B
C<-matrix(8:10,3,2)
C

Mylist<-list(A,B,C)
Mylist
class(Mylist)
lapply(Mylist,mean)

random<-c('This','is','random','vector')
random
lapply(random,nchar)

# sapply
sapply(Mylist,mean)
sapply(Mylist,median)

# mapply
mapply(sum,c(1,2,3),c(4,5,6),c(7,8,9))
m1=matrix(c(1,2,3,4))
m2=matrix(c(5,6,7,8))
mapply(sum,m1,m2)

# tapply
attach(iris)
View(iris)
tapply(Sepal.Length,Species,mean)
tapply(Sepal.Width,Species,median)

# Getting present working directory
getwd()

# Changing present working directory

setwd('path')

data=read.csv('path') or
data=read.csv(file.choose())
data=read.xlsx('path')

library(readxl)

install.packages('dplyr')
library(dplyr)
data()
data(mtcars)
View(mtcars)
?mtcars
head(mtcars)
tail(mtcars)
str(mtcars)
summary(mtcars)

# 1. filter or subset

filter(mtcars,cyl==8,gear==5)
filter(mtcars,cyl==8&gear==5)
filter(mtcars,cyl==8|gear==5)

# Select Columns
select(mtcars,mpg,cyl,gear)

# Select multiple Columns
select(mtcars,'carb',mpg:disp,'gear')

select(mtcars,mpg:disp,contains('ge'),contains('carb'))

# Exclude Columns

select(mtcars,c(-gear,-carb))
select(mtcars,-mpg:-disp)
select(mtcars,-contains('ge'))

filter(select(mtcars,gear,carb,cyl),cyl==8)

# starts with column letter
head(select(mtcars,starts_with('c')))

# arrange : re order rows
arrange(mtcars,cyl)
arrange(select(mtcars,'gear','cyl'),cyl)
arrange(select(mtcars,'gear','cyl'),desc(cyl))

# mutate: add new variables

temp<-mtcars
temp$new_variable<-temp$hp+temp$wt
View(temp)
str(temp)

temp$new_variable<-NULL
str(temp)

# dplyr approach
temp<-mutate(temp,mutate_new=temp$hp+temp$wt)
str(temp)
View(temp)

#unique

distinct(mtcars['cyl'])
distinct(mtcars[c('cyl','gear')])

# NA or NULL
c(1,2,3,4,NA,NULL)
sum(10,20,NA)
mean(c(2,2,2,2,NA),na.rm = T)
sum(10,20,NA)
sum(10,20,NA,na.rm = T)

# Frequency  of table values

table(mtcars$cyl)

# rowsums,columnsums,rowmeans and columnmeans

data('iris')
View(iris)
rowSums(iris[,-5])
colSums(iris[,-5])
rowMeans(iris[,-5])
colMeans(iris[,-5])

unique(iris$Species)

# no of rows
data('iris')
length(iris)
length(iris[,1])

# Which ()
which(iris$Petal.Width==0.2)

Range<-function(x){
  max(x,na.rm = T)-min(x,na.rm = T)
}

range(iris$Sepal.Length)
range(iris$Sepal.Width)
range(iris$Petal.Length)
range(iris$Petal.Width)

var(iris$Sepal.Length,na.rm = T)
var(iris$Sepal.Width,na.rm = T)
var(iris$Petal.Length,na.rm = T)
var(iris$Petal.Width,na.rm = T)

sd(iris$Sepal.Length,na.rm = T)
sd(iris$Sepal.Width,na.rm = T)
sd(iris$Petal.Length,na.rm = T)
sd(iris$Petal.Width,na.rm = T)
