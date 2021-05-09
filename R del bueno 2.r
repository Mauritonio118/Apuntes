library(readxl)
diamantes <- read_excel("C:/Users/Usuario/Desktop/R/diamantes.xlsx")
View(diamantes)

#################
# CAP 1: BASICO #
#################

#Para correr codigo: Seleccionar y Ctrl + Enter

#Operacion Matematica
5+6/2-7*3  #Basicos

2**6  #potencias 
2^6

5%/%2  #Divicion entera


#Operacion logica. 
&  #Y
TRUE & TRUE  #TRUE
FALSE & TRUE  #FALSE

| #O
TRUE | FALSE  #TRUE
FALSE | FALSE #FALSE

! # NO
! TRUE #FAlSE
! FALSE #TRUE

== #Iguales?
TRUE == TRUE #TRUE
FALSE == TRUE #FALSE
FALSE == FALSE #TRUE

!= #Distintos?
TRUE != TRUE #FALSE
FALSE != TRUE #TRUE
FALSE != FALSE #FALSE

sum(vetor_TF) #Suma los TRUE
mean(vetor_TF)  #Promedia los TREU y FALSE. Porcentage de TRUE


#Funciones basicas
log(10)       #Log base e
exp(2.302585) #Exponencial
log10(10)     #Log base 10
sqrt(4)       #Raiz
abs(-20)      #Valor absoluto
ceiling(x)    #Menor que x
floor(x)      #Mayor que X
trunc(10.154987)   #Truncar hasta el entero
round(x,n)    #Redondear x con n decimales
choose(n,k)   #Combinatoria n sobre k
factorial(10) #factorial n!


"Soy puro bla bla"  # Entre " " es texto



#############################################
# CAP 2: CREACION Y MANIPULACION DE OBJETOS #
#############################################

rm(x)  #Remove, borra el objeto x
ls()   #Entrega todos los objetos creados
rm(list = ls()) #Borrar todos los objetos creados
objects(diamantes)

#OBJETOS
escalar = 5  #Escalar, una dimencion

vector = c(1,2,3,4,5,6,7,9,10,11,12)  #Vector, conjunto de datos (misma naturaleza)
vector  #Muestra el vector
vector[x]  #Entrega el dato de la pocicion x del vector
vector[3]
vector[-x]  #Entrega todos los datos exepto los de la pocicion X
vector[-3]
vector[c(x,y,z)]  #Entrega los datos de las pociciones x y z
vector[c(5,1,11)]
vector[-c(x,y,z)] #Entrega los datos exepto lo de las pociciones x y z
vector[-c(5,1,11)]

matriz = matrix(c(1,2,3,4,5,6,7,8,9,10,11,12),nrow = 3,ncol = 4,byrow = F) # Conjunto vectores, byrow: indexado por fila, nrow: num filas, ncol:num columnas
matriz      #muestra la matriz
matriz[x,y] #Entrega el dato de coordenadas x,y (Fila,Columna)
matriz[3,2]
matriz[x,]  #Entrega los datos de la fila x
matriz[2,]
matriz[,y]  #Entrega los datos de la columna y
matriz[,3]

array #Union de matrices - misma naturaleza (No para el curso)

lista #Union de objetos, independiente a su forma (similar a un vector)

data_frame #Union de vectores, distinta naturaleza (similar a una matriz)



###########################################################
# CAP 3: MANIPULACION DE OBJETOS Y ESTRUCTURAS DE CONTROL #
###########################################################

#Manipulacion de Data Frames
head(diamantes)   #Muestra los primeros 6 registros
tail(diamantes)   #Muestra los ultimos 6 registros
dim(diamantes)    #filas y columnas del objeto
length(diamantes) #Muestra el numero de objetos dentro del objeto
str(diamantes)    #Estructura de los datos 
class(diamantes)  #Naturaleza del objeto
names(diamantes)  #Nombre de los objetos
P <- na.omit(P)   #Elimina los valores vacios en vector P

#Operacion con Data Frames
diamantes$precio    #Signo $ accede a un objeto dentro del data frame
diamantes$precio[x] #Entrega dato en la pocicion x
diamantes$precio[1]
diamantes$precio[x] > y #Compara dato de pocicion x con valor y. Bool
diamantes$precio[1] > 100
diamantes$precio > y  #Compara cada valor con y. Vector de Bool 
diamantes$precio > 1000
log(diamantes$precio) #Aplica funcion a cada valor. Vector de escalares
diamantes$precio*diamantes$largo #Opera pocicion a pocicion

gatos = diamantes$precio > 1000  #Define nuevo objeto

#Funciones en Data Frames
sum(diamantes$precio)  #suma
mean(diamantes$precio) #Promedio
grep("Bueno",diamantes$corte) #Buscar. Vector de pociciones
gsub("Ideal","Exelente", diamantes$corte) #Reemplazar. SOLO IMPRIME. "Ideal" por "Exelente"; en datos "corte"
substr(diamantes$corte, 1,3) #Extrae los caracteres del rango especificado. SOLO IMPRIMNE

