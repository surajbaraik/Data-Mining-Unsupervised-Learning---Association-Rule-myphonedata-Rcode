

library("arules")
library("arulesViz")

Pdata <- read.csv(file.choose())

Pdata <- Pdata[4:9]
class(Pdata)

colnames(Pdata)

Pdata$red <- factor(Pdata$red,levels = c("1","0"),labels = c("ChildBks",""))
Pdata$white <- factor(Pdata$white,levels = c("1","0"),labels = c("white",""))
Pdata$green <- factor(Pdata$green,levels = c("1","0"),labels = c("green",""))
Pdata$yellow <- factor(Pdata$yellow,levels = c("1","0"),labels = c("yellow",""))
Pdata$orange <- factor(Pdata$orange,levels = c("1","0"),labels = c("orange",""))
Pdata$blue <- factor(Pdata$blue,levels = c("1","0"),labels = c("blue",""))


#library(car)
#library(carData)
#library(mvinfluence)

Pdata1 <- as(Pdata,"transactions")

itemFrequencyPlot(Pdata1,topN=15)

rules <- apriori(Pdata1, parameter = list(supp = 0.008, confidence = 0.60, minlen = 2, maxlen = 5))

inspect(head(sort(rules), n = 10))


plot(head(sort(rules, by = "lift"), n = 10), method = "graph", control = list(cex = 1.0)) #cex = font size

plot(rules)

plot(head(sort(rules), n = 10), method = "grouped", control = list(cex = 0.8))
