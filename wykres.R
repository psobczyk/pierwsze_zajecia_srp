# Enhanced Scatterplot of MPG vs. Weight
# by Number of Car Cylinders
library(car)
data(UN)
rownames(UN)[195:196] <- c("United Kingdom", "United States")
podzial <- sample(c("Azja i Afryka", "Europa", "Ameryka"), size=nrow(UN), replace=T)
jpeg("assets/img/tlo_wykres.jpg",width=1000, height=700, bg='cornsilk')
scatterplot(infant.mortality ~ log(gdp) | podzial, data=UN, pch=rep(23,3), cex.lab=2, 
            legend.coords="topright", legend.title='Kontynenty',
            bg=rep("black", 3), 
            col=c("coral2", "chartreuse4", "cornflowerblue"),
            xlab="", ylab="", axes=FALSE,
            labels=row.names(UN)) 
axis(1, at=log(c(50,500, 4000, 20000)), labels=c(50,500, 4000, 20000), 
     col="bisque4", col.ticks="bisque4", col.axis="bisque4", cex.axis=1)
axis(2, at=c(10, 50,100, 150), labels=c(10, 50,100, 150),
     col="bisque4", col.ticks="bisque4", col.axis="bisque4", cex.axis=1)
mtext("PKB [$]", side=1, line=3, col="red", cex=2.2)
mtext("śmiertelność na 1000 urodzeń żywych", side=2, line=3, col="red", cex=1.2)
title("Śmiertelności niemowląt a PKB w roku 1998", col.main="red", cex.main=2)
dev.off()

dane <- read.table("indicator gapminder population2.csv", sep=",",
                   header=T, stringsAsFactors=T)

wspolnePop <- which(dane[,1]%in%rownames(UN))
wspolneUN <- which(rownames(UN) %in% dane[,1])
cSize <- dane[wspolnePop,218]
names(cSize) <- dane[,1][wspolnePop]

danePop <- UN[wspolneUN,]
danePop <- cbind(danePop,cSize)

radius <- sqrt( danePop$cSize/ pi )

jpeg("assets/img/tlo_wykres.jpg",width=1200, height=800, quality=100, bg='gray98')
par(mar=c(4,5,4,0),mgp=c(3,1,0))
plot.new()
symbols( log(danePop$gdp),danePop$infant.mortality, circles=radius,
        inches=0.35, fg="white", bg="red",
        xlab="", ylab="", axes=F,
        xlim=c(3.7, log(51000)),
        ylim=c(0, 160))
axis(1, at=log(c(50,500, 5000, 25000, 50000)), labels=c(50,500, 5000, 25000, 50000), tick =T,
     col="bisque4", col.ticks="bisque4", col.axis="bisque4", cex.axis=1)
axis(2, at=c(0, 10, 50,100, 150), labels=c(0, 10, 50,100, 150),
     col="bisque4", col.ticks="bisque4", col.axis="bisque4", cex.axis=1)
mtext("PKB [$]", side=1, line=3, col="red", cex=2)
mtext("Śmiertelność na 1000 urodzeń żywych", side=2, line=3, col="red", cex=1.4)
mtext("Śmiertelności niemowląt a PKB w roku 1998", side=3, line=1, col="red", cex=2.2)
wybrane <- c(118,51,6,31,1, 97, 153, 67, 132, 64, 72, 44, 22)
text(log(danePop$gdp)[wybrane], danePop$infant.mortality[wybrane],
     names(cSize)[wybrane], cex=1.2, pos=1)
dev.off()
