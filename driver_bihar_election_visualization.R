library(ggplot2)
library(ggthemes)

pparty <- c(24.4, 18.4, 16.8, 9.4, 6.7, 4.8, 2.6, 2.3,
            2.1, 1.5, 1.4, 1.4, 1.0, 0.6, 0.6, 0.5, 0.3,
            0.3, 0.2, 0.2, 0.2, 0.1, 2.5, 1.7)
party <- c("BJP", "RJD", "JD(U)", "IND", "INC", "LJP",
           "BLSP", "HAMS", "BSP", "CPI(ML)L", "CPI",
           "JAPL", "SP", "CPM", "SHS", "NCP", "SKLP",
           "JMM", "GJDS", "AIMIM", "BMUP", "JDR",
           "NOTA", "Other")

data <- data.frame(party = party, pp = pparty)
data <- data[with(data, order(pp)), ]
data$party <- factor(data$party, levels = data$party)
p <- ggplot(data, aes(x = party, y=pp)) + geom_bar(stat = 
                                          "identity", color = "white", fill = "#bdbdbd") + coord_flip()

p <- p + theme_tufte()

p <- p + geom_text(aes(label = paste0(data$pp , "%"), hjust = -0.1))

p <- p + scale_y_continuous(expand = c(0.001, 0), limits = c(0, 26))

p <- p + theme(axis.ticks = element_blank())

p <- p + xlab("") + ylab("% vote shares of parties") + 
      ggtitle("Bihar 2015 Legistative Election: Partywise % Vote Share")

p
     
