data="http://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig1/kjerneprover.txt"
kjerneprover <- read.table(data,header=TRUE)
#Lager en oppsummering av den kategoriske variabelen depth
#Først et table
table(kjerneprover$depth)
#Deretter en pie chart av tablet vårt
pie(table(kjerneprover$depth))

#Deler opp dataene i to datasett, ett som inneholder prøvene tatt på dypt vann
kjerneprover.dypt <- kjerneprover[kjerneprover[, "depth"]==1,]
#Og ett som inneholder prøvenes som ikke er tatt på dypt vann
kjerneprover.grunt <- kjerneprover[kjerneprover[, "depth"]==0,]

par(mfrow=c(2,2)) 
#Histogram for kjerneprøver tatt i dypt vann
hist(kjerneprover.dypt$sand)
#Boksplott for kjerneprøver tatt i dypt vann
boxplot(kjerneprover.dypt$sand)
#Histogram for kjerneprøver som ikke er tatt i dypt vann
hist(kjerneprover.grunt$sand)
#Boksplott for kjerneprøver som ikke er tatt i dypt vann
boxplot(kjerneprover.grunt$sand)


#Finner gjennomsnitt og median av andel sand i prøvene for begge datasett
mean(kjerneprover.dypt$sand)
mean(kjerneprover.grunt$sand)

#Tar summary av begge datasett
summary(kjerneprover.dypt$sand)
summary(kjerneprover.grunt$sand)

#Finner gjennomsnitt og standardavvik
mean(kjerneprover.dypt$sand)
mean(kjerneprover.grunt$sand)
sd(kjerneprover.dypt$sand)
sd(kjerneprover.grunt$sand)

#Sjekker først med qqnorm på prøvene tatt på dypt vann
qqnorm(kjerneprover.dypt$sand)
qqline(kjerneprover.dypt$sand)


#Sjekker med qqnorm på prøvene som ikke er tatt på dypt vann
qqnorm(kjerneprover.grunt$sand)
qqline(kjerneprover.grunt$sand)

summary(vitruvisk)

summary(vitruvisk$fot.navle, vitruvisk$kroppslengde)
