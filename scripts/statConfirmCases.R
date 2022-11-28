cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","numeric","NULL","NULL",
                                 "NULL","NULL","NULL","NULL"))
confirm_cases = c(0)
for (a in cases[1])
{
  confirm_cases =  append(confirm_cases,a)
}

median = median(confirm_cases);
iqr = IQR(confirm_cases);
sum = sum(confirm_cases);

res <- c(median,iqr,sum);

print(res);