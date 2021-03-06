data = "http://www.uio.no/studier/emner/matnat/math/STK1000/data/obligdata/oblig1/vitruvisk.txt"
vitruvisk <- read.table(data,header=TRUE)

#Bruker table funksjonen for � finne antallet av hver kategorisk variabel
table(vitruvisk$kjonn)
#Bruker summary for fem-punkts oppsummering for kroppslengde og fot.navle
summary(vitruvisk)

#Lager et spredningsplott for fot.navle p� x-aksen og kroppslengde p� y-aksen. 
plot(vitruvisk$fot.navle, vitruvisk$kroppslengde, xlab="Avstand fra gulv til navle", ylab="Total kroppslengde")

#Tilpasser en line�r modell for sammenheng mellom navleh�yde og kroppslengde
fit <- lm(vitruvisk$kroppslengde ??? vitruvisk$fot.navle) 
abline(fit)

#Regner ut korrelasjonen mellom fot.navle og kroppslengde
cor(vitruvisk$fot.navle, vitruvisk$kroppslengde)

#Finner skj�ringspunkt og stigningstall til den line�re modellen fit
summary(fit)

coef(fit)

#Lager et plott av residualene i modellen
plot(vitruvisk$fot.navle,residuals(fit))
abline(h=0)

