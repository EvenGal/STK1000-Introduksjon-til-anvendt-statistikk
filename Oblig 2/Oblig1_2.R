#Oppgave 2
#a)
data <- "https://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig2/ozone.txt"
newyork <- read.table(data,header=TRUE)
newyork$Ozone
hist(newyork$Ozone)
#Sjekker etter eventuelle uteliggere med tommelfingerregelen
summary(newyork$Ozone)
#Q1 - 1.5 X IQR =
18 - 1.5*(41.5)
#q3 - 1.5 X IQR =
59.50 + 1.5*(41.5)
#Sjekker om ozone er normalfordelt
qqnorm(newyork$Ozone)
qqline(newyork$Ozone)

#b)


#c)
#Kjører t-test på variabelen fra deloppgave a)
ozonelevel <- c(30, 30)
t.test(newyork$Ozone, ozonelevel)

#d)
#90% konfidensintervall
t.test(newyork$Ozone, conf.level = 0.9)
#95% konfidensintervall
t.test(newyork$Ozone, conf.level = 0.95)
#99% konfidensintervall
t.test(newyork$Ozone, conf.level = 0.99)

#e)
oz.juli.august <- newyork[newyork$Month %in% c(7,8),"Ozone"]
oz.mai.juni.sept <- newyork[newyork$Month %in% c(5,6,9),"Ozone"]
t.test(oz.juli.august, oz.mai.juni.sept)

