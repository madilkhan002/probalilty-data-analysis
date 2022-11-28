cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","NULL","numeric","NULL",
                                 "NULL","NULL","NULL","NULL"))
death_cases = c(0)
for (a in cases[1])
{
  death_cases =  append(death_cases,a)
}

median = median(death_cases,na.rm=TRUE);
iqr = IQR(death_cases,na.rm=TRUE);
sum = sum(death_cases,na.rm=TRUE);


res <- c(median,iqr,sum);

print(res);