#Cambiar datos
diamantes$corte = gsub("Ideal","Exelente", diamantes$corte)  #Reemplaza en el Data Frame
corte_abreviado = substr(diamantes$corte, 1,3)  #Crea Objeto



#FILTROS
#Idea 1
filtro_buenos = grep("Bueno",diamantes$corte) # Vector con las pociciones de diamantes "buenos"
diamantes$precio[filtro_buenos] #Aplica filtro de pociciones de diamantes "buenos" a los datos de "precio"

#Idea 2
diamantes$precio[diamantes$corte == "Bueno"]  #Aplica filtro de pociciones de diamantes "buenos" a los datos de "precio"


#Estructuras de control

ifelse(Prueba_logica,TRUE,FALSE)  #Estructura ifelse
ifelse(99>50,"verdadero","falso")
ifelse(20>50,"verdadero","falso")

ifelse(diamantes$quilate>0.5,"happy", "sad")
ifelse(diamantes$quilate>0.5 & diamantes$precio>5000,"happy", "sad")



for (i in start:end){    #Estructura For in range
  operatoria(i)
}

for (i in 1:10){    
  print(i**3-1)
}


for(i in 1:length(diamantes$precio)){    #si el precio esta sobre 5000 imprime "caro" sino imprime "barato"
  if(diamantes$precio[i]>5000){
    print("Caro")
  }else{
    print("barato")
  }
}




########################################
# CAP 4: ANALISIS DESCRIPTIVO DE DATOS #
########################################

as.numeric(objeto)   #Transforma a numerico
as.Daate(objeto)     #Transforma a fecha
as.character(objeto) #Trasforma a caracter
as.factor(objeto)    #Transforma a factor


summary(diamantes)         #Resumen cuartiles, media, mediana
summary(diamantes$precio)

mean(diamantes$precio)   #Calcula promedio
median(diamantes$precio) #Entrega la mediana
sd()/mean()              #Coeficiente de variacion
min(diamantes$precio)    #Entrega valor minimo
max(diamantes$precio)    #Entrega valor maximo
quantile(diamantes$precio,probs = 0.6) #Entrega resumen de cuantiles o cuantiles especificos 
mfv()                    #Modas  Libreria modeest

var(diamantes$precio)  #Calcula varianza 
sd(diamantes$precio)   #Calcula desviacion estandar
cov(diamantes$precio,diamantes$quilate)  #Calcula covarianza
cor(diamantes$precio,diamantes$quilate)  #calculacorrelacion

IQR(diamantes$precio)    #Diferencia entre primer y tercer cuartil

table(diamantes$corte)  #Tabula los datos. Ideal para datos cualitativos
prop.table()   #Recive una tabla y la lleva a porcentaje
prop.table(table(diamantes$corte))  
round()     #Redonde, sirve para tablas
round(prop.table(table(diamantes$corte))*100,1)

#Cambiar de caracter a factor ordenado
diamantes$corte = ordered(factor(diamantes$corte), levels= c("Regular","Bueno","Muy bueno","Premium","Ideal"))

table(diamantes$corte,diamantes$color)  #Tabla cruzada/doble_entrada/contingencia
prop.table(table(diamantes$corte,diamantes$color),1)  #Porcentage por fila
prop.table(table(diamantes$corte,diamantes$color),2)  #Porcentage por columna
round(prop.table(table(diamantes$corte,diamantes$color))*100,2)  #Porcentuable y redondeable 

aggregate(objeto_numerico~objeto_cualitativo, FUN=funcion_aplicada)  #Aplica una funcion a datos agrupados segun factor/caracter
aggregate(diamantes$precio~diamantes$corte, FUN=mean)
aggregate(diamantes$precio~diamantes$corte+diamantes$color, FUN=max)


#Graficos Discretos
barplot(table(diamantes$color))  #Grafico de barras. Input=table
barplot(table(diamantes$color),main = "colores")  #Agrega titulo
barplot(table(diamantes$color),col = "red")  #Agrega color
barplot(table(diamantes$color),col = rainbow(7))  #Agrega paleta de colores

pie(table(diamantes$color))  #Grafico de torta




#Graficos Continuos

hist(diamantes$quilate)  #Histograma. Frecuencia

hist(diamantes$quilate, main = "Quilates") # Agrega titulo
hist(diamantes$quilate, col= "green")  #Agrega color
hist(diamantes$quilate, las = 1)   #Orientacion numeros ejes. Recomendado 1
hist(diamantes$quilate, xlab = "Quilates", ylab = "Frecuencia")  #Nombre ejes
hist(diamantes$quilate, border = "red")  #modifica color del borde de las barras. Negro por defecto


boxplot(diamantes$precio)  #Grafico de caja
boxplot(diamantes$precio~diamantes$corte) #continua y discreta
boxplot(diamantes$precio~diamantes$corte+diamantes$color)

