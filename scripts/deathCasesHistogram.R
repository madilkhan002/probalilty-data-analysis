cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","NULL","numeric","NULL",
                                 "NULL","NULL","NULL","NULL"))
death_cases = c(0)
for (a in cases[1])
{
  death_cases =  append(death_cases,a)
}

options(scipen=10000)

jpeg(file="D:/web/Prob Project/public/images/deathCasesHistogram.jpeg",
    width=600, height=350)
hist(death_cases, col="green")
dev.off()