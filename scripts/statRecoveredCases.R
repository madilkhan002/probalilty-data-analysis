cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","NULL","NULL","numeric",
                                 "NULL","NULL","NULL","NULL"))
recover_cases = c(0)
for (a in cases[1])
{
  recover_cases =  append(recover_cases,a)
}

median = median(recover_cases,na.rm=TRUE);
iqr = IQR(recover_cases,na.rm=TRUE);
sum = sum(recover_cases,na.rm=TRUE);


res <- c(median,iqr,sum);

print(res);