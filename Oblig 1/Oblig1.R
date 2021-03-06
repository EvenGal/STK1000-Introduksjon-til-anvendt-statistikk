#Henter inn dataen og legger dataen i datasettet penn
data = "http://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig1/pennsylvania.txt"
penn <- read.table(data, header=TRUE)
#Plotter et histogram over porosity, som gir et plott over frekvensen
hist(penn$porosity, xlab='Prosent')
#Regner ut gjennomsnittet av alle porosity målingene
mean(penn$porosity)
#Regner ut medianen av alle porosity målingene
median(penn$porosity)
#Regner ut standardavviket av alle porosity målingene
sd(penn$porosity)
#Regner ut interkvartile avstand (IQR) av målingene
IQR(penn$porosity)
#Sjekker om porosity er normalfordelt ved qqnorm() og qqline()
qqnorm(penn$porosity)
qqline(penn$porosity)
#Gir uttrykk for den standardiserte verdien av porosity, der x er porosity verdier
(x - mean(penn$porosity))/sd(penn$porosity)
#Regner ut den standardiserte verdien av porosity = 14%
(14 - mean(penn$porosity))/sd(penn$porosity)
#Regner ut andelen av borepr�ver som har por�sitet lavere enn 8% med pnorm()
pnorm(8, mean(penn$porosity), sd(penn$porosity), lower.tail = TRUE, log.p = FALSE)
#Regner ut andelen av borepr�ver som har por�sitet h�yere enn 15%
pnorm(15, mean(penn$porosity), sd(penn$porosity), lower.tail = FALSE, log.p = FALSE)





