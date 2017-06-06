library(ggplot2)

master <- read.table("Master_IA11pubB_Patient_Table_BM_Baseline.txt", header = TRUE, sep = "\t")
fnew<-master[,1:2]
  
fnew$Center <- substr(fnew$Study_Patient_ID, 1, 3)
t<-subset(fnew, fnew$Center<400)
t2 <- data.frame(table(t$Center))
t2$Var1<-factor(t2$Var1, levels=t2$Var1[order(t2$Freq)])

ggplot(t2, aes(x=Var1, y=Freq))+geom_bar(stat="identity", fill = "#d8b365", color = "black")+
  labs(title="Center Distribution", x="Center Number", y="Frequency")+coord_flip()
  


small<-subset(t2, t2$Freq<30)
ggplot(small, aes(x=Var1, y=Freq))+geom_bar(stat="identity", fill = "#5ab4ac", color = "black")+
  labs(title="Small Center Distribution--(Frequency<30)", x="Center Number", y="Frequency")+coord_flip()

sum(small$Freq) #431

large<-subset(t2, t2$Freq>30)
ggplot(large, aes(x=Var1, y=Freq))+geom_bar(stat="identity", fill = "#f6e8c3", color = "black")+
  labs(title="Large Center Distribution--(Frequency>30)", x="Center Number", y="Frequency")+coord_flip()

sum(large$Freq) #444



small$Var1<-factor(small$Var1, levels=small$Var1[order(small$Freq)])
large$Var1<-factor(large$Var1, levels=large$Var1[order(large$Freq)])

ggplot()+geom_bar(data=small, aes(x=Var1, y=Freq), stat="identity", fill="#5ab4ac", color = "black")+
  geom_bar(data=large, aes(x=Var1, y=Freq), stat="identity", fill="#f6e8c3", color = "black")+
  labs(title="Center Distribution with Color Depicted Frequency Variance", x="Center Number", y="Frequency")+
  geom_hline(aes(yintercept=30), colour="#543005", linetype="dashed")
  





