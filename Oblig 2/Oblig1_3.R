#Oppgave 3
data <- "https://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig2/cameroonclay.txt"
cameroon <- read.table(data,header=TRUE)

#a)
#La til passende navn på aksene og tittel
clay1 <- cameroon$clay1
clay5 <- cameroon$clay5
plot(clay1, clay5, xlim = c(10, 80), ylim = c(10, 90), 
     xlab = "Clay 1: Prosentandel leire i det øverste laget (0-10 cm)", 
     ylab = "Clay 5: Prosentandel leire i det femte laget (40-50 cm)", 
     main = "Spredingsplott av clay 1 og clay 5")
#Figuren viser en lineær spredning mellom de to variabelene, legger derfor til en test av korrelasjon
cor(clay1, clay5)

#b)
#Lager en regresjonsmodell med gitt R-kode
fit <- lm(clay5 ~ clay1)
abline(fit)

#c)
#Bruker gitt R-kode for å inspisere residualene
#Residualplott
res <- residuals(fit)
plot(clay1, res)
abline(h = 0)
#QQ plott
qqnorm(res)
qqline(res)

#d)
#Finner stigningstall og skjæringspunkt for modellen
summary(fit)
#Regner ut hvor mye den forventede prosentandelen øker i lag fem når prosentandelen av leire i lag en øker med 1%

#e)
#Leser av p-verdi
summary(fit)

#f)
#Finner 95% konfidensintervall for stignignstallet i modellen
b1 <- summary(fit)$coefficients[2, 1]
se.b1 <- summary(fit)$coefficients[2, 2]
df <- fit$df.residual
lower <- b1 + qt(0.025, df) * se.b1
upper <- b1 + qt(0.975, df) * se.b1
se.b1
lower
upper


#g)
#Plotter modellens prediksjonsintervall og konfidensintervall for forventet respons
plot(clay1, clay5, xlim = c(10, 80), ylim = c(10, 90),
     xlab = "clay 1", ylab = "clay 5", main = "clay 5 vs clay 1")
abline(fit)
xval <- seq(0, 100, by = 0.01)
new <- data.frame(clay1 = xval)
pred.int <- predict(fit, newdata = new, interval = "prediction")
mean.int <- predict(fit, newdata = new, interval = "confidence")
matlines(xval, cbind(pred.int[, 2], pred.int[, 3]), lty = 2,
         col = "steelblue")
matlines(xval, cbind(mean.int[, 2], mean.int[, 3]), lty = 2,
         col = "tomato")

#h)
#Leser av 95% prediksjonsintervall for innholdet i det femte laget ved øvre og nedre verdi for x = 60





