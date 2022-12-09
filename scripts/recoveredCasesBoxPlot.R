cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","NULL","NULL","numeric",
                                 "NULL","NULL","NULL","NULL"))
recover_cases = c(0)
for (a in cases[1])
{
  recover_cases =  append(recover_cases,a)
}

options(scipen=10000)

jpeg(file="D:/web/Prob Project/public/images/recoveredCasesBoxPlot.jpeg",
    width=600, height=350)
boxplot(recover_cases, col="green")
dev.off()