boxplot(diamantes$precio~diamantes$corte,main = "Precios segun corte",col= rainbow(7),las = 1,xlab = "Corte", ylab = "Distribucion",border = "blue")  #Mismas modificaciones que hist()


plot(diamantes$precio,diamantes$quilate)  #Nubes de puntos. Ideal para graficar varias continuas

lines()  #Agrega un plot sobre un grafico ya existente


#########################################
# CAP 5: DISTRIBUCIONES DE PROBABILIDAD #
#########################################




#############################
# CAP 6: ESTIMACION PUNTUAL #
#############################

sample(diamantes$precio, 200)   #Saca una muestra tamaño 200

#Teorema central del limite

hist(diamantes$precio)

promedio = c()
for (i in 1:1000){
  muestra = sample(diamantes$precio, 200)
  promedio[i] = mean(muestra)
}
promedio
hist(promedio)

mean(promedio)
var(promedio)

mean(diamantes$precio)     #E(promedio) = mu
var(diamantes$precio)/200   #Var(promedio) =sigma^2/N


#Estimacion maximo verosimil

library(MASS) #libreria de estimaciones puntuales

options(scipen =999)  #Arreglar notacion cientifica

x = rnorm(2000000 ,100 , 5)
fitdistr(x, "normal")



hist(diamantes$precio)
fitdistr(diamantes$precio,"exponential")
fitdistr(diamantes$precio,"lognormal")
fitdistr(diamantes$precio,"normal")


library(fitdistrplus)
fitdist(data = Vector, distr = "distribucion", method = "metodo")   #Medodos mme=Estimador de momentos   mle=maxima verocimilitud 


#Curvas de denciadad


hist(diamantes$precio, prob=T, las=1, col="green",xlab = "precio")

eje_x = seq(0, 20000, by = 10)   #Secuencia de numeros de 10 en 10

fitdistr(diamantes$precio,"exponential")
eje_y_exp = dexp(eje_x,0.000253040730)      #Crea los valores del eje y segun exponencial


fitdistr(diamantes$precio,"normal")
eje_y_norm = dnorm(eje_x,3951.93296,4023.03414)   #Crea los valores del eje y segun normal

lines(eje_x, eje_y_exp, col="red", lwd=2)     #Grafica una linea a partir de los datos
lines(eje_x, eje_y_norm, col="blue", lwd=2)    #Grafica una linea a partir de los datos


#####################################
#Capitulo 7: Intervalos de confianza#
#####################################

mean(diamantes$precio)
+sd(diamantes$precio)

#Intervalo de confianza para la media
#Confianza= 1 - Alfa
#confianza = 95% ->Alfa = 5%
alfa = 1-0.95

mean(diamantes$precio) - qnorm(1-alfa/2, 0,1)*sqrt(var(diamantes$precio)/2700)
mean(diamantes$precio) + qnorm(1-alfa/2, 0,1)*sqrt(var(diamantes$precio)/2700)

library(TeachingDemos)
z.test(diamantes$precio, stdev= sd(diamantes$precio), conf.level = 0.95)$conf.int
t.test(diamantes$precio, conf.level = 0.95)$conf.int

#Grafico
promedio= c()
for (i in 1:1000){
  muestra = sample(diamantes$precio, 1000)
  promedio[i] = mean(muestra)
}
hist(promedio, las=1, col="skyblue", border="white", main="Distribucion promedio del precio", xlab = "Precio promedio", ylab = "")

abline(v=c(3800,4103), col="red")

boxplot(diamantes$precio, las=1, col="skyblue",border="green",main="Distribucion promedio del precio")

plot(diamantes$precio, diamantes$ancho)

summary(diamantes$precio)

#Intervalo de confianza de Varianza:
var(diamantes$quilate)

(2700-1) * var(diamantes$quilate) /qchisq(0.975,2700-1)
(2700-1) * var(diamantes$quilate) /qchisq(0.025,2700-1)

sigma.test(diamantes$quilate, conf.level = 0.95)$conf.int

#Intervalo de Confianza para la desviacion estandar

sqrt(var(diamantes$quilate))
sqrt(sigma.test(diamantes$quilate, conf.level = 0.95)$conf.int)

#Intervalo de Confianza para la proporcion

table(diamantes$corte)
p = 711/2700
771/2700

p - qnorm(0.975,0,1)*sqrt(p*(1-p)/2700)
p + qnorm(0.975,0,1)*sqrt(p*(1-p)/2700)

prop.test(771,2700, conf.level = 0.95)$conf.int


#Intervalo para la comparacion de varianzas
var.test(banco$Income[educacion==0],banco$Income[educacion==1])

#Intervalo para compraracion de medias
#MU1 es Y, Mu2 es X

t.test(banco$Income[educacion==0],banco$Income[educacion==1],var.equal = F) #var.equal=varianzas iguales?

#Calcular valor -p para una proporcion
# H0: p>=0.5 vs. H1: p<0.5
p.gorro<-20/50
p0<-0.5
n<-50
z0<-(p.gorro-p0)/sqrt((p0*(1-p0))/n)
valor.p<-pnorm(z0)
