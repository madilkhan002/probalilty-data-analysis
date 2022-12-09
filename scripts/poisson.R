cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","NULL","numeric","NULL",
                                 "NULL","NULL","NULL","NULL"))
death_cases = c(0)
for (a in cases[1])
{
  death_cases =  append(death_cases,a)
}

death = sum(death_cases)

v <- c(death);

cases =  read.csv("data.csv",header = TRUE,sep = ",",
                  colClasses = c("NULL","NULL","NULL","NULL"
                                 ,"NULL","numeric","NULL","NULL",
                                 "NULL","NULL","NULL","NULL"))
confirm_cases = c(0)
for (a in cases[1])
{
  confirm_cases =  append(confirm_cases,a)
}

confirm = sum(confirm_cases)

v = append(v,confirm);

prob = (death/confirm);

v = append(v,prob);

average_death_rate = prob * confirm;

v = append(v,average_death_rate);


atleast = dpois(x = average_death_rate,lambda = average_death_rate)

exactly = ppois(q = average_death_rate,lambda = average_death_rate) 

v = append(v,atleast);
v = append(v,exactly);

options(scipen=10000)
# death,confimr,prob,avg_death_rate,atleast,exactly
print(v);

