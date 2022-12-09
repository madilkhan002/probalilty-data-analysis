df<-read.csv("data.csv",stringsAsFactors = FALSE)
simpleReg<-lm(Confirmed~Recovered,data=df)

options(scipen=1)

jpeg(file="D:/web/Prob Project/public/images/linearReg.jpeg",
    width=600, height=350)
plot(Confirmed~Recovered,data=df)
dev.off()