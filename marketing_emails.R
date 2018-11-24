# Code to produce visualization of marketing emails from Best Buy, Walgreens, & Walmart

# Author: Benjamin O. Tayo

# Date: 11/24/2018

# Import Necessary Libraries

library(readr)
library(tidyverse)

# Data Importation and Preparation

df<-read.csv("advert.csv")
df<-df%>%mutate(digit = seq(5,1,-1))
df%>%head()
df2<-data.frame(digit=c(df$digit,df$digit,df$digit),type=sort(as.vector(replicate(5,c("BBY","WGN","WMT")))), 
                quantity=c(df$Best,df$Walgreen,df$Walmart))
df2%>%head(n=10)

# Generate Barplots for Data Visualization

df2%>%ggplot(aes(digit,quantity,fill=type))+geom_col(position = "dodge", width = 0.75)+
  xlab("month")+ ylab("quantity")+
  scale_x_continuous(breaks = as.integer(seq(1,5)), labels = c('Jul','Aug','Sep','Oct','Nov'))+
  ggtitle("quantity of marketing emails from BBY, WGN, & WMT in 2018")+theme_classic()+
  theme(
    plot.title = element_text(color="black", size=11, hjust=0.5, face="bold"),
    axis.title.x = element_text(color="black", size=11, face="bold"),
    axis.text.x = element_text(color="black", size=11, face="bold"),
    axis.text.y = element_text(color="black", size=11, face="bold"),
    axis.title.y = element_text(color="black", size=11, face="bold"),
    legend.title = element_blank()
  )
