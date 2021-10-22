#Oppgave 1
#a)
#Laster inn dataene
data <- "https://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig2/earthquakes.txt"
earthquakes <- read.table(data, header=TRUE)
#Lager et histogram over dataene
hist(earthquakes$magnitude, xlab='Jordskjelvets styrke (Richters skala)')
#Sjekker om styrken til jordskjelvet er tilnærmet normalfordelt ved qqnorm()
qqnorm(earthquakes$magnitude)
qqline(earthquakes$magnitude)

#b)
#Regner ut gjennomsnittlig størrelse og standardavvik av alle jordskjelvene
mean(earthquakes$magnitude)
sd(earthquakes$magnitude)

#c)
#Trekker et tilfeldig utvalg av 50 jordskjelv fra datasettet
magnitude = earthquakes$magnitude
sample_x = sample(magnitude, 50)
mean(sample_x)

#d)
#Trekker et tilfeldig utvalg av 100 jordskjelv fra datasettet
meanvec <- rep(0, 100)
for(i in 1:100) {
  sample.now <- sample(magnitude, 50)
  meanvec[i] <- mean(sample.now)
}
#Plotter et histogram av gjennomsnittet til meanvec
hist(meanvec)

#e)
#Teoretiske verdier, basert på verdiene fra oppgave b)
mean(earthquakes$magnitude)
sd(earthquakes$magnitude)/sqrt(713)

#Empiriske verdier, basert på de hundre simulerte gjennomsnittene i vektoren meanvec
mean(meanvec)
sd(meanvec)/sqrt(100)

#f)
#For 10 jordskjelv
meanvec2 <- rep(0, 100)
for(i in 1:100) {
  sample.now <- sample(magnitude, 10)
  meanvec2[i] <- mean(sample.now)
}
mean(meanvec2)
sd(meanvec2)
#For 100 jordskjelv
meanvec3 <- rep(0, 100)
for(i in 1:100) {
  sample.now <- sample(magnitude, 100)
  meanvec3[i] <- mean(sample.now)
}
mean(meanvec3)
sd(meanvec3)

#g)
#Regner først ut for n = 10
pnorm(4, mean(meanvec2), sd(meanvec2), lower.tail = FALSE)
#Regner ut for n = 50
#For 50 jordskjelv
meanvec4 <- rep(0, 100)
for(i in 1:100) {
  sample.now <- sample(magnitude, 50)
  meanvec4[i] <- mean(sample.now)
}
pnorm(4, mean(meanvec4), sd(meanvec4), lower.tail = FALSE)
#Regner ut for n = 100
pnorm(4, mean(meanvec3), sd(meanvec3), lower.tail = FALSE)



