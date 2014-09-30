--- 
title       : Statystyka i rachunek prawdopodobieństwa
subtitle    : Pierwsze zajęcia
author      : Piotr Sobczyk
job         : PWr
logo        : pwr.jpg
biglogo     : znak_pwr.png
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : zenburn      # 
widgets     : [bootstrap, quiz]            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides

--- .big-background-slide

## Kilka uwag 

* Program kursu dostępny jest na stronie [klik](http://im.pwr.edu.pl/documents/dydaktyka/karty/og/stacjonarne/pl/MAP3016.pdf)
* Moja strona: [im.pwr.edu.pl/~sobczyk](http://im.pwr.edu.pl/~sobczyk)
* Kontakt ze mną przez maila Piotr.Sobczyk[at]pwr.edu.pl -- proszę nie używać edukacji
* [Strona instytutu](http://www.im.pwr.edu.pl)

--- .background-slide &twocol

## Zasady zaliczania ćwiczeń


*** =left
| Liczba punktów | Ocena  |
| -------------  |:------:|
| <25            | 2      | 
| 25-30          | 3.0    |
| 30-35          | 3.5    |
| 35-40          | 4.0    |
| 40-45          | 4.5    |
| 45-50          | 5.0    |
| >50            | 5.5    |

*** =right

> 1. Dwa 45-minutowe kolokwia - każde po 25 punktów
> 2. Do tego można zdobyć do 10 punktów za aktywność
> 3. Od **3.5** zwolnienie z egzaminu

--- .big-background-slide

## Rzeczy do zapamiętania

> * Analiza danych jest niezbędna w pracy inżyniera
> * Pomaga zrozumieć świat **(http://www.gapminder.org/)**
> * Rachunek prawdopodobieństwa to język dla statystyki

--- .big-background-slide

## Co dzisiaj zrobimy?

> * Pokaz krótkiej analizy danych
> * Zaprezentowanie użyteczności języka R
> * Przerobimy kilka zadań z prawdopodobieństwa

--- .background-slide
## Przykładowa mini-analiza



Mamy rzeczywiste dane dotyczące 130 państw. 
Dane te zawierają dwa wskaźniki:

* Pierwszy to śmiertelność niemowlaków na 1000 urodzeń żywych.
* Drugi to PKB per capita w dolarach amerykańskich.

```
##                infant.mortality  gdp
## Afghanistan                 154 2848
## Albania                      32  863
## Algeria                      44 1531
## American.Samoa               11   NA
## Andorra                      NA   NA
## Angola                      124  355
```


---.big-background-slide
## Jakie pytania możemy zadać?

> 1. Jaki kraj jest najbogatszy?
> 2. Jaki kraj ma największą śmiertelność niemowląt?
> 2. Jaka jest średnia śmiertelność niemowląt?
> 3. Jak duże różni się PKB w różnych krajach?
> 4. Czy istnieją biedne kraje o niskiej śmiertelności niemowląt?
> 3. Czy istnieje związek pomiędzy śmiertelnością niemowląt a bogactwem kraju?

--- .background-slide
## Wizualizacja
Pierwszym elementem analizy danych powinna być wizualiazacja

<img src="assets/fig/unnamed-chunk-3.png" title="plot of chunk unnamed-chunk-3" alt="plot of chunk unnamed-chunk-3" style="display: block; margin: auto;" />


Niezbyt dobrze jeśli chodzi o Polskę...

--- .background-slide
## Na poprawę narodowego ego
<img src="assets/fig/unnamed-chunk-4.png" title="plot of chunk unnamed-chunk-4" alt="plot of chunk unnamed-chunk-4" style="display: block; margin: auto;" />


Oczywiście reszta świata też poszła w tym czasie do przodu...

--- .big-background-slide
## Co dalej z naszą analizą?

> * Na podstawie wykresu przypuszczamy, że jest zależność
> * Czy jest ona istotna? [klik](http://www.tylervigen.com/)
> * To da się policzyć!

--- .big-background-slide

## Co dalej z naszą analizą?

> * Często stosowana metoda nazywa się regresją liniową.
> * Opisuje ona sytuację, w które
  zalezność pomiędzy zjawiskami, które próbujemy powiązać jest liniowa.
> * Nie pasuje to do naszych danych! Ale wytrenowany statystyk potrafi zrobić małe oszustwo...

--- .background-slide
## Rozważamy logarytmy z PKB per capita

<img src="assets/fig/unnamed-chunk-5.png" title="plot of chunk unnamed-chunk-5" alt="plot of chunk unnamed-chunk-5" style="display: block; margin: auto;" />


--- .big-background-slide
Teraz liczymy regresję liniową (poznamy ją w trakcie semestru):

```
## 
## Call:
## lm(formula = UN[, 1] ~ log(UN[, 2]))
## 
## Residuals:
##    Min     1Q Median     3Q    Max 
## -62.67 -16.80  -0.45  11.06 117.37 
## 
## Coefficients:
##              Estimate Std. Error t value Pr(>|t|)    
## (Intercept)    168.65       9.08    18.6   <2e-16 ***
## log(UN[, 2])   -16.60       1.18   -14.1   <2e-16 ***
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 27.1 on 191 degrees of freedom
##   (14 observations deleted due to missingness)
## Multiple R-squared:  0.509,	Adjusted R-squared:  0.506 
## F-statistic:  198 on 1 and 191 DF,  p-value: <2e-16
```

Gwiazdki wskazują na to, że zależność jest istotna!

--- .big-background-slide

Zobaczymy jak wyglądają nasze przewidywania (czerwona linia)

<img src="assets/fig/unnamed-chunk-7.png" title="plot of chunk unnamed-chunk-7" alt="plot of chunk unnamed-chunk-7" style="display: block; margin: auto;" />


--- .big-background-slide

## Możemy przewidywać śmiertelność w oparciu o PKB:
  
> * Jaka byłaby śmiertelność noworodków w Szkocji?
> * Korzystając z modelu liniowego podajemy nasze przewidywania i jest ono, miejmy nadzieję, bliskie prawdy
> * To metoda stosowana w praktyce!

--- .big-background-slide

## I teraz najważniejsze pytanie: 

> * Czy można powiedzieć, że wysokie PKB jest wpływa na śmiertelność noworodków?
> * <center> ![Image](assets/img/Grumpy-cat-no1.jpg) </center>

--- .big-background-slide

## Dlaczego?

> * Nie musi być wynikania! Współzależność to nie wynikanie!
> * W godzinach szczytu rośnie liczba tramwajów i samochodów co nie oznacza, że obecność tramwajów przyciąga auta
> * Może istnieje inna, wspólna przyczyna obu tych zjawisk?
> * Np. kwestia klimatu (dżungla może sprzyjać chorobom)


--- &twocol

## Sprawdzamy nasze podejrzenia
Które państwa nie pasują do naszego modelu?
*** =left
Bogate kraje o wysokiej śmiertelności

```
##                      infant.mortality   gdp
## Iraq                               95 11308
## French.Guiana                      22 23530
## New.Caledonia                      18 19450
## Qatar                              17 14013
## United.Arab.Emirates               15 17690
## Bahamas                            14 12545
```


*** =right
Biedne kraje o niskiej śmiertelności

```
##                       infant.mortality gdp
## Bosnia                              13 271
## Korea.Dem.Peoples.Rep               22 271
## Azerbaijan                          33 321
## Georgia                             23 343
## Armenia                             25 354
## Moldova                             26 383
```


---

![Image](assets/img/tlo_wykres.jpg)

--- {
 tpl: thankyou, 
 social: [{title: GQU, href: "http://grupa-qu.pl/"},
  {title: R, href: "http://www.r-project.org/"}, 
  {title: Ja, href: "http://im.pwr.edu.pl/~sobczyk"}]
}

## Pytania?

Slajdy są dostępne na mojej stronie internetowej
