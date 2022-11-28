cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","numeric","NULL","NULL",
                                 "NULL","NULL","NULL","NULL"))
confirm_cases = c(0)
for (a in cases[1])
{
  confirm_cases =  append(confirm_cases,a)
}
options(scipen=10000)

jpeg(file="D:/web/Prob Project/public/images/confirmCasesBoxPlot.jpeg",
     width=600, height=350)
boxplot(confirm_cases, col="green")
dev.